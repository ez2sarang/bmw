<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 12. 15.
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><tiles:getAsString name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" href="${ctxRoot}/style/impd.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctxRoot}/style/impd.css">
    <c:import url="/WEB-INF/views/include/mainStyle.jsp" charEncoding="UTF-8">
        <c:param name="bgColor" value="3F51B5"></c:param>
    </c:import><%--F4F2F3--%>
    <!--[if lt IE 9]>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- <![endif]-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $(window).bind('hashchange', function () {
                var hash = window.location.hash.slice(1);
                if (hash == 'detailView') {
                    $('#listDiv').hide();
                    $('#detailDiv').show();
                } else /*if(hash == 'listView')*/ {
                    $('#detailDiv').html('').hide();
                    $('#listDiv').show();
                }
            });

            try {
//                alert($("#infoBody")?"true":"false");
                $(this).scroll(function () {
    //                    stickyNav();
                    if ($(this).scrollTop() === 0) {
                        $("#goTopInfo").hide();
                    } else {
                        $("#goTopInfo").show();
                    }
                });
            } catch (e) {
                console.log(e);
            }
        });
    </script>
</head>
<body id="infoBody">
    <div id="main-wrapper">
        <header id="header" style="width:100%;">
            <div class="drawer-toggle"><a id="contentBack" href="#" onclick='setTimeout("$(\"#modal-fullscreen\").html(\"\")", 1000);' data-dismiss="modal"><i class="glyphicon glyphicon-menu-left"></i></a>
            </div>
            <h3><a href="${ctxRoot}/${groupId}/mobile.do">${groupName}</a></h3>
        </header>
    </div>
    <div class="row" id="listDiv">
        <div class="panel panel-info" style="padding-top: 0px;">
            <div class="panel-body">
                <tiles:insertAttribute name="body"/>
            </div>
        </div>
    </div>
    <div id="goTopInfo" class="o-button replyLink" style="display:none;" onclick='$("body,html").animate({ scrollTop: "0" });return false;'><i class="fa fa-angle-up"></i></div>
</body>
</html>
