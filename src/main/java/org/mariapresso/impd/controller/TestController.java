package org.mariapresso.impd.controller;

import lombok.extern.slf4j.Slf4j;
import org.mariapresso.impd.constant.Pages;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ez2sarang on 15. 12. 14..
 */
@Slf4j
@Controller
public class TestController {
    @RequestMapping(value = "/test")
    public String test(HttpServletRequest request) {
        return Pages.info.viewPage("test");
    }

    @RequestMapping(value = "/home")
    public String home(HttpServletRequest request) {
        return Pages.info.viewPage("home");
    }

    @RequestMapping(value = "/tAdmin")
    public String admin(HttpServletRequest request) {
        return Pages.info.viewPage("testAdmin");
    }

    @RequestMapping(value = "/bootstrap")
    public String bootstrap(HttpServletRequest request) {
        return Pages.main.viewPage("test/bootstrap");
    }

    @RequestMapping(value = "/menusample")
    public String menusample(HttpServletRequest request) {
        return Pages.main.viewPage("test/menusample");
    }



    @RequestMapping(value = "/joinsample")
    public String joinsample(HttpServletRequest request) {
        return Pages.info.viewPage("test/join");
    }
}
