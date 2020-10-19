package org.mariapresso.impd.bean.entity;

import kr.co.fcsoft.core.bean.EntityObject;
import kr.co.fcsoft.core.bean.Paging;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Entity
@EqualsAndHashCode(callSuper=false)
public @Data class ContentGroup extends EntityObject {
    public static final int STYLE_TYPE = 1;
    public static final int COUPON_TYPE = 2;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    private int contentType;
    private String name;
    private String description;
    private Long fileId;
    private Long groupId;
    private String owner;
    private Date createTime;

    @OneToOne
    @JoinColumn(name="fileId", referencedColumnName = "id", insertable = false, updatable = false, nullable=true)
    private FileGroup fileGroup;

    @Override
    public void initialize() {
        if(null != fileGroup && null != fileGroup.getFileItemList()) {
            fileGroup.getFileItemList().size();
        }
    }
}
