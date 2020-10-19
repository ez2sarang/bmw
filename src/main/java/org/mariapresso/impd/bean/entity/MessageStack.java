package org.mariapresso.impd.bean.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Entity
public @Data class MessageStack {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    private String title;
    private String description;
    private Date referTime;
    private Long fileId;
    private String status;
    private Long targetGroup;
    /**
     * userId
     */
    private String target;
    private String owner;
    private Date createTime;
}
