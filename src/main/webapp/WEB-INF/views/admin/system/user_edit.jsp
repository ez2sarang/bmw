<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 2017. 4. 19.
  Time: AM 11:53
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%>
<div class="panel">
    <div class="panel-heading">
        <span class="panel-title">상세정보</span>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" id="entity-form" name="entity-form" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${param.id}"/>
            <ui:form entity="${entity}" type="modify"/>
        </form>
    </div>
</div>