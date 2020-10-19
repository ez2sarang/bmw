package org.mariapresso.impd.bean.communicate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.NotEmpty;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.ui.*;
import org.mariapresso.impd.constant.ResultType;

import java.util.Date;

/**
 * Created by ez2sarang on 2015. 7. 9..
 */
@Linker(
        { @Action(value = "/style", title = "스타일등록", displayOrder = 2)
        }
)
@EqualsAndHashCode(callSuper=false)
public @Data class Style extends UserApi {
    @NotEmpty
    @JsonIgnore
    @Modeler(@Model(label = "스타일명", validate = @Rule(required = "true")))
    private String name;
    @NotEmpty
    @JsonIgnore
    @Modeler(@Model(label = "설명", type = ModelType.textarea, validate = @Rule(required = "true")))
    private String description;
    @JsonIgnore
    @Modeler(@Model(label = "업로드 이미지", type = ModelType.file, validate = @Rule(required = "true", messages = "이미지가 필요합니다.")))
    private Long fileId;
    @JsonIgnore
    private Date createTime;
    public Style() {
        super(ResultType.UNKNOWN_ERROR);
        this.createTime = new Date();
    }
}
