package org.mariapresso.impd.bean.communicate;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Created by ez2sarang on 15. 6. 23..
 */
public @Data
class UploadItem {
    private String sessionToken;
    private String txToken;
    private CommonsMultipartFile[] fileData;
}
