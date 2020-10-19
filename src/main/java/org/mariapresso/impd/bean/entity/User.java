package org.mariapresso.impd.bean.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import kr.co.fcsoft.core.bean.EntityObject;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.*;
import org.hibernate.annotations.CascadeType;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.bean.Expression;
import org.mariapresso.impd.annotation.bean.Restriction;
import org.mariapresso.impd.annotation.ui.Action;
import org.mariapresso.impd.annotation.ui.Linker;
import org.mariapresso.impd.annotation.ui.Model;
import org.mariapresso.impd.annotation.ui.Modeler;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by ez2sarang on 15. 4. 8..
 */
@Entity
@Table(name = "User")
@EqualsAndHashCode(callSuper=false)
public @Data class User extends EntityObject implements Serializable {
    private static final long serialVersionUID = 4L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    @Restriction(Expression.like)
    private String userId;
    private Long groupId;
    private String password;
    private String type;
    private Long fileId;
    private String userName;
    private String userEmail;
    private String userPhone;
    private String userGrade;
    private String userProfile;
    private Long linkId;
    private String status;
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date createTime;

    public User() {
    }

    public User(long id) {
        this.id = id;
    }

    @Override
    public void initialize() {

    }


    /*@OneToMany(*//*fetch = FetchType.LAZY, *//*mappedBy = "pk.id")*/
//    @Cascade(CascadeType.ALL)
//    private Set<JoinGroup> joinGroups;

}