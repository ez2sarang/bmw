package org.mariapresso.impd.bean.entity;

import lombok.Data;
import org.mariapresso.impd.annotation.ui.Action;
import org.mariapresso.impd.annotation.ui.Linker;

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
@Linker(
        { @Action(value = "/contract", title = "계약", displayOrder = Integer.MAX_VALUE-1)
        }
)
public @Data class Contract implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    private String userId;
    private String obtainConfirm;
    private String description;
    private String purchaseType;
    private int price;
    private String status;
    private Date startDate;
    private Date endDate;
    private Date createTime;

    public Contract(String userId, Date joinDate) {
        this.userId = userId;
        this.startDate = joinDate;
        this.endDate = joinDate;
        this.createTime = joinDate;
        this.status = "join";
    }
}
