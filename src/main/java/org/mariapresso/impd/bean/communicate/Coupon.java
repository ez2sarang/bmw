package org.mariapresso.impd.bean.communicate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.NotEmpty;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.ui.Action;
import org.mariapresso.impd.annotation.ui.Linker;
import org.mariapresso.impd.annotation.ui.Model;
import org.mariapresso.impd.annotation.ui.Modeler;
import org.mariapresso.impd.constant.ResultType;

import java.util.Date;

/**
 * Created by ez2sarang on 2015. 7. 10..
 */
@Linker(
        { @Action(value = "/coupon", title = "쿠폰등록", displayOrder = 2)
        }
)
@EqualsAndHashCode(callSuper=false)
public @Data class Coupon extends UserApi {
    @NotEmpty
    @JsonIgnore
    @Modeler(@Model(label = "쿠폰명"))
    private String name;
    @NotEmpty
    @JsonIgnore
    @Modeler
    private String description;
    @JsonIgnore
    @Modeler
    private String info;
    @JsonIgnore
    @Modeler(@Model(type = ModelType.hidden))
    private Long fileId;
    @Modeler(@Model(label = "유효간",type = ModelType.date))
    private String startDate;
    @Modeler(@Model(label = "~",type = ModelType.date))
    private String endDate;
    @JsonIgnore
    private Date createTime;

    public Coupon() {
        super(ResultType.UNKNOWN_ERROR);
        this.createTime = new Date();
    }
}
