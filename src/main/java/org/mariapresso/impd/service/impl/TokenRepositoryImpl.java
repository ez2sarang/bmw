package org.mariapresso.impd.service.impl;

import org.mariapresso.impd.bean.entity.Session;
import org.mariapresso.impd.dao.ServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by ez2sarang on 2017. 4. 6..
 */
@Service("tokenRepository")
@Transactional
public class TokenRepositoryImpl implements PersistentTokenRepository {

    @Autowired
    private ServiceDao serviceDao;

    @Override
    public void createNewToken(PersistentRememberMeToken token) {
        Session newToken = new Session();
        newToken.setUserId(token.getUsername());
        newToken.setTxTokenId(token.getTokenValue());
        newToken.setLastUpdateDateTime(token.getDate());
        newToken.setSessionTokenId(token.getSeries());
        serviceDao.save(newToken);
    }

    @Override
    public void updateToken(String series, String tokenValue, Date lastUsed) {
        Session entity = new Session();
        entity.setSessionTokenId(series);

        Session updateToken = (Session)serviceDao.findObject(entity);
        updateToken.setTxTokenId(tokenValue);
        updateToken.setLastUpdateDateTime(lastUsed);
    }

    @Override
    public PersistentRememberMeToken getTokenForSeries(String series) {
        Session entity = new Session();
        entity.setSessionTokenId(series);

        System.out.println(entity);

        Session token = (Session)serviceDao.findObject(entity);
        PersistentRememberMeToken persistentRememberMeToken = new PersistentRememberMeToken(token.getUserId(), series, token.getTxTokenId(), token.getLastUpdateDateTime());
        return persistentRememberMeToken;
    }

    @Override
    public void removeUserTokens(String username) {
        Session entity = new Session();
        entity.setUserId(username);

        serviceDao.deleteBySearchList(entity);
    }
}