package org.mariapresso.impd.bean.communicate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.NotEmpty;
import org.mariapresso.impd.annotation.ActionType;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.ui.*;
import org.mariapresso.impd.constant.ResultType;

/**
 * Created by ez2sarang on 2015. 7. 9..
 */
@Linker(
        { @Action(value = "/join", title = "회원가입", type = ActionType.register, displayOrder = 2)
        , @Action(value = "/system/userDetail", title = "회원가입", type = ActionType.info, displayOrder = 2)
        , @Action(value = "/system/userModify", title = "회원가입", type = ActionType.modify, displayOrder = 2)
        }
)
@EqualsAndHashCode(callSuper=false)
public @Data class Join extends ApiResponse {
    @JsonIgnore
    @NotEmpty
    @Modeler(@Model(label = "아이디", displayOrder = -2, validate = @Rule(required = "true")))
    private String userId;
    @JsonIgnore
    @NotEmpty
    @Modeler({@Model(label = "비밀번호", type = ModelType.password), @Model(type = ModelType.password, value = "1111", refer = "/login", displayOrder = 2)})
    private String password;
    @JsonIgnore
    @NotEmpty
    @Modeler({@Model(label = "비밀번호 확인", type = ModelType.password)})
    private String repassword;
    @JsonIgnore
    @Modeler(@Model(label="사용자 종류", type = ModelType.radio, options = {"customer:손님", "designer:디자이너", "staff:스탭", "manager:매니저"}, value = "1"))
    private String type;
    @JsonIgnore
    @Modeler(@Model(label="프로필 사진", type = ModelType.file))
    private Long fileId;
    @JsonIgnore
    @NotEmpty
    @Modeler(@Model(label = "이름", displayOrder = -1, validate = @Rule(required = "true")))
    private String userName;
    @JsonIgnore
    @Modeler(@Model(label = "이메일"))
    private String userEmail;
    @JsonIgnore
    @Modeler(@Model(type = ModelType.select, options = {":직접선택", "gmail.com:구글", "naver.com:네이버", "nate.com:네이트", "daum.com:다음"}))
    private String mail;
    @JsonIgnore
    @Modeler(@Model(label = "핸드폰"))
    private String userPhone;
    @JsonIgnore
    @Modeler(@Model(label = "등급"))
    private String userGrade;
    @JsonIgnore
    @Modeler(@Model(label = "프로필정보"))
    private String userProfile;
    @JsonIgnore
    private Long linkId;
    private Long contractId;
    @JsonIgnore
    @Modeler(@Model(label = "상태", type = ModelType.hidden, value = "join", options = {"join:가입대기", "use:사용"}))
    private String status;

    public Join() {
        super(ResultType.UNKNOWN_ERROR);
    }

    public Join(ResultType result) {
        super(result);
    }

    public Join(ResultType result, String transactionToken) {
        super(result, transactionToken);
    }

    public Join(String resultCode, String errorString) {
        super(resultCode, errorString);
    }
}
