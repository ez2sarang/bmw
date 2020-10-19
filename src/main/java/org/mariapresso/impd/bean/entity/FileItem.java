package org.mariapresso.impd.bean.entity;

import kr.co.fcsoft.core.bean.EntityObject;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.mariapresso.config.RootConfig;
import org.mariapresso.impd.bean.communicate.UserApi;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.File;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Slf4j
@Entity
@EqualsAndHashCode(callSuper=false)
public @Data class FileItem extends EntityObject implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    private Long fileGroupId;
    private String display;
    private String description;
    private String location;
    private String name;
    private String type;
    private Long size;
    private Boolean visible;
    private String owner;
    private Integer displayOrder;
    private Date createTime;

    public FileItem() {
    }

    public FileItem(long id) {
        this.id = id;
    }

    public FileItem(Long fileGroupId, File file, UserApi user) throws Exception {
        String parent = file.getParent();
        this.fileGroupId = fileGroupId;
        this.display = file.getName();
        this.location = "/" + user.getGroupId();
        this.name = parent.substring(parent.lastIndexOf("/")+1);
        this.type = "pic";
        this.size = file.length();
        this.visible = true;
        this.owner = user.getUserId();
        this.displayOrder = Integer.parseInt(name.substring(name.lastIndexOf("_")+1));
        this.createTime = new Date();
        boolean result = file.renameTo(checkFile(new File(RootConfig.REPOSITORY_PATH+this.location+"/"+this.name + StringUtils.trimToEmpty(display.substring(display.lastIndexOf(".")))), true));
        System.out.println("file result:"+result);
    }

    public static File checkFile(File newFile, boolean hasCreate) throws Exception {
        if(newFile.getName().indexOf('.')>-1) {
            if(!newFile.getParentFile().exists()) {
                log.info(String.format("%s:makeFile(%b)", newFile.getParentFile().getPath(), newFile.getParentFile().mkdirs()));//WARN 주석처리시 오류남
            }
            if(hasCreate && !newFile.exists()) {
                newFile.createNewFile();
            }
        } else {
            if(hasCreate && !newFile.exists()) {
                log.info(String.format("%s:makeFile(%b)", newFile.getPath(), newFile.mkdirs()));//WARN 주석처리시 오류남
            }
        }
        return newFile;
    }

    public String getPath() {
        return RootConfig.REPOSITORY_PATH+this.location+"/"+this.name;
    }

    @Override
    public void initialize() {

    }

    public static void main(String[] args) {
        String aa = "asdfj_alksdf_0000002";
        System.out.println(aa.substring(aa.lastIndexOf("_")+1));
        System.out.println(Integer.parseInt(aa.substring(aa.lastIndexOf("_")+1)));
        System.out.println(StringUtils.trimToEmpty(aa.substring(aa.lastIndexOf("."))));

    }
}
