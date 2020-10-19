package org.mariapresso.impd.bean.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Entity
public @Data class Coupon implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    private String name;
    private String description;
    private String info;
    private Long fileId;
    private Long groupId;
    private String owner;
    private Date startDate;
    private Date endDate;
    private Date createTime;
}
