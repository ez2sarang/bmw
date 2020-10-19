package org.mariapresso.impd.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.mariapresso.impd.bean.entity.JoinGroup;
import org.mariapresso.impd.bean.entity.Session;
import org.mariapresso.impd.bean.entity.User;
import org.mariapresso.impd.bean.entity.UserGroup;
import org.mariapresso.impd.dao.AuthenticationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

/**
 * Created by ez2sarang on 15. 4. 8..
 */
@Repository("authenticationDao")
public class AuthenticationDaoImpl implements AuthenticationDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public User getUser(String userId) throws Exception {
        Criteria criteria = sessionFactory.getCurrentSession()
                .createCriteria(User.class)
                .add(Restrictions.eq("userId", userId))
//                .add(Restrictions.eq("type", idType))
                ;
        return (User)criteria.uniqueResult();
    }

    @Override
    public Session getSessionByUserId(String userId) throws Exception {
        Criteria criteria = sessionFactory.getCurrentSession()
                .createCriteria(Session.class)
                .add(Restrictions.eq("userId", userId))
                ;
        return (Session)criteria.uniqueResult();
    }

    @Override
    public Session getSessionByToken(String sessionToken, String... txToken) throws Exception {
        Criteria criteria = sessionFactory.getCurrentSession()
                .createCriteria(Session.class)
                .add(Restrictions.eq("sessionTokenId", sessionToken))
                ;
        if(null != txToken && txToken.length>0) {
            criteria.add(Restrictions.eq("txTokenId", txToken[0]));
        }
        return (Session)criteria.uniqueResult();
    }

    @Override
    public void saveSession(Serializable entity) throws Exception {
        sessionFactory.getCurrentSession().save(entity);
    }

    @Override
    public UserGroup getJoinGroupByType(String groupType) throws Exception {
        Criteria criteria = sessionFactory.getCurrentSession()
                .createCriteria(UserGroup.class)
                .add(Restrictions.eq("type", groupType))
                ;
        return (UserGroup)criteria.uniqueResult();
    }
}
