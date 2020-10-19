package org.mariapresso.impd.service;

import kr.co.fcsoft.core.bean.EntityObject;
import kr.co.fcsoft.core.bean.datatables.QueryModel;
import org.mariapresso.impd.bean.communicate.Join;
import org.mariapresso.impd.bean.communicate.Style;
import org.mariapresso.impd.bean.entity.User;
import org.mariapresso.impd.bean.entity.UserGroup;
import org.springframework.data.domain.Page;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ez2sarang on 2015. 7. 9..
 */
public interface UnityService {
    UserGroup getJoinGroupByType(String groupType) throws Exception;

    User getUser(String userId) throws Exception;

    void registUser(Join bean) throws Exception;

    void registStyle(Style style) throws Exception;

    void registCoupon(org.mariapresso.impd.bean.communicate.Coupon bean) throws Exception;

    void registGroup(org.mariapresso.impd.bean.communicate.Group bean) throws Exception;

    List list(Serializable bean) throws Exception;

    Page<?> findAllSorted(EntityObject object);

    EntityObject findObject(EntityObject object);

    Page<?> dataTableSearch(QueryModel query, EntityObject value);

    int update(EntityObject entity, Object communicator);

    Serializable create(EntityObject entity, Object communicator);

    int delete(EntityObject entity);
}
