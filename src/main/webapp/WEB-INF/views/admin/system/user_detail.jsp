<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 2017. 4. 17.
  Time: PM 8:05
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%><div class="panel">
    <div class="panel-heading">
        <span class="panel-title">상세정보</span>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" id="entity-form">
            <input type="hidden" name="id" value="${param.id}"/>
            <ui:form entity="${entity}" type="info"/>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="tl-body">
            <c:choose>
                <c:when test="${param.windowOption=='popup'}">
                    <div align="right">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code='button.close'/></button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="float:left;">
                        <button class="btn btn-primary" onclick="goList();">목록</button>
                    </div>
                    <div align="right">
                        <button class="btn btn-danger" onclick="deleteData();">삭제</button>
                        <button class="btn btn-primary" onclick="editData('${param.id}', '/system/userModify.do');">수정</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>