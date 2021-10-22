package org.mariapresso.impd.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.mariapresso.impd.bean.communicate.UserApi;
import org.mariapresso.impd.bean.entity.User;
import org.mariapresso.impd.constant.ResultType;
import org.mariapresso.impd.dao.AuthenticationDao;
import org.mariapresso.impd.dao.ServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by ez2sarang on 2017. 4. 3..
 */
@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private AuthenticationDao authenticationDao;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        String userName = null;
        String password = null;
        Collection<GrantedAuthority> authorities = null;
        boolean enabled = false;
        try {
            org.mariapresso.impd.bean.entity.User entity = new User();
            entity.setUserId(userId);
            User result = authenticationDao.getUser(entity.getUserId());
            authorities = new ArrayList<>();

            if (result == null) {
                throw new UsernameNotFoundException(userId + " Not Found");
            }

            password = result.getPassword();
            userId = result.getUserId();
            if (!"".equals(StringUtils.trimToEmpty(result.getUserGrade()))) {
                SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + result.getUserGrade());
                authorities.add(authority);
            }

            if ("use".equals(result.getStatus())) {
                enabled = true;
            }
        } catch (Exception e) {
            throw new UsernameNotFoundException("Exception=" + e.getMessage());
        }

        return new UserApi(ResultType.OK, userId, password, enabled, userName, authorities);
    }
}
