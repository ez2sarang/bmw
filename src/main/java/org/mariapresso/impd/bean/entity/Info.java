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
public @Data class Info {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    private String value;
    private Long infoGroupId;
    private String type;
    private boolean visible;
    private String owner;
    private int displayOrder;
    private Date createTime;
}
