package org.mariapresso.impd.dao.impl;

import kr.co.fcsoft.core.helper.HibernateUtil;
import kr.co.fcsoft.core.orm.HibernateObjectDao;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ez2sarang on 2015. 7. 9..
 */
@Repository("serviceDao")
public class ServiceDaoImpl extends HibernateObjectDao implements org.mariapresso.impd.dao.ServiceDao {

    @Override
    public void save(Serializable entity) throws Exception {
        sessionFactory.getCurrentSession().save(entity);
    }

    @Override
    public void saveOrUpdate(Serializable entity) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(entity);
    }

    /**
     * ?
     * @param entity
     * @throws Exception
     */
    @Override
    public void delete(Serializable entity) throws Exception {
        sessionFactory.getCurrentSession().delete(entity);
    }

    /**
     * ?
     * @param entity
     * @throws Exception
     */
    @Override
    public void update(Serializable entity) throws Exception {
        sessionFactory.getCurrentSession().update(entity);
    }

    @Override
    public Object get(Serializable entity) throws Exception {
        return sessionFactory.getCurrentSession()
                .createCriteria(entity.getClass())
                .add(Restrictions.eq("", "")).uniqueResult()
                ;
    }

    @Override
    public List list(Serializable entity) throws Exception {
        List result;
        try {
            Criteria criteria = sessionFactory.getCurrentSession()
                    .createCriteria(entity.getClass())
    //                .add(Restrictions.eq("", ""))
                    ;
            long rowCount = HibernateUtil.getRowCount(criteria);

            result = criteria.list();

            return result;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void saveFile(Serializable entity) throws Exception {

    }
}
