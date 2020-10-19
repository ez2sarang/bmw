package org.mariapresso.impd.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.mariapresso.impd.bean.communicate.UserApi;
import org.mariapresso.impd.bean.entity.InOutHistory;
import org.mariapresso.impd.bean.entity.Session;
import org.mariapresso.impd.bean.communicate.ApiResponse;
import org.mariapresso.impd.bean.communicate.SessionApi;
import org.mariapresso.impd.bean.entity.User;
import org.mariapresso.impd.constant.ResultType;
import org.mariapresso.impd.dao.AuthenticationDao;
import org.mariapresso.impd.service.AuthenticationService;
import org.mariapresso.util.SimpleRandomKeyFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import java.util.Date;
import java.util.UUID;

/**
 * Created by ez2sarang on 15. 4. 8..
 */
@Service("authenticationService")
@Transactional
@Slf4j
public class AuthenticationServiceImpl implements AuthenticationService {
    @Autowired
    private AuthenticationDao authenticationDao;

//    @Autowired
//    private PresentationDao presentationDao;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    private static final SimpleRandomKeyFactory srf = new SimpleRandomKeyFactory();

    private final int SESSION_TIME_OUT;

    @Inject
    public AuthenticationServiceImpl(@Value("${session.timeout.term}")String term) throws ScriptException {
        ScriptEngineManager mgr = new ScriptEngineManager();
        ScriptEngine engine = mgr.getEngineByName("JavaScript");
        log.info("session_timeout_term:"+term);
        System.out.println(engine.eval("function(){i=0;for(k=0;k<10;k++){i=i+1;}return i;}").toString());
        this.SESSION_TIME_OUT = Integer.valueOf(engine.eval(term).toString());
    }

    @Override
    public void login(SessionApi navi) throws Exception {
        User result = authenticationDao.getUser(navi.getUserId());
        InOutHistory log = new InOutHistory(true, navi.getUserId());
        if (null == result || "".equals(result.getStatus())) {//TODO  추후수정
            navi.setResultCode(ResultType.INVALID_USER);
            log.setValid(false);
        } else {
            if(passwordEncoder.matches(navi.getPassword(), result.getPassword())) {
                Object menu = null;//Menu menu = presentationDao.getRoootMenuId(result.getMenuGroup());
                Session session = authenticationDao.getSessionByUserId(navi.getUserId());
                if(null == session) {
                    session = new Session(navi.getUserId(), result.getGroupId(), UUID.randomUUID().toString(), srf.createSessionKey(), new Date(), null/*result.getMenuGroup()*/, navi.getLocale(), result.getUserName(), result.getUserPhone(), result.getUserGrade());
                    if(null != menu) {
//                        session.setRootMenuId(menu.getId());
//                        session.setRootMenuEndTerm(menu.getValidTermEnd());
                    } else {
                        session.setRootMenuId(-1l);
                        session.setRootMenuEndTerm(null);
                    }
                    authenticationDao.saveSession(session);
                } else {
//                    session.setMenuGroup(result.getMenuGroup());
                    session.setSessionTokenId(UUID.randomUUID().toString());
                    session.setTxTokenId(srf.createSessionKey());
                    session.setLastUpdateDateTime(new Date());
                    session.setLocale(navi.getLocale());
                    session.setGroupId(result.getGroupId());
                    /*if(null != result.getGroups() && result.getGroups().size()>0) {
                        session.setGroupId(result.getGroups().get(0).getGroupId());
                    }*/
                    if(null != menu) {
//                        session.setRootMenuId(menu.getId());
//                        session.setRootMenuEndTerm(menu.getValidTermEnd());
                    } else {
                        session.setRootMenuId(-1l);
                        session.setRootMenuEndTerm(null);
                    }
                }
                navi.setResultCode(ResultType.OK);
                navi.setSessionToken(session.getSessionTokenId());
                navi.setTransactionToken(session.getTxTokenId());
                log.addSessionToken(navi.getSessionToken());
                log.setValid(true);
            } else {
                navi.setResultCode(ResultType.INVALID_PASSWORD);
                log.setValid(false);
            }
        }
        authenticationDao.saveSession(log);
    }

    @Override
    public String validSession(ApiResponse bean) throws Exception {
        Session session = authenticationDao.getSessionByToken(bean.getSessionToken());
        if(null == session) {
            bean.setResultCode(ResultType.INVALID_TOKEN);
        } else {
            if(!session.getTxTokenId().equals(bean.getTransactionToken())) {
                bean.setResultCode(ResultType.INVALID_TOKEN);
            } else if(new Date(System.currentTimeMillis()-SESSION_TIME_OUT).before(session.getLastUpdateDateTime())) {
                session.setTxTokenId(srf.createSessionKey());
                session.setLastUpdateDateTime(new Date());
                bean.setResultCode(ResultType.OK);
                bean.setTransactionToken(session.getTxTokenId());
                /*if(navi instanceof UserInfoNavi) {
                    ((UserInfoNavi) navi).setUserId(session.getUserId());
                    ((UserInfoNavi) navi).setUserName(session.getUserName());
                    ((UserInfoNavi) navi).setUserPhone(session.getUserPhone());
                    ((UserInfoNavi) navi).setUserGrade(session.getUserGrade());
                } else if(navi instanceof MenuListNavi) {
                    if (((MenuListNavi) navi).getMenuPid() == null || ((MenuListNavi) navi).getMenuPid() < 1) {
                        if(session.getRootMenuEndTerm() != null && new Date().before(session.getRootMenuEndTerm())) {
                            ((MenuListNavi) navi).setMenuPid(session.getRootMenuId());
                        } else {
                            Menu menu = presentationDao.getRoootMenuId(session.getMenuGroup());
                            if(null != menu) {
                                session.setRootMenuId(menu.getId());
                                session.setRootMenuEndTerm(menu.getValidTermEnd());
                                ((MenuListNavi) navi).setMenuPid(menu.getId());
                            } else {
                                session.setRootMenuId(-1l);
                                session.setRootMenuEndTerm(null);
                                ((MenuListNavi) navi).setMenuPid(-1l);
                            }
                        }
                    }
                } else if(navi instanceof UserNavi) {
                    ((UserNavi) navi).setUserId(session.getUserId());
                    if(navi instanceof SSContentInfoNavi) {
                        session.setOnetimeToken(srf.createSessionKey());
                        ((SSContentInfoNavi) navi).setOnetimeToken(session.getOnetimeToken());
                    }
                }*/
                if(bean instanceof UserApi) {
                    ((UserApi) bean).setUserId(session.getUserId());
                    ((UserApi) bean).setGroupId(session.getGroupId());
                }
            } else {
                bean.setResultCode(ResultType.SESSION_OUT);
            }
        }
        return bean.getResultCode();
    }

    @Override
    public ResultType releaseSession(String sessionToken, String transactionToken) throws Exception {
        Session session = authenticationDao.getSessionByToken(sessionToken);
        InOutHistory log = new InOutHistory(false, sessionToken);
        try {
            if(null == session) {
                log.setValid(false);
                return ResultType.SESSION_OUT;
            } else {
                if(session.getTxTokenId().equals(transactionToken) && new Date(System.currentTimeMillis()-SESSION_TIME_OUT).before(session.getLastUpdateDateTime())) {
                    session.setTxTokenId("logout");
                    log.setValid(true);
                    return ResultType.OK;
                } else {
                    log.setValid(false);
                    return ResultType.SESSION_OUT;
                }
            }
        } finally {
            authenticationDao.saveSession(log);
        }
    }

    @Override
    public boolean checkPassword(String sessionToken, String password) throws Exception {
        /*NavigatorSession session = authenticationDao.getSessionByToken(sessionToken);
        if(null == session) {
            return false;
        } else {
            Subscriber result = authenticationDao.getSubscriber(session.getUserId(), AuthenticationController.SUBSCRIBER_TYPE_ID);
            if (null == result || !"Y".equals(result.getUseYn())) {
                return false;
            } else {
                return passwordEncoder.matches(password, result.getPassword());
            }
        }*/
        return false;
    }
}
