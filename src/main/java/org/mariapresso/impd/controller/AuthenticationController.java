package org.mariapresso.impd.controller;

import lombok.extern.slf4j.Slf4j;
import org.mariapresso.impd.bean.communicate.ApiResponse;
import org.mariapresso.impd.bean.communicate.SessionApi;
import org.mariapresso.impd.bean.communicate.UserApi;
import org.mariapresso.impd.constant.Pages;
import org.mariapresso.impd.constant.ResultType;
import org.mariapresso.impd.service.AuthenticationService;
import org.mariapresso.impd.util.BindingHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * Created by ez2sarang on 15. 4. 3..
 */
@Slf4j
@Controller
public class AuthenticationController {
    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    LocaleResolver resolver;

    /**
     *
     * @param navi
     * @param result
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    ApiResponse login(@Valid SessionApi navi, BindingResult result) throws Exception {
        if(BindingHelper.hasErrors(navi, result)) {
            return navi;
        }
        try {
            authenticationService.login(navi);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
        }
        return navi;
    }

    @RequestMapping(value = "/logout")
    public @ResponseBody
    String logout(HttpServletRequest request) {
        try {
            ResultType result = authenticationService.releaseSession(request.getParameter("sessionToken"), request.getParameter("transactionToken"));
            if(result == ResultType.OK) {
                return String.format("{\"resultCode\":\"%s\", \"errorString\":\"\"}", ResultType.OK.code);
            } else {
                return String.format("{\"resultCode\":\"%s\", \"errorString\":\"%s\"}", ResultType.SESSION_OUT.code, ResultType.SESSION_OUT.toString());
            }
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            return String.format("{\"resultCode\":\"%s\", \"errorString\":\"%s\"}", ResultType.UNKNOWN_ERROR.code, e.getMessage());
        }
    }

    /**
     * Returns the information of the authenticated user as JSON. The returned information
     * contains the username and the user role of the authenticated user.
     *
     * @param authenticatedUser The information of the authenticated user.
     * @return
     */
    /*@RequestMapping(value = "/access/login", method = RequestMethod.GET)
    public UserApi getAuthenticatedUser(@AuthenticationPrincipal User authenticatedUser) {
        log.info("Getting authenticated user.");

        if (authenticatedUser == null) {
            //If anonymous users can access this controller method, someone has changed
            //the security configuration and it must be fixed.
            log.error("Authenticated user is not found.");
            throw new AccessDeniedException("Anonymous users cannot request the information of the authenticated user.");
        }
        else {
            log.info("User with username: {} is authenticated", authenticatedUser.getUsername());
            return new UserApi(ResultType.OK, authenticatedUser.getUsername(), authenticatedUser.getPassword(), authenticatedUser.isEnabled(), "", authenticatedUser.getAuthorities());
        }
    }*/
    /*
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username or password!");
            System.out.println("error-" + error);
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName(Pages.main.viewAdmin("dashboard/default"));

        return model;
    }*/
}
