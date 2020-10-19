package org.mariapresso.impd.controller;

import lombok.extern.slf4j.Slf4j;
import org.mariapresso.impd.bean.communicate.UserApi;
import org.mariapresso.impd.constant.ResultType;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by ez2sarang on 2017. 4. 4..
 */
@Slf4j
@RestController
final class UserController {
    /**
     * Returns the information of the authenticated user as JSON. The returned information
     * contains the username and the user role of the authenticated user.
     *
     * @param userDetails The information of the authenticated user.
     * @return
     */
    @RequestMapping(value = "/access/logined", method = RequestMethod.GET)
    public UserApi getAuthenticatedUser(@AuthenticationPrincipal UserDetails userDetails) {
        log.info("Getting authenticated user.");

        if (userDetails == null) {
            //If anonymous users can access this controller method, someone has changed
            //the security configuration and it must be fixed.
            log.error("Authenticated user is not found.");
            throw new AccessDeniedException("Anonymous users cannot request the information of the authenticated user.");
        }
        else {
            log.info("User with username: {} is authenticated", userDetails.getUsername());
            return new UserApi(ResultType.OK, userDetails.getUsername(), userDetails.getPassword(), userDetails.isEnabled(), "", userDetails.getAuthorities());
        }
    }
}
