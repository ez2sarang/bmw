<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 16. 4. 7.
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%><html>
<head>
    <title>${contentId}</title>
    <script>
        $("document").ready(function(){
            <c:if test="${not empty contentId}">//location.href="#detailView";</c:if>
        });
    </script>
</head>
<body>
<div class="bs-callout bs-callout-info thumbnail" id="coupon0">
    <h4><a href="${ctxRoot}/${groupId}/viewContent.do">No default class(${group.type})</a></h4>

    <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"/><br/>Alerts
        don't have default classes, only base and modifier classes. A default gray alert doesn't
        make too much sense, so you're required to specify a type via contextual class. Choose from
        success, info, warning, or danger.</p>
</div>
<div class="bs-callout bs-callout-info thumbnail" id="coupon2">
    <h4><a href="javascript:showPage('${ctxRoot}/${groupId}/viewContent.do?contentId=${contentId}');">No default class(${group.type})</a></h4>

    <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"/><br/>Alerts
        don't have default classes, only base and modifier classes. A default gray alert doesn't
        make too much sense, so you're required to specify a type via contextual class. Choose from
        success, info, warning, or danger.</p>
</div>
<div class="bs-callout bs-callout-info thumbnail" id="coupon3">
    <h4>No default class</h4>

    <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"/><br/>Alerts
        don't have default classes, only base and modifier classes. A default gray alert doesn't
        make too much sense, so you're required to specify a type via contextual class. Choose from
        success, info, warning, or danger.</p>
</div>
</body>
</html>
