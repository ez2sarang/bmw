<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 12. 15.
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="application/vnd.ms-excel" language="java" pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"
%><c:set var="contentDisposition" value="attachment; filename=${fileName}.xls"
/>${pageContext.response.setHeader('Content-Disposition', contentDisposition)}<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title></title>
    </head>
    <body>
        <tiles:insertAttribute name="body"/>
    </body>
</html>
