package org.mariapresso.impd.bean.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Entity
@Table(name = "JoinGroup")
@AssociationOverrides(
        {
                @AssociationOverride(name = "pk.groupId", joinColumns = @JoinColumn(name = "groupId"))
        ,       @AssociationOverride(name = "pk.id", joinColumns = @JoinColumn(name = "id"))
        }
)
public @Data class JoinGroup implements Serializable {
    private static final long serialVersionUID = 2L;
//    @Id
//    private long groupId;
//    @Id
//    private long id;
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long idx;
    private String status;
    private String description;
    private Long roleId;
    private Date joinTime;

    private JoinGroupPK pk = new JoinGroupPK();

    @EmbeddedId
    public JoinGroupPK getPk() {
        return this.pk;
    }

    public void setPk(JoinGroupPK pk) {
        this.pk = pk;
    }

    @Transient
    public long getGroupId() {
        return getPk().getGroupId();
    }

    public void setGroupId(long userGroupId) {
        getPk().setGroupId(userGroupId);
    }

    @Transient
    public long getId() {
        return getPk().getId();
    }

    public void setId(long userId) {
        getPk().setId(userId);
    }

    /*@Transient
    private UserGroup userGroup;

    @Transient
    private User user;*/

    public JoinGroup() {
    }

    public JoinGroup(User user, String status, long roleId, Date joinTime) {
//        this.id = id;
        this.pk.setGroupId(user.getGroupId());
        this.pk.setId(user.getId());
        this.status = status;
        this.roleId = roleId;
        this.joinTime = joinTime;
    }
}
