package org.mariapresso.impd.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * Created by ez2sarang on 15. 6. 5..
 */
@Slf4j
public class SetLocaleInterceptor extends HandlerInterceptorAdapter {
    private LocaleResolver resolver;

    public SetLocaleInterceptor(LocaleResolver resolver) {
        this.resolver = resolver;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            if (!"".equals(StringUtils.defaultString(request.getParameter("locale")))) {
                Locale locale = new Locale(request.getParameter("locale"));
                resolver.setLocale(request, response, locale);
                resolver.resolveLocale(request);
            }
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
        }
        return super.preHandle(request, response, handler);
    }
}
