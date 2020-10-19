package org.mariapresso.config;

import org.mariapresso.impd.security.RestAuthenticationEntryPoint;
import org.mariapresso.impd.security.RestAuthenticationFailureHandler;
import org.mariapresso.impd.security.RestAuthenticationSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static final String REMEMBER_ME_KEY = "REMEMBER_ME_KEY";

    @Autowired
    UserDetailsService userDetailsService;

    @Autowired
    PersistentTokenRepository tokenRepository;

    @Bean
    AuthenticationEntryPoint authenticationEntryPoint() {
        return new RestAuthenticationEntryPoint();
    }

    @Bean
    AuthenticationFailureHandler authenticationFailureHandler() {
        return new RestAuthenticationFailureHandler();
    }

    @Bean
    AuthenticationSuccessHandler authenticationSuccessHandler() {
        return new RestAuthenticationSuccessHandler();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/admin/logout.do").permitAll()
                .antMatchers("/access/**").permitAll()
                .antMatchers("/system/**").hasRole("SYSTEM")
                .antMatchers("/admin/**").access("hasRole('ADMIN') or hasRole('SYSTEM')")
                .antMatchers("/login.do").hasRole("ANONYMOUS")
                .anyRequest().authenticated()
                .and()
                .formLogin()
                    .loginPage("/access/signin.do")
                    .loginProcessingUrl("/access/login.do")
                    .failureHandler(authenticationFailureHandler())
                    .successHandler(authenticationSuccessHandler())
                    .permitAll()
                .and()
                //Configure logout function.
                .logout()
                    .deleteCookies("JSESSIONID")
                    .logoutUrl("/admin/logout.do")
                    .logoutSuccessUrl("/access/signin.do")
                .and().rememberMe().rememberMeParameter("remember-me").key(REMEMBER_ME_KEY).rememberMeServices(persistentTokenBasedRememberMeServices())
                .and().exceptionHandling()
                .accessDeniedPage("/access/accessDenied.do")
                .and().headers().frameOptions().sameOrigin()
        ;
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                //Spring Security ignores request to static resources such as CSS or JS files.
                .ignoring()
                .antMatchers(
                        "/favicon.ico"
                        , "/assets/**"
                        , "/img/**"
                        , "/js/**"
                        , "/style/**"
                        //, "/access*"
                        , "/i18n/**"
                );
    }

    /**
     * 저장토큰기반 내컴퓨터기억하기 서비스
     * @return 내컴퓨터기억 서비스
     */
    @Bean
    public PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices() {
        PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices = new PersistentTokenBasedRememberMeServices(REMEMBER_ME_KEY, userDetailsService, tokenRepository);
        return persistentTokenBasedRememberMeServices;
    }
}