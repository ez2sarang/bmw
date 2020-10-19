package org.mariapresso.impd.bean.entity;

import lombok.Data;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.ui.Action;
import org.mariapresso.impd.annotation.ui.Linker;
import org.mariapresso.impd.annotation.ui.Model;
import org.mariapresso.impd.annotation.ui.Modeler;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Entity
@Linker(
        { @Action(value = "/board", title = "게시판", displayOrder = 3)
        }
)
public @Data class Board {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Modeler(@Model)
    private long id;
    @Modeler(@Model)
    private String title;
    @Modeler(@Model)
    private String description;
    @Modeler(@Model(type = ModelType.file))
    private Long fileId;
    private Long groupId;
    private String owner;
    private boolean visible;
    private String type;
    private Date createTime;
}
