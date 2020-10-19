package org.mariapresso.impd.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * This authentication success handler returns the information of the authenticated
 * user as JSON.
 *
 * @author Petri Kainulainen
 */
@Slf4j
public final class RestAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        log.info("Authentication was successful");
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath()+"/access/logined.do"));
    }
}
