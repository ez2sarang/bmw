<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 16. 5. 20.
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
  displayTarget : 값을 지정하지 않아도 되고, 기존화면과 레이어가 겹칠때 충돌을 방지하기 위한 명칭임
  viewUrl : 상세보기
  regUrl : 등록
  editUrl : 수정
--%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><c:set var="ctxRoot" value="${pageContext.request.contextPath}"/>
<script language="javascript">
    function goList${param.displayTarget}(reDrawDataTableList) {
        $('#detailDiv${param.displayTarget}').html("").hide();
        $('#listDiv${param.displayTarget}').show();
        if (reDrawDataTableList) {
            reDrawDataTableList.draw(true);
        }
    }
    function viewDetail${param.displayTarget}(dataId) {
        $('#listDiv${param.displayTarget}').hide();
        location.href = "#detailView${param.displayTarget}";
        var tUrl = "${ctxRoot}${param.viewUrl}" + dataId;
        $('#detailDiv${param.displayTarget}').load(tUrl);
        $('#detailDiv${param.displayTarget}').show();
    }
    function addData${param.displayTarget}(submitUrl) {
        var tUrl = "${ctxRoot}${param.regUrl}";
        alertWindow('수정', '<div id="regDiv"></div>', function () {
            return formSubmit(submitUrl
                    , '<spring:eval expression="T(org.mariapresso.impd.constant.ResultType).OK.code"/>'
                    , <spring:eval expression="T(org.mariapresso.impd.constant.ResultType).reference"/>
                    , '${_csrf.headerName}'
                    , '${_csrf.token}'
            );
        });
        $("#regDiv").load(tUrl, function (response, status, xhr) {
        });
    }
    function editData${param.displayTarget}(id, submitUrl) {
        var tUrl = "${ctxRoot}${param.editUrl}" + id;
        alertWindow('수정', '<div id="modifyDiv"></div>', function () {
//            alert($('#modify-form').valid());
            return formSubmit(submitUrl
                    , '<spring:eval expression="T(org.mariapresso.impd.constant.ResultType).OK.code"/>'
                    , <spring:eval expression="T(org.mariapresso.impd.constant.ResultType).reference"/>
                    , '${_csrf.headerName}'
                    , '${_csrf.token}'
                    , id
            );
        });
        $("#modifyDiv").load(tUrl, function (response, status, xhr) {
        });
    }
    function deleteData${param.displayTarget}(reDrawDataTableList) {
        var tUrl = "${param.delUrl}";
        alertWindow("삭제", "삭제하시겠습니까?", function(){
            var resultValue = formSubmit(tUrl
                    , '<spring:eval expression="T(org.mariapresso.impd.constant.ResultType).OK.code"/>'
                    , <spring:eval expression="T(org.mariapresso.impd.constant.ResultType).reference"/>
                    , '${_csrf.headerName}'
                    , '${_csrf.token}'
            );
            if(resultValue) {
                $('#detailDiv${param.displayTarget}').html("").hide();
                $('#listDiv${param.displayTarget}').show();
                if (!isEmpty(reDrawDataTableList)) {
                    reDrawDataTableList.draw(true);
                }
            }
            return resultValue;
        });
    }
</script>