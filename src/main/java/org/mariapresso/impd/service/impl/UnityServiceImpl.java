package org.mariapresso.impd.service.impl;

import kr.co.fcsoft.core.bean.EntityObject;
import kr.co.fcsoft.core.bean.datatables.QueryModel;
import kr.co.fcsoft.core.helper.NullAwareBeanUtilsBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.mariapresso.config.RootConfig;
import org.mariapresso.impd.bean.communicate.Join;
import org.mariapresso.impd.bean.communicate.Style;
import org.mariapresso.impd.bean.entity.*;
import org.mariapresso.impd.constant.DateFormat;
import org.mariapresso.impd.constant.ResultType;
import org.mariapresso.impd.dao.AuthenticationDao;
import org.mariapresso.impd.dao.ServiceDao;
import org.mariapresso.impd.util.BindingHelper;
import org.mariapresso.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Date;
import java.util.List;

/**
 * Created by ez2sarang on 2015. 7. 9..
 */
@Slf4j
@Service("unityService")
@Transactional
public class UnityServiceImpl implements org.mariapresso.impd.service.UnityService {
    @Autowired
    private AuthenticationDao authenticationDao;

    @Autowired
    private ServiceDao serviceDao;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public UserGroup getJoinGroupByType(String groupType) throws Exception {
        return authenticationDao.getJoinGroupByType(groupType);
    }

    @Override
    public User getUser(String userId) throws Exception {
        User user = new User();
        user.setUserId(userId);
        return (User)serviceDao.findObject(user);
    }

    @Override
    public void registUser(Join bean) throws Exception {
        User user = new User();
        BeanUtils.copyProperties(user, bean);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setGroupId(1l);/** default join group */
        user.setCreateTime(new Date());

        /*Contract contract = new Contract(user.getUserId(), new Date());
        serviceDao.save(contract);
        if(contract.getId()>0) {
            user.setContractId(contract.getId());
        }*/
        serviceDao.save(user);

//        UserGroup userGroup = (UserGroup)serviceDao.findObject(new UserGroup(user.getGroupId()));

        //user, state, role, time...
        serviceDao.save(new JoinGroup(user, "", 1l, user.getCreateTime()));

        if(user.getId()>0 /*&& contract.getId()>0*/) {
            bean.setResultCode(ResultType.OK);
        } else {
            throw new RuntimeException(String.format("User:%b", user.getId()>0));
        }
    }

    @Override
    public void registStyle(Style bean) throws Exception {
        try {
            FileGroup fileGroup = new FileGroup();
            fileGroup.setOwner(bean.getUserId());
            fileGroup.setCreateTime(new Date());
            serviceDao.save(fileGroup);

            File uploadFile = new File(RootConfig.REPOSITORY_TEMP_PATH+"/"+bean.getTransactionToken());
            FileItem fileItem;
            for(File file : uploadFile.listFiles()) {
                if(file.exists()) {
                    fileItem = new FileItem(fileGroup.getId(), file.listFiles()[0], bean);
                    serviceDao.save(fileItem);
                }
            }

            ContentGroup cg = new ContentGroup();
            BindingHelper.getBeanUtils().copyProperties(cg, bean);
            cg.setContentType(ContentGroup.STYLE_TYPE);
            cg.setOwner(bean.getUserId());
            cg.setFileId(fileGroup.getId());
            serviceDao.save(cg);
            if(cg.getId()>0) {
                bean.setResultCode(ResultType.OK);
            }
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public void getStyle(Style bean) throws Exception {
        ContentGroup cg = new ContentGroup();
        BindingHelper.getBeanUtils().copyProperties(cg, bean);
        cg.setOwner(bean.getUserId());
        serviceDao.save(cg);
        if(cg.getId()>0) {
            bean.setResultCode(ResultType.OK);
        }
    }

    @Override
    public void registCoupon(org.mariapresso.impd.bean.communicate.Coupon bean) throws Exception {
        Coupon coupon = new Coupon();
        BindingHelper.getBeanUtils().copyProperties(coupon, bean);
        coupon.setOwner(bean.getUserId());
        coupon.setGroupId(bean.getGroupId());
        serviceDao.save(coupon);
        if(coupon.getId()>0) {
            bean.setResultCode(ResultType.OK);
        }
    }

    @Override
    public void registGroup(org.mariapresso.impd.bean.communicate.Group bean) throws Exception {
        UserGroup userGroup = new UserGroup();
        BindingHelper.getBeanUtils().copyProperties(userGroup, bean);
        userGroup.setOwner(bean.getUserId());
        userGroup.setStartTime(DateUtil.convertStrToDate(bean.getStartTime().replaceAll("[^0-9]", "") + "000000", "yyyyMMddHHmmss"));
        userGroup.setEndTime(DateUtil.convertStrToDate(bean.getEndTime().replaceAll("[^0-9]", "") + "235959", "yyyyMMddHHmmss"));
        serviceDao.save(userGroup);
        if(userGroup.getId()>0) {
            bean.setResultCode(ResultType.OK);
        }
    }



    @Override
    public List list(Serializable bean) throws Exception {
        try {
            ContentGroup entity = new ContentGroup();
            BindingHelper.getBeanUtils().copyProperties(entity, bean);
            List result = serviceDao.list(entity);
            /*if(result != null) {
                for(UserGroup ug : result) {
                    ug.getJoinGroups().size();
                }
            }*/
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Page<?> findAllSorted(EntityObject entity) {
        Page<?> result = serviceDao.findAllSorted(entity);
        if(null != result) {
            for(Object obj : result.getContent()) {
                ((EntityObject)obj).initialize();
            }
        }
        return result;
    }

    @Override
    public EntityObject findObject(EntityObject object) {
        EntityObject result = serviceDao.findObject(object);
        if(null !=  result) {
            result.initialize();
        }
        return result;
    }

    @Override
    public Page<?> dataTableSearch(QueryModel query, EntityObject value) {
        return serviceDao.findAllSorted(value.setPage(query.getPageable()));
    }

    @Override
    public int update(EntityObject entity, Object communicator) {
        EntityObject beforeEntity = null;
        try {
            beforeEntity = serviceDao.findObject(entity);
            DateConverter converter = new DateConverter();
            converter.setPattern(DateFormat.fullDateTime.code);
            BeanUtilsBean beanUtilsBean = new NullAwareBeanUtilsBean();
            beanUtilsBean.getConvertUtils().register(converter, Date.class);
            beanUtilsBean.copyProperties(beforeEntity, communicator);
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.toString());
            return 0;
        }
        return 1;
    }

    @Override
    public Serializable create(EntityObject entity, Object communicator) {
        try {
            DateConverter converter = new DateConverter();
            converter.setPattern(DateFormat.fullDateTime.code);
            BeanUtilsBean beanUtilsBean = new NullAwareBeanUtilsBean();
            beanUtilsBean.getConvertUtils().register(converter, Date.class);
            beanUtilsBean.copyProperties(entity, communicator);
            return serviceDao.save(entity);
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.toString());
            return null;
        }
    }

    @Override
    public int delete(EntityObject entity) {
        try {
            serviceDao.delete(entity);
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.toString());
            return 0;
        }
        return 1;
    }
}
