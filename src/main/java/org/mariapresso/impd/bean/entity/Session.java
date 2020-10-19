package org.mariapresso.impd.bean.entity;

import kr.co.fcsoft.core.bean.EntityObject;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.ui.Action;
import org.mariapresso.impd.annotation.ui.Linker;
import org.mariapresso.impd.annotation.ui.Model;
import org.mariapresso.impd.annotation.ui.Modeler;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by ez2sarang on 15. 4. 9..
 */
@Entity
@Linker(
        { @Action(value = "/login", title = "로그인", displayOrder = 1)
        , @Action(value = "/logout", title = "로그아웃", displayOrder = Integer.MAX_VALUE)
        }
)
@EqualsAndHashCode(callSuper=false)
public @Data class Session extends EntityObject implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    @Modeler(@Model(refer = "/login", displayOrder = 1))
    private String userId;
    private Long groupId;
    private String sessionTokenId;
    private String txTokenId;
    private String onetimeToken;
    private Date lastUpdateDateTime;
    private String menuGroup;
    private Long rootMenuId;
    private Date rootMenuEndTerm;
    @Modeler(@Model(refer = "/login", type = ModelType.select, options = {"ko:KO", "en:EN", "de:DE", "fr:FR", "es:ES", "cs:CZ"}, displayOrder = 3))
    private String locale;
    private String userName;
    private String userPhone;
    private String userGrade;

    public Session() {
    }

    public Session(String userId, Long groupId, String sessionTokenId, String txTokenId, Date lastUpdateDateTime, String menuGroup, String locale, String userName, String userPhone, String userGrade) {
        this.userId = userId;
        this.groupId = groupId;
        this.sessionTokenId = sessionTokenId;
        this.txTokenId = txTokenId;
        this.lastUpdateDateTime = lastUpdateDateTime;
        this.menuGroup = menuGroup;
        this.locale = locale;
        this.userName = userName;
        this.userPhone = userPhone;
        this.userGrade = userGrade;
    }

    @Override
    public void initialize() {

    }
}
