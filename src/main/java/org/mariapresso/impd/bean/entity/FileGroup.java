package org.mariapresso.impd.bean.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Entity
public @Data class FileGroup implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    private String name;
    private boolean visible;
//    private Long groupId;아니옴니다.
    private String owner;
    private Date createTime;

    @OneToMany(cascade={CascadeType.ALL})
    @JoinColumn(name="fileGroupId", referencedColumnName = "id")
    private List<FileItem> fileItemList;
}
