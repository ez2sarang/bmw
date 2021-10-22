package org.mariapresso.impd.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.mariapresso.impd.bean.communicate.Join;
import org.mariapresso.impd.bean.entity.User;
import org.mariapresso.impd.constant.Pages;
import org.mariapresso.impd.service.UnityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Created by ez2sarang on 2015. 7. 9..
 */
@Slf4j
@Controller
public class AdminController {
    @Autowired
    private MessageSourceAccessor messageSourceAccessor;

    @Autowired
    private UnityService unityService;

    @RequestMapping(value = "/admin/account")
    public String account() {
        return Pages.main.viewAdmin("private/account");
    }
    @RequestMapping(value = "/access/signin")
    public String signin() {
        return Pages.main.viewAdmin("private/signin");
    }
    @RequestMapping(value = "/access/signup")
    public String signup() {
        System.out.println(messageSourceAccessor.getMessage("confirm.save"));
        return Pages.main.viewAdmin("private/signup");
    }
    @RequestMapping(value = "/access/checkId")
    public @ResponseBody
    String checkId(Join join) throws Exception {
        try {
            User user =  unityService.getUser(join.getUserId());
            if(user != null && !"".equals(StringUtils.trimToEmpty(user.getUserId()))) {
                return "false";
            } else {
                return "true";
            }
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            return e.getMessage();
        }
    }
    @RequestMapping(value = "/access/registSignup")
    public @ResponseBody
    String registSignup(Join join) throws Exception {
        try {
            unityService.registUser(join);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            return e.getMessage();
        }
        return "OK";
    }

    @RequestMapping(value = "/system/system")
    public String system() {
        return Pages.main.viewAdmin("dashboard/system");
    }
    @RequestMapping(value = "/admin/index")
    public String index() {
        return Pages.main.viewAdmin( "dashboard/default");
    }
    @RequestMapping(value = "/admin/company")
    public String company() {
        return Pages.main.viewAdmin("dashboard/company");
    }

    //COM
    @RequestMapping(value = "/admin/infomation")
    public String infomation() {
        return Pages.main.viewAdmin("company/infomation");
    }
    @RequestMapping(value = "/admin/schedule")
    public String schedule() {
        return Pages.main.viewAdmin("company/schedule");
    }
    @RequestMapping(value = "/admin/staff")
    public String staff() {
        return Pages.main.viewAdmin("company/staff");
    }
    @RequestMapping(value = "/admin/purchase-history")
    public String purchaseHistory() {
        return Pages.main.viewAdmin("company/purchase-history");
    }@RequestMapping(value = "/admin/purchase")
    public String purchase() {
        return Pages.main.viewAdmin("company/purchase-history");
    }

    @RequestMapping(value = "/admin/coupon")
    public String coupon() {
        return Pages.main.viewAdmin("contents/coupon");
    }
    @RequestMapping(value = "/admin/style")
    public String style() {
        return Pages.main.viewAdmin("contents/style");
    }

    @RequestMapping(value = "/admin/support-center")
    public String supportCenter() {
        return Pages.main.viewAdmin("public/support-center");
    }
    @RequestMapping(value = "/admin/pricing")
    public String pricing() {
        return Pages.main.viewAdmin("public/pricing");
    }

//    @Test
    @RequestMapping(value = "/admin/test/company")
    public String test() {
        return Pages.main.viewAdmin("company/test/default");
    }
}
