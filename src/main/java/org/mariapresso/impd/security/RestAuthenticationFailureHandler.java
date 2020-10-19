package org.mariapresso.impd.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * This authentication failure handler returns the HTTP status code 403.
 * @author Petri Kainulainen
 */
@Slf4j
public final class RestAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request,
                                        HttpServletResponse response,
                                        AuthenticationException e) throws IOException, ServletException {
        log.info("Authentication failed with message: {}", e.getMessage());
        response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication failed.");
    }
}
