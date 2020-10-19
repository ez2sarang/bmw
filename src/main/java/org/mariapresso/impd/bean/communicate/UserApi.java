package org.mariapresso.impd.bean.communicate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.mariapresso.impd.constant.ResultType;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * Created by ez2sarang on 15. 5. 18..
 */
public class UserApi extends ApiResponse implements UserDetails, Serializable {
    @JsonIgnore
    private String userId;
    private String password;
    private String userName;
    @JsonIgnore
    private Long groupId;

    private final Collection<? extends GrantedAuthority> authorities;
    private final boolean accountNonExpired = true;
    private final boolean accountNonLocked = true;
    private final boolean credentialsNonExpired = true;
    private final boolean enabled;

    public UserApi(String resultCode, String errorString) {
        super(resultCode, errorString);
        authorities = null;
        enabled = false;
    }

    public UserApi(ResultType result) {
        super(result);
        authorities = null;
        enabled = false;
    }

    public UserApi(ResultType result, String transactionToken) {
        super(result, transactionToken);
        authorities = null;
        enabled = false;
    }

    public UserApi(ResultType result, String username, String password, boolean enabled, String userName, Collection<? extends GrantedAuthority> authorities) {
        super(result);
        this.userId = username;
        this.password = password;
        this.enabled = enabled;
        this.userName = userName;
        this.authorities = authorities;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String getUsername() {
        return userId;
    }

    @Override
    public boolean isAccountNonExpired() {
        return accountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return accountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return credentialsNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }
}
