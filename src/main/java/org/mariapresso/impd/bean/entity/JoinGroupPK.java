package org.mariapresso.impd.bean.entity;

import lombok.Data;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;
import java.io.Serializable;

/**
 * Created by ez2sarang on 2015. 7. 15..
 */
@Embeddable
public @Data class JoinGroupPK implements Serializable {
    private static final long serialVersionUID = 3L;
    private long groupId;
    private long id;
}
