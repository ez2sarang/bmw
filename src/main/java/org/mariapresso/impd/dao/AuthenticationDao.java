package org.mariapresso.impd.dao;


import org.mariapresso.impd.bean.entity.Session;
import org.mariapresso.impd.bean.entity.User;
import org.mariapresso.impd.bean.entity.UserGroup;

import java.io.Serializable;

/**
 * Created by ez2sarang on 15. 5. 11..
 */
public interface AuthenticationDao {
    User getUser(String userId) throws Exception;

    Session getSessionByUserId(String userId) throws Exception;

    Session getSessionByToken(String sessionToken, String... txToken) throws Exception;

    void saveSession(Serializable entity) throws Exception;

    UserGroup getJoinGroupByType(String groupType) throws Exception;
}
