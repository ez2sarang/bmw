package org.mariapresso.impd.bean.communicate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.NotEmpty;
import org.mariapresso.impd.annotation.ActionType;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.ui.*;
import org.mariapresso.impd.constant.ResultType;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by ez2sarang on 2015. 7. 10..
 */
@Linker(
        { @Action(value = "/system/groupReg", title = "그룹등록", type = ActionType.register, displayOrder = 2)
        , @Action(value = "/groupList", title = "그룹목록", type = ActionType.search, displayOrder = 99)
        , @Action(value = "/system/groupDetail", title = "그룹상세", type = ActionType.info, displayOrder = 99)
        , @Action(value = "/system/groupModify", title = "그룹수정", type = ActionType.modify, displayOrder = 99)
        }
)
@EqualsAndHashCode(callSuper=false)
public @Data class Group extends UserApi implements Serializable {
    @NotEmpty
    @JsonIgnore
    @Modeler(@Model(label = "그룹명", validate = @Rule(required = "true")))
    private String name;
    @NotEmpty
    @JsonIgnore
    @Modeler(@Model(label="그룹 종류", type = ModelType.radio, options = {"guest:손님", "admin:관리자", "user:사용자"}, value = "0"))
    private String type;
    @Modeler(@Model(label = "유효간",type = ModelType.dateRange, refer="endTime", format = "YYYY-MM-DD HH:mm:ss", validate = {@Rule(required = "true"), @Rule(date = true)}))
    private String startTime;
    @Modeler(@Model(label = "~",type = ModelType.dateRange, refer="startTime", format = "YYYY-MM-DD HH:mm:ss", validate = {@Rule(required = "true"), @Rule(date = true)}))
    private String endTime;
    @JsonIgnore
    private Date createTime;

    public Group() {
        super(ResultType.UNKNOWN_ERROR);
        this.createTime = new Date();
    }
}
