package org.mariapresso.impd.bean.communicate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.mariapresso.impd.constant.ResultType;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * Created by ez2sarang on 15. 3. 26..
 */
public class PageableApi extends UserApi {
    @NotNull
    @Min(1)
    private Integer listCount;
    private int totalCount;
    @NotNull
    @Min(1)
    private Integer pageNo;
    @JsonIgnore
    private String sortItem;
    @JsonIgnore
    private String sortDirection;

    public PageableApi(String resultCode, String errorString) {
        super(resultCode, errorString);
    }

    public PageableApi(ResultType result) {
        super(result);
    }

    public PageableApi(ResultType result, String transactionToken) {
        super(result, transactionToken);
    }

    public Integer getListCount() {
        return listCount;
    }

    public void setListCount(Integer listCount) {
        this.listCount = listCount;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public String getSortDirection() {
        return sortDirection;
    }

    public void setSortDirection(String sortDirection) {
        this.sortDirection = sortDirection;
    }

    public String getSortItem() {
        return sortItem;
    }

    public void setSortItem(String sortItem) {
        this.sortItem = sortItem;
    }
}
