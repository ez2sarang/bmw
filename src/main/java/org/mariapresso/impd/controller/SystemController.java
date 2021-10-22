package org.mariapresso.impd.controller;

import kr.co.fcsoft.core.bean.DataTableObject;
import kr.co.fcsoft.core.bean.datatables.QueryModel;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.mariapresso.impd.bean.communicate.Group;
import org.mariapresso.impd.bean.communicate.Join;
import org.mariapresso.impd.bean.entity.User;
import org.mariapresso.impd.bean.entity.UserGroup;
import org.mariapresso.impd.constant.Pages;
import org.mariapresso.impd.constant.ResultType;
import org.mariapresso.impd.service.UnityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Date;

/**
 * Created by ez2sarang on 2017. 4. 19..
 */
@Slf4j
@Controller
public class SystemController {
    @Autowired
    private MessageSourceAccessor messageSourceAccessor;

    @Autowired
    private UnityService unityService;

    /*@InitBinder
    public void initBinder(WebDataBinder binder) {
        CustomDateEditor dateTimeEditor = new CustomDateEditor(new SimpleDateFormat(DateFormat.fullDateTime.code), true);
        binder.registerCustomEditor(Date.class, dateTimeEditor);
    }*/

    //SYS
    @RequestMapping(value = "/system/group")
    public String group() {
        return Pages.main.viewAdmin("system/group");
    }

    @RequestMapping(value = "/system/groupList")
    public @ResponseBody
    DataTableObject groupList(DataTableObject dataTableObject, HttpServletRequest request, UserGroup value) throws Exception {
        try {
            QueryModel query = new QueryModel(request.getParameterMap());
            dataTableObject.add(unityService.dataTableSearch(query, value));
        } catch (Exception e) {
            dataTableObject.setError(e.getMessage());
            log.error(e.getMessage(), e);
            throw e;
        }
        return dataTableObject;
    }

    @RequestMapping(value = "/system/groupDetail")
    public String groupDetail(Model model, UserGroup value) throws Exception {
        Group entity = new Group();
        try {
            BeanUtils.copyProperties(entity, unityService.findObject(value));
            model.addAttribute("entity", entity);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return Pages.info.viewAdmin("system/group_detail");
    }

    @RequestMapping(value = "/system/groupModifyForm")
    public String groupModifyForm(Model model, UserGroup value) throws Exception {
        Group entity = new Group();
        try {
            BeanUtils.copyProperties(entity, unityService.findObject(value));
            model.addAttribute("entity", entity);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return Pages.info.viewAdmin("system/group_edit");
    }

    @RequestMapping(value = "/system/groupModify")
    public @ResponseBody String groupModify(HttpServletRequest request, Group communicator) throws Exception {
        try {
            UserGroup entity = new UserGroup(Long.valueOf(StringUtils.defaultIfEmpty(request.getParameter("id"), "0")));
            communicator.setCreateTime(null);
            System.out.println(ResultType.NOT_FOUND.toString());
            if(unityService.update(entity, communicator) == 0) {
                return ResultType.NOT_FOUND.code;
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return ResultType.OK.code;
    }

    @RequestMapping(value = "/system/groupRegForm")
    public String groupRegForm(Model model) throws Exception {
        try {
            model.addAttribute("entity", new Group());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return Pages.info.viewAdmin("system/group_create");
    }

    @RequestMapping(value = "/system/groupReg")
    public @ResponseBody String groupReg(Group communicator, Principal principal) throws Exception {
        try {
            UserGroup entity = new UserGroup();
            entity.setOwner(principal.getName());
            if(null != unityService.create(entity, communicator)) {
                return ResultType.OK.code;
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return ResultType.NOT_FOUND.code;
    }

    @RequestMapping(value = "/system/groupRemove")
    public @ResponseBody String groupRemove(UserGroup entity) throws Exception {
        try {
            if(unityService.delete(entity) == 0) {
                return ResultType.NOT_FOUND.code;
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return ResultType.OK.code;
    }


    @RequestMapping(value = "/system/user")
    public String user() {
        return Pages.main.viewAdmin("system/user");
    }

    @RequestMapping(value = "/system/userList")
    public @ResponseBody
    DataTableObject userList(DataTableObject dataTableObject, HttpServletRequest request, User value) throws Exception {
        try {
            QueryModel query = new QueryModel(request.getParameterMap());
            dataTableObject.add(unityService.dataTableSearch(query, value));
        } catch (Exception e) {
            dataTableObject.setError(e.getMessage());
            log.error(e.getMessage(), e);
            throw e;
        }
        return dataTableObject;
    }

    @RequestMapping(value = "/system/userDetail")
    public String userDetail(Model model, User value) throws Exception {
        Join entity = new Join();
        try {
            BeanUtils.copyProperties(entity, unityService.findObject(value));
            model.addAttribute("entity", entity);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return Pages.info.viewAdmin("system/user_detail");
    }

    @RequestMapping(value = "/system/userModifyForm")
    public String userModifyForm(Model model, User value) throws Exception {
        Join entity = new Join();
        try {
            BeanUtils.copyProperties(entity, unityService.findObject(value));
            model.addAttribute("entity", entity);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return Pages.info.viewAdmin("system/user_edit");
    }

    @RequestMapping(value = "/system/userModify")
    public @ResponseBody String userModify(HttpServletRequest request, Join communicator) throws Exception {
        try {
            User entity = new User(Long.valueOf(StringUtils.defaultIfEmpty(request.getParameter("id"), "0")));
            System.out.println(ResultType.NOT_FOUND.toString());
            if(unityService.update(entity, communicator) == 0) {
                return ResultType.NOT_FOUND.code;
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return ResultType.OK.code;
    }

    @RequestMapping(value = "/system/userRegForm")
    public String userRegForm(Model model) throws Exception {
        try {
            model.addAttribute("entity", new Join());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return Pages.info.viewAdmin("system/user_create");
    }

    @RequestMapping(value = "/system/userReg")
    public @ResponseBody String userReg(Join communicator) throws Exception {
        try {
            User entity = new User();
            entity.setCreateTime(new Date());
            if(null != unityService.create(entity, communicator)) {
                return ResultType.OK.code;
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return ResultType.NOT_FOUND.code;
    }

    @RequestMapping(value = "/system/userRemove")
    public @ResponseBody String userRemove(User entity) throws Exception {
        try {
            if(unityService.delete(entity) == 0) {
                return ResultType.NOT_FOUND.code;
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return ResultType.OK.code;
    }
}
