package org.mariapresso.impd.bean.communicate;


import org.mariapresso.impd.constant.ResultType;

/**
 * Created by ez2sarang on 15. 6. 8..
 */
public interface ValidationSupporter {
    String getErrorString();

    String getResultCode();

    void setResultCode(ResultType result);

    void setResultCode(ResultType result, String errorString);
}
