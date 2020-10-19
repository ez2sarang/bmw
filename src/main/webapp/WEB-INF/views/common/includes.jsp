<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 12. 15.
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"
%><%@ taglib prefix="ui" uri="/META-INF/tags/ui.tld"
%><c:set var="ctxRoot" value="${pageContext.request.contextPath}"
/><c:set var="requestURI" value='${pageContext.request.getAttribute("javax.servlet.forward.request_uri")}'/>