/**
 * Copyright (c) 2017, software group of fcsoft
 * All rights reserved.
 * <p>
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * <p>
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of the fcsoft nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package kr.co.fcsoft.core.orm;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import kr.co.fcsoft.core.bean.EntityObject;
import kr.co.fcsoft.core.dao.ObjectDao;
import kr.co.fcsoft.core.helper.HibernateUtil;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Restrictions;
import org.hibernate.engine.spi.SessionImplementor;//hibernate3 -> hibernate4 spi
import org.hibernate.metadata.ClassMetadata;
import org.mariapresso.impd.annotation.bean.Restriction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Sort;

public abstract class HibernateObjectDao implements ObjectDao {
    @Autowired
    protected SessionFactory sessionFactory;

    @Override
    public Page<?> findAll() throws RuntimeException {
        //TODO will be chage
        return findAllSorted(null);
    }

    @Override
    public Page<?> findAllSorted(EntityObject entityObject) throws RuntimeException {
        long total = 0;
        Page<?> result = null;
        try {
            Criteria criteria = getCriteria(entityObject);
            if (entityObject.isPageable()) {
                total = HibernateUtil.getRowCount(criteria, null);//Projections.countDistinct("stbId")
                sessionFactory.getCurrentSession().flush();

                setOrder(criteria, entityObject);
                criteria.setFirstResult((entityObject.getPageNumber() - 1) * entityObject.getPageSize());
                criteria.setMaxResults(entityObject.getPageSize());
                result = new PageImpl(criteria.list(), entityObject, total);
            } else {
                setOrder(criteria, entityObject);
                result = new PageImpl(criteria.list());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Page<?> findList(EntityObject entityObject) throws RuntimeException {
        // TODO I have not plan.
        Criteria criteria = getCriteria(entityObject);
        criteria.list();
        return null;
    }

    @Override
    public int findListCnt(EntityObject entityObject) throws RuntimeException {
        // TODO I have not plan.
        return 0;
    }

    @Override
    public EntityObject findObject(EntityObject entityObject) throws RuntimeException {
        Criteria criteria = getCriteria(entityObject);
        return (EntityObject) criteria.uniqueResult();
    }

    @Override
    public Serializable save(EntityObject entityObject) throws RuntimeException {
        try {
            Serializable result = sessionFactory.getCurrentSession().save(entityObject);
            sessionFactory.getCurrentSession().flush();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public void saveOrUpdate(EntityObject entityObject) throws RuntimeException {
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(entityObject);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(EntityObject entity, EntityObject... willBeChangedValue) throws RuntimeException {
        if (willBeChangedValue != null && willBeChangedValue.length > 0) {
            Criteria criteria = getCriteria(entity);
            List searchList = criteria.list();
            for (Object bean : searchList) {
                copyNotNullProperties((EntityObject) bean, willBeChangedValue[0]);
                sessionFactory.getCurrentSession().update(bean);
            }
        } else {
            sessionFactory.getCurrentSession().update(entity);
        }
    }

    @Override
    public void delete(EntityObject entityObject) throws RuntimeException {
        sessionFactory.getCurrentSession().delete(entityObject);
        /*if(hasKey(entityObject)) {
			deleteByKey(entityObject);
		} else {
			return deleteBySearchList(entityObject);
		}*/
    }

    public void deleteByKey(EntityObject entityObject) throws RuntimeException {
        sessionFactory.getCurrentSession().delete(entityObject);
        sessionFactory.getCurrentSession().flush();
    }

    @Override
    public int deleteBySearchList(EntityObject entityObject) throws RuntimeException {
        int result = 0;
        Criteria criteria = getCriteria(entityObject);
        List searchList = criteria.list();
        for (Object bean : searchList) {
            sessionFactory.getCurrentSession().delete(bean);
            result++;
        }
        return result;
    }

    protected Criteria getCriteria(EntityObject bean, Projection... rowCountProjection) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(bean.getClass());
        Object property;
        ClassMetadata cm = sessionFactory.getClassMetadata(bean.getClass());
        try {
            String id = cm.getIdentifierPropertyName();
            property = PropertyUtils.getProperty(bean, id);
            if (property != null && !"0".equals(StringUtils.trimToEmpty(property.toString())) && !"".equals(StringUtils.trimToEmpty(property.toString()))) {
                if (bean.getConditionMap().containsKey(id)) {
                    criteria.add((Criterion) bean.getConditionMap().get(id));
                } else {
                    criteria.add(Restrictions.eq(id, property));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Restriction restriction = null;
        for (String propertyName : cm.getPropertyNames()) {
            try {
                property = PropertyUtils.getProperty(bean, propertyName);
                if (property != null && !"".equals(StringUtils.trimToEmpty(property.toString()))) {
                    restriction = bean.getClass().getDeclaredField(propertyName).getAnnotation(Restriction.class);
//                    System.out.println(String.format("[%s] field=%s, value={%s}", restriction, propertyName, property));
                    if (null != restriction) {
                        criteria.add(restriction.value().get(propertyName, property));
                    } else {
                        criteria.add(Restrictions.eq(propertyName, property));
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (rowCountProjection != null && rowCountProjection.length > 0) {
            criteria.setProjection(rowCountProjection[0]);
        }
        return criteria;
    }

    /**
     * 정렬
     * @param criteria
     * @param bean
     */
    protected void setOrder(Criteria criteria, EntityObject bean) {
        if(null == bean.getSort()) {
            return;
        }
        Iterator iterator = bean.getSort().iterator();
        Sort.Order order = null;
        while(iterator.hasNext()) {
            order = (Sort.Order)iterator.next();
            criteria.addOrder(order.getDirection() == Sort.Direction.ASC ? Order.asc(order.getProperty()) : Order.desc(order.getProperty()));
        }
    }

    /**
     * 키필드에 값이 있는지 체크한다.
     * @param bean
     * @return
     */
    protected boolean hasKey(EntityObject bean) {
        Object property = sessionFactory.getClassMetadata(bean.getClass()).getIdentifier(bean, (SessionImplementor) sessionFactory.getCurrentSession());
        if (property == null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 바뀔 값이 있는 엔티티에서 필드를 찾아 원본에 복사한다.
     * @param origin 원본
     * @param value 바꿀 값
     */
    protected void copyNotNullProperties(EntityObject origin, EntityObject value) {
        Object property;
        String[] propertyNames = sessionFactory.getClassMetadata(value.getClass()).getPropertyNames();
        for (String propertyName : propertyNames) {
            try {
                property = PropertyUtils.getProperty(value, propertyName);
                if (null != property) {
                    PropertyUtils.setProperty(origin, propertyName, value);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
