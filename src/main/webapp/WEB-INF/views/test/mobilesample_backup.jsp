<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 12. 15.
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
        %>
<%@ include file="/WEB-INF/views/common/includes.jsp"
        %>
<html>
<head>
    <title>날쎈하</title>
    <style>
        #myCalendarContainer {
            width: 50%;
            height: 50%;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('.flexslider').flexslider({
                animation: "slide"
            });
            $('#myCalendar').fullCalendar({
                weekends: true
//                , weekends: false
                , header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                }
                , selectable: true
                , dayClick: function (start, end, allDay, jsEvent, view) {

                    $(this).popover({
                        html: true,
                        placement: 'top',
                        title: function () {
                            return $("#popover-head").html();
                        },
                        content: function () {
                            return $("#popover-content").html();
                        }
                    });
                }
            });
            $("#test").popover({
                html: true,
                placement: 'bottom',
                title: function () {
                    return $("#popover-head").html();
                },
                content: function () {
                    return $("#popover-content").html();
                }
            });
        });
    </script>
</head>
<body>
<div class="row" style="padding-top: 62px;width:100%;"></div>
<div class="row"
     style="width:100%;/*(!mobile) padding-left: 100px;padding-right: 100px;*/ font-size: 20px; color: dimgray;"
     align="center">
    <div class="col-xs-4"><i class="fa fa-calendar"></i> 예약</div>
    <div class="col-xs-4" style="border-left-style: dotted;border-right-style: dotted;; border-color: darkgrey;"><i
            class="fa fa-ticket"></i> 스타일
    </div>
    <div class="col-xs-4"><i class="fa fa-opencart"></i> 쿠폰</div>
</div>
<section id="features" class="slider flexslider" style="width: 100%;">
    <ul class="slides" style="width: 100%;">
        <li>
            <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-01.jpg"/>

            <p class="flex-caption">Style Apple</p>
        </li>
        <li>
            <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg"/>

            <p class="flex-caption">헤어컷 2</p>
        </li>
        <li>
            <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-03.jpg"/>

            <p class="flex-caption">펌 3</p>
        </li>
    </ul>
</section>
<div class="row" style="width:100%;">
    <div class="col-xs-12" style="width:100%;">
        <div class="panel panel-info">
            <div class="panel-heading">
                <span class="panel-title">스타일</span>
            </div>
            <div class="panel-body">
                <div class="bs-callout bs-callout-info thumbnail" id="style1">
                    <h4>No default class</h4>

                    <p>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't
                        make too much sense, so you're required to specify a type via contextual class. Choose from
                        success, info, warning, or danger.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <span class="panel-title">쿠폰</span>
            </div>
            <div class="panel-body">
                <div class="bs-callout bs-callout-info thumbnail" id="coupon1">
                    <h4>No default class</h4>

                    <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg"
                            style="width:200px;"/><br/>Alerts don't have default classes, only base and modifier
                        classes. A default gray alert doesn't
                        make too much sense, so you're required to specify a type via contextual class. Choose from
                        success, info, warning, or danger.</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<style>
</style>
