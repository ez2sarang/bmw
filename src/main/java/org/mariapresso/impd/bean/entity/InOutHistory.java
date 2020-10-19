package org.mariapresso.impd.bean.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by ez2sarang on 15. 4. 9..
 */
@Entity
public @Data
class InOutHistory implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    private boolean logType;
    private boolean valid;
    private String sessionToken;
    private Date createDateTime;

    public InOutHistory() {
    }

    public InOutHistory(boolean logType, String sessionToken) {
        this.logType = logType;
        this.sessionToken = sessionToken;
        this.createDateTime = new Date();
    }

    public void addSessionToken(String sessionToken) {
        if(null == this.sessionToken) {
            this.sessionToken = sessionToken;
        } else {
            this.sessionToken = String.format("%s|%s", this.sessionToken, sessionToken);
        }
    }
}