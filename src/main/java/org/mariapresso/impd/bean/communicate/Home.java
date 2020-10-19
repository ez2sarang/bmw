package org.mariapresso.impd.bean.communicate;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.NotEmpty;
import org.mariapresso.impd.constant.ResultType;

/**
 * Created by ez2sarang on 15. 8. 27..
 */
@EqualsAndHashCode(callSuper = false)
public @Data
class Home extends ApiResponse {
    @NotEmpty
    private String groupId;

    public Home() {
        super(ResultType.UNKNOWN_ERROR);
    }
}
