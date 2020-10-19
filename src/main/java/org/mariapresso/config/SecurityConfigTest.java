package org.mariapresso.config;

import org.mariapresso.impd.security.CsrfHeaderFilter;
import org.mariapresso.impd.security.RestAuthenticationEntryPoint;
import org.mariapresso.impd.security.RestAuthenticationFailureHandler;
import org.mariapresso.impd.security.RestAuthenticationSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
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
import org.springframework.security.web.csrf.CsrfFilter;

/**
 * Created by ez2sarang on 2017. 4. 5..
 */

public class SecurityConfigTest extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService userDetailsService;

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

    /*@Bean
    protected UserDetailsService userDetailsService() {
        return super.userDetailsService();
    }*/

    /*@Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .inMemoryAuthentication()
                .withUser("user").password("password").roles("USER");
    }*/
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        auth.inMemoryAuthentication().withUser("user").password("password").roles("USER");

        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
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
                        //, "/access/**"
                        , "/i18n/**"
                );
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
//                .headers()
//                .xssProtection()
//                .frameOptions()
//                .and()

                //Use the custom authentication entry point.
                .exceptionHandling()
                        .authenticationEntryPoint(authenticationEntryPoint())
                        .and()
                //Configure form login.
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
                        .and()
                //Configure url based authorization
                .authorizeRequests()
                        .antMatchers(
                                "/"
                                , "/api/csrf"
                                , "/access/**"
                        ).permitAll()
                        .antMatchers("/admin/**")
                        .access("hasRole('ADMIN') or hasRole('SYSTEM')")
                        .antMatchers(
                                "/system/**"
                        ).hasRole("SYSTEM")
                        .anyRequest().authenticated()
                        .and()
//                .csrf().disable()
                .addFilterAfter(new CsrfHeaderFilter(), CsrfFilter.class)
        ;

        /*
		http
//                .headers()
//                .xssProtection()
//                .frameOptions()
//                .and()

                .authorizeRequests()
				.antMatchers("/admin/signup").permitAll()
                .antMatchers("/admin/*").hasRole("ADMIN")
//				.antMatchers("/marketing*").hasRole("ADMIN")
//				.antMatchers("/deploy*").hasRole("ADMIN")
//				.antMatchers("/assets*").permitAll()
                .antMatchers("/**").permitAll()//.access("hasRole('ROLE_USER')") //TEST
//				.antMatchers("/js*").permitAll()
//				.antMatchers("/css*").permitAll()
//				.antMatchers("/images*").permitAll()
//				.antMatchers("/tvod/requestProgramScheduleProcess.do").permitAll()
//				.antMatchers("/serviceflow/streamingMedia.do").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
				.loginPage("/admin/signin.do")
				.permitAll()
                ;*/

        /*http
                .authorizeRequests()
                .antMatchers("*//**//*public*//**").permitAll()
         .antMatchers("/distribution*//**").hasRole("ADMIN")
         .antMatchers("/category*//**").hasRole("ADMIN")
         .antMatchers("/assets*//**").permitAll()
         .antMatchers("/js*//**").permitAll()
         .antMatchers("/css*//**").permitAll()
         .antMatchers("/images*//**").permitAll()
         .antMatchers("/logout.do").permitAll()
         .anyRequest().authenticated()
         .and().formLogin()
         .loginPage("/login.do")
         .permitAll()
         .and().logout()
         .permitAll()
         .and().exceptionHandling()
         .accessDeniedPage("/accessDenied.do")
         .and().headers().frameOptions().sameOrigin()
         ;*/



           /* .and()
                .formLogin()
                    .successHandler(savedRequestAwareAuthenticationSuccessHandler())
                    //.loginPage("/login")
                    //.failureUrl("/login?error")
                    .loginProcessingUrl("/login.json")
                    .usernameParameter("userId")
                    .passwordParameter("password")
                    //.isCustomLoginPage().passwordParameter("password")
                .and()
                .logout()
				.permitAll()
            .and()
                .exceptionHandling()
                .accessDeniedPage("/accessDenied.do")
                .and()
                .rememberMe().tokenRepository(persistentTokenRepository())
                .tokenValiditySeconds(1209600)

                .and()
                .csrf().disable();
                */

    }

	/*@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth)
			throws Exception {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		auth.userDetailsService(userDetailsService).passwordEncoder(
				passwordEncoder);
	}


    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
        db.setDataSource(dataSource);
        return db;
    }

    @Bean
    public SavedRequestAwareAuthenticationSuccessHandler savedRequestAwareAuthenticationSuccessHandler() {
        SavedRequestAwareAuthenticationSuccessHandler auth
                = new SavedRequestAwareAuthenticationSuccessHandler();
        auth.setTargetUrlParameter("targetUrl");
        return auth;
    }*/


}