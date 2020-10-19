package org.mariapresso.impd.bean.communicate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.mariapresso.impd.constant.ResultType;

/**
 * Created by ez2sarang on 15. 3. 25..
 */
public abstract class ApiResponse implements ValidationSupporter {
    private String resultCode;
    private String errorString;
    @JsonIgnore
    private String sessionToken;
    private String transactionToken;

    public ApiResponse(ResultType result) {
        this.resultCode = result.code;
        this.errorString = result.name();
    }

    public ApiResponse(ResultType result, String transactionToken) {
        this.resultCode = result.code;
        this.errorString = result.name();
        this.transactionToken = transactionToken;
    }

    public ApiResponse(String resultCode, String errorString) {
        this.errorString = errorString;
        this.resultCode = resultCode;
    }

    @Override
    public String getErrorString() {
        return errorString;
    }

    @Override
    public String getResultCode() {
        return resultCode;
    }

    @Override
    public void setResultCode(ResultType result) {
        this.resultCode = result.code;
        this.errorString = result.name();
    }

    @Override
    public void setResultCode(ResultType result, String errorString) {
        this.resultCode = result.code;
        this.errorString = errorString;
    }

    public String getSessionToken() {
        return sessionToken;
    }

    public void setSessionToken(String sessionToken) {
        this.sessionToken = sessionToken;
    }

    public String getTransactionToken() {
        return transactionToken;
    }

    public void setTransactionToken(String transactionToken) {
        this.transactionToken = transactionToken;
    }
}
