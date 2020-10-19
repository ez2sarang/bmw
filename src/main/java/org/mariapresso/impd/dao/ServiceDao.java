package org.mariapresso.impd.dao;

import kr.co.fcsoft.core.dao.ObjectDao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ez2sarang on 2015. 7. 9..
 */
public interface ServiceDao extends ObjectDao {
    void save(Serializable entity) throws Exception;

    void saveOrUpdate(Serializable entity) throws Exception;

    void delete(Serializable entity) throws Exception;

    void update(Serializable entity) throws Exception;

    Object get(Serializable entity) throws Exception;

    List list(Serializable entity) throws Exception;
}
