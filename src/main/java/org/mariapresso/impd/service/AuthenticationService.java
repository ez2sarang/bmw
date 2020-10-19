package org.mariapresso.impd.service;


import org.mariapresso.impd.bean.communicate.ApiResponse;
import org.mariapresso.impd.bean.communicate.SessionApi;
import org.mariapresso.impd.constant.ResultType;

/**
 * Created by ez2sarang on 15. 5. 11..
 */
public interface AuthenticationService {
    void login(SessionApi navi) throws Exception;

    String validSession(ApiResponse bean) throws Exception;

    ResultType releaseSession(String sessionToken, String transactionToken) throws Exception;

    boolean checkPassword(String sessionToken, String password) throws Exception;
}
