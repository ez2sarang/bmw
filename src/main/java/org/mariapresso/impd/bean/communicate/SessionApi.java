package org.mariapresso.impd.bean.communicate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.NotEmpty;
import org.mariapresso.impd.bean.entity.Session;
import org.mariapresso.impd.constant.ResultType;

/**
 * Created by ez2sarang on 15. 5. 11..
 */
public class SessionApi extends ApiResponse {
    @NotEmpty
    @JsonIgnore
    private String userId;
    @NotEmpty
    @JsonIgnore
    private String password;
    @NotEmpty
    @JsonIgnore
    private String locale;
    private String sessionToken;

    public SessionApi() {
        super(ResultType.UNKNOWN_ERROR);
    }

    public SessionApi(SessionInfo info) {
        super(ResultType.OK);
        this.sessionToken = info.getSessionToken();
        this.setTransactionToken(info.getTransactionToken());
    }

    public SessionApi(Session info) {
        super(ResultType.OK);
        this.sessionToken = info.getSessionTokenId();
        super.setTransactionToken(info.getTxTokenId());
    }

    public SessionApi(ResultType result) {
        super(result);
    }

    public SessionApi(String resultCode, String errorString) {
        super(resultCode, errorString);
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public String getSessionToken() {
        return sessionToken;
    }

    public void setSessionToken(String sessionToken) {
        this.sessionToken = sessionToken;
    }
}
