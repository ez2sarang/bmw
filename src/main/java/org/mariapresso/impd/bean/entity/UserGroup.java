package org.mariapresso.impd.bean.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import kr.co.fcsoft.core.bean.EntityObject;
import kr.co.fcsoft.core.helper.JsonDateTimeSerializer;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.mariapresso.impd.annotation.bean.Expression;
import org.mariapresso.impd.annotation.bean.Restriction;
import org.springframework.data.domain.Pageable;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Entity
@Table(name = "UserGroup")
@EqualsAndHashCode(callSuper=false)
public @Data class UserGroup extends EntityObject {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    @Restriction(Expression.like)
    private String name;
    private Long parentId;
    private String type;
    @JsonSerialize(using = JsonDateTimeSerializer.class)
    private Date startTime;
    @JsonSerialize(using = JsonDateTimeSerializer.class)
    private Date endTime;
    private String owner;
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date createTime;
    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.groupId", cascade=CascadeType.ALL)
    private Set<JoinGroup> joinGroups;
    @NotFound(action= NotFoundAction.IGNORE)
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "parentId", insertable=false, updatable=false)
    private UserGroup parent;

    public UserGroup() {
    }

    public UserGroup(long groupId) {
        this.id = groupId;
    }

    public UserGroup(String type) {
        this.type = type;
    }

    @Override
    public void initialize() {
        if(null != joinGroups && joinGroups.size()>0) {
        }
    }
}
