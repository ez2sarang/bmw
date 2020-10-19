package org.mariapresso.impd.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Petri Kainulainen
 */
@Slf4j
@RestController
public class CsrfTokenController {

    @RequestMapping(value = "/api/csrf", method = RequestMethod.HEAD)
    public void getCsrfToken() {
        log.info("Getting CSRF token.");
    }
}
