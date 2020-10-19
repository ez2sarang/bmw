<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 12. 15.
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%><!DOCTYPE html><!--[if IE 8]>
<html class="ie8"> <![endif]--><!--[if IE 9]>
<html class="ie9 gt-ie8"> <![endif]--><!--[if gt IE 9]><!-->
<html class="gt-ie8 gt-ie9 not-ie"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title><tiles:getAsString name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

    <%--<link href='//fonts.googleapis.com/css?family=Lato:100,400,700' rel='stylesheet' />--%>
    <%--<link href='https://fullcalendar.io/css/base.css?3.2.0-1.5.1-3' rel='stylesheet' />--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker3.standalone.css" type="text/css">
    <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
    <link rel="stylesheet" href="${ctxRoot}/js/flexslider/flexslider.css" type="text/css" />
    <link rel="stylesheet" href="${ctxRoot}/style/impd.css">
    <link rel="stylesheet" href="${ctxRoot}/assets/swiper.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxRoot}/assets/external/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxRoot}/assets/external/css/fullcalendar.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxRoot}/assets/external/css/fullcalendar.print.css" media="print">
    <style>

    </style>
    <c:import url="/WEB-INF/views/include/mainStyle.jsp" charEncoding="UTF-8">
        <c:param name="bgColor" value="3F51B5"></c:param><%--3F51B5 5f5f5f--%>
    </c:import><%--F4F2F3--%>
    <!--[if lt IE 9]>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- <![endif]-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/jquery.validate.min.js"></script>
    <script src="${ctxRoot}/js/validate/messages_ko.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.kr.min.js"></script>
    <script src="${ctxRoot}/assets/external/js/moment.js"></script>
    <%--<script src="${ctxRoot}/assets/external/js/moment-with-locales.js"></script>--%>
    <script src="${ctxRoot}/assets/external/js/jquery.form.js"></script>
    <%--<script src="${ctxRoot}/assets/external/js/dropzone.js"></script>--%>
    <script src="${ctxRoot}/assets/external/js/fullcalendar.min.js"></script>
    <script src="${ctxRoot}/assets/external/js/locale-all.js"></script>
    <%--<script src="${ctxRoot}/js/carousel/jQuery.Brazzers-Carousel.js"></script>--%>
    <script src="${ctxRoot}/js/impd.js"></script>
    <script src="${ctxRoot}/js/impd-ui.js"></script>
    <script src="${ctxRoot}/assets/swiper.js"></script>
    <script src="${ctxRoot}/js/flexslider/jquery.flexslider.js"></script>
    <%--<script src="http://demo.hongkiat.com/css-sticky-position/js/jquery-scrolltofixed-min.js"></script>--%><%--scrollToFixed--%>
    <script language="javascript">
        ctxRoot = "${ctxRoot}";
        var links;
        var menuBar = {
            showInput : function(){
                $('#menuBar').hide();
                $('#inputer').show();
            }
            , showMenu : function () {
                $("#drawer,html").addClass("opened");
                $('#inputer').hide();
                $('#menuBar').show();
            }
            , closeMenu : function () {
                $("#drawer,html").removeClass("opened");
            }
        };

        function blogSearch(q) {
            $("body,html").animate({
                scrollTop: "0"
            });
            $("#search-resultWrap").addClass("opened appearing");
            $("#search-result").html('');
            $("#search-result").load(location.origin + '/search/' + encodeURI(q) + ' #searchList',
                    function() {
                        $("#search-result").append('<div class="moreResult flatbutton"><a href="' + location.origin + '/search/' + encodeURI(q) + '">검색결과 전체 보기</a></div>');
                        $("#search-resultWrap").css("height", ($("#search-result").height() + 70) + "px");
                    }
            );
        }


        $(document).ready(function() {
            /*$.tools.validator.localize("ko", {
                '*'          : 'Virheellinen arvo',
                ':email'     : 'Virheellinen s&auml;hk&ouml;postiosoite',
                ':number'    : 'Arvon on oltava numeerinen',
                ':url'       : 'Virheellinen URL',
                '[max]'      : 'Arvon on oltava pienempi, kuin $1',
                '[min]'      : 'Arvon on oltava suurempi, kuin $1',
                '[required]' : 'Kent&auml;n arvo on annettava'
            });*/

            $('form#apiForm').ajaxSubmit({
                url: ctxRoot + "/resource.do"
                , complete: function (xhr) {
//                    alert(xhr.responseText);
                    var msg = JSON.parse(xhr.responseText);
                    links = msg;
                    for (var idx in msg) {
                        switch (msg[idx].link) {
                            case '/coupon':
                                drawMenu("#menuList", msg[idx], 'opencart');
                                break;
                            case '/style':
                                drawMenu("#menuList", msg[idx], 'ticket');
                                break;
                            case '/login':
                                drawMenu("#menuList", msg[idx], 'login');
                                break;
                            default : break;
                        }
                    }
                }
            });



            // grab the initial top offset of the navigation
            var stickyNavTop = $('#navbar-collapsible').offset().top;

            // our function that decides weather the navigation bar should have "fixed" css position or not.
            var stickyNav = function(){
                var scrollTop = $(window).scrollTop(); // our current vertical position from the top

                // if we've scrolled more than the navigation, change its position to fixed to stick to top,
                // otherwise change it back to relative
                if (scrollTop > stickyNavTop) {
                    $('#navbar-collapsible').addClass('sticky');
                } else {
                    $('#navbar-collapsible').removeClass('sticky');
                }
            };

            stickyNav();
            // and run it again every time you scroll
            $(window).scroll(function() {
                stickyNav();
                if ($(window).scrollTop() === 0) {
                    $("#goTop").hide();
                } else {
                    $("#goTop").show();
                }
            });
            /*$("#background_blocker").on('click', function () {
             $("#drawer").hide();
             $("#background_blocker").hide();
             })*/
//            $("#inputer").on('click', function (e) {
//
//            })

            $("#searchTxt").on('blur', function() {
                $("header #search-box").removeClass("opened");
                $("header #search-box").css("display","none");
            });
            $("#search-icon").click(function() {
                $("header #search-box").css("display","block");
                $("header #search-box").addClass("opened");
                $("header #search-box>input").focus();
            });

            $(".popover-test").popover();
            $(".popover-demo").popover({
                selector: '[data-toggle="popover"]',
                container: "body"
            });
            $(".bs-docs-popover").popover();

            var tmp = $.fn.popover.Constructor.prototype.show;
            $.fn.popover.Constructor.prototype.show = function () {
                tmp.call(this);
                if (this.options.callback) {
                    this.options.callback();
                    $(".arrow").css("left","60%");
                }
            }
            $('.popover-calendar').popover({
                html: true
                , placement: 'bottom'
                , fixclass: 'calendar'
                , content: function () {
                    return $($(this).data('contentwrapper')).html();
                }
                , callback: function () {
                    $("#datepicker").datepicker({
                        prevText: '이전 달',
                        nextText: '다음 달',
                        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                        dayNames: ['일','월','화','수','목','금','토'],
                        dayNamesShort: ['일','월','화','수','목','금','토'],
                        dayNamesMin: ['일','월','화','수','목','금','토'],
                        dateFormat: 'yy-mm-dd',
                        showMonthAfterYear: true,
                        yearSuffix: '년'
                    });
                }
                /*, title: function () {
                 $("popover").css("width", "1000px");
                 return "Good";
                 }*/
            }).on("click", function () {
                $(this).next().addClass('calendar-open');
            });

            var dates = $("#from, #to").datepicker({
                showOn: "both",
                buttonImage: "${pageContext.request.contextPath}/images/popup/ico_cal.png",
                buttonImageOnly: true,
                prevText: '이전 달',
                nextText: '다음 달',
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNames: ['일','월','화','수','목','금','토'],
                dayNamesShort: ['일','월','화','수','목','금','토'],
                dayNamesMin: ['일','월','화','수','목','금','토'],
                dateFormat: 'yy-mm-dd',
                showMonthAfterYear: true,
                yearSuffix: '년',
                onSelect: function( selectedDate ) {
                    var option = this.id == "from" ? "minDate" : "maxDate",
                            instance = $( this ).data( "datepicker" ),
                            date = $.datepicker.parseDate(
                                    instance.settings.dateFormat ||
                                    $.datepicker._defaults.dateFormat,
                                    selectedDate, instance.settings );
                    dates.not( this ).datepicker( "option", option, date );
                }
            });


            /* activate scrollspy menu */
            $('body').scrollspy({
                target: '#navbar-collapsible',
                offset: 50
            });
            /* smooth scrolling sections */
//            $('a[href*=#]:not([href=#])').click(function() {
//                if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
//                    var target = $(this.hash);
//                    target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
//                    if (target.length) {
//                        $('html,body').animate({
//                            scrollTop: target.offset().top - 50
//                        }, 1000);
//                        return false;
//                    }
//                }
//            });
        });
    </script>
</head>
<body class="theme-default main-menu-animated">
<div id="main-wrapper" style="margin-left: 0; margin-right: 0;">
    <!-- 2. $MAIN_NAVIGATION ===========================================================================

        Main navigation
    -->
    <header id="header" class="header" style="width:100%;">
        <div class="drawer-toggle"><a href="javascript:menuBar.showMenu();"><i class="glyphicon glyphicon-menu-hamburger"></i></a>
        </div>
        <h3><a href="${ctxRoot}/${groupId}/mobile.do">${groupName}</a></h3>
        <div class="right iconmenu pull-right" style="position:fixed; top:0; right:0;">
            <span class="iconmenu-wrap">
                <span class="iconmenu-main"><a id="search-icon" href="" onclick="return false;" title="search"><i class="fa fa-search"></i></a></span>
            </span>
        </div>
        <%--<div id="search-box" style="display: none;">
            <input placeholder="블로그 검색" class="search-query" type="text" name="search" value="" onkeypress="if (event.keyCode == 13) { blogSearch($(this).val()); }"/>
            <span class="iconmenu-main"><a id="remove-icon" href="" onclick="$('#searchTxt').val('')" title="search"><i class="glyphicon glyphicon-remove"></i></a></span>
        </div>--%>
        <div id="search-box" class="col-md-12" style="display: none;">
            <div class="input-group">
                <input style="outline: none;border: none !important;-webkit-box-shadow: none !important;-moz-box-shadow: none !important;box-shadow: none !important;" class="form-control search-query" type="text" placeholder="스타일 검색" id="searchTxt" name="search" value="" onkeypress="if (event.keyCode == 13) { blogSearch($(this).val()); }">
                <span class="input-group-btn">
                    <span class="iconmenu-main"><i style="color: white;" class="glyphicon glyphicon-remove" onclick='$("#searchTxt").val("");'></i></span>
                </span>
            </div>
        </div>
    </header>
    <nav id="navbar-collapsible" class="navbar-sticky">
        <ul class="nav navbar-nav" style="margin:0">
            <li><a href="#" onclick="gotoNavi(this,0);/*try{$('#home').gotoAnchor(this, 0);}catch(e){console.log(e);}*/">Home</a></li>
            <li><a href="#" onclick="gotoNavi(this,1);/*try{$('#style').gotoAnchor(this, 1);}catch(e){console.log(e);}*/">style</a></li>
            <li><a href="#" onclick="gotoNavi(this,2);/*try{$('#coupon').gotoAnchor(this, 2);}catch(e){console.log(e);}*/">coupon</a></li>
            <li><a href="#" onclick="gotoNavi(this,3);/*showPage('${ctxRoot}/hnews/contents.do')*/">calendar</a></li>
            <%--<li><a style="color: #FFF;" class="icon" href="#style" &lt;%&ndash;onclick="try {$('#modal-fullscreen').load('${ctxRoot}/hnews/contents.do',function(response, status, xhr){ if (status == 'success') {$('#modal-fullscreen').modal('show');}})} catch(e) { alert(e); }"&ndash;%&gt; &lt;%&ndash;data-target="#modal-fullscreen"&ndash;%&gt; data-toggle="modal" data-direction="left"><i class="fa fa-ticket"></i> 스타일</a></li>
            <li><a style="color: #FFF;" class="icon" href="#coupon"><i class="fa fa-opencart"></i> 쿠폰</a></li>
            <li><a style="color: #FFF;" class="icon popover-calendar" data-contentwrapper=".pop-calendar" href="" onclick="return false;"><i class="fa fa-calendar"></i> 예약</a></li>--%>
        </ul>
        <%--<div class="col-xs-12" align="left">
            &lt;%&ndash;<div class="col-xs-4">&ndash;%&gt;
                <a href="#home">홈</a>
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;<div class="col-xs-4" style="border-left-style: dotted;border-right-style: dotted;; border-color: darkgrey;">&ndash;%&gt;
                <a href="#style" &lt;%&ndash;onclick="try {$('#modal-fullscreen').load('${ctxRoot}/hnews/contents.do',function(response, status, xhr){ if (status == 'success') {$('#modal-fullscreen').modal('show');}})} catch(e) { alert(e); }"&ndash;%&gt; &lt;%&ndash;data-target="#modal-fullscreen"&ndash;%&gt; &lt;%&ndash;data-toggle="modal" data-direction="left"&ndash;%&gt;>스타일</a>
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;<div class="col-xs-4">&ndash;%&gt;
                <a href="#coupon">쿠폰</a>
            &lt;%&ndash;</div>&ndash;%&gt;
            <a class="popover-calendar" data-contentwrapper=".pop-calendar" href="" onclick="return false;">예약</a>
        </div>--%>
    </nav>
    <nav id="drawer">
        <div id="menuBar">
            <div id="drawer_profile">
                <img src="${ctxRoot}/img/user.png" alt="user"/>
                <a href="${ctxRoot}/mobilesample.do">
                    <div id="drawer_name">
                        <p class="blogTitle">정재우</p>

                        <p class="blogDesc">관리메뉴</p>
                    </div>
                </a>
            </div>
            <div id="drawer_login" class="iconbutton ripplelink">
            </div>
            <!-- Sidebar -->
            <div class="drawer_container">
                <div class="up-progress">
                    <div class="bar"></div>
                    <div class="percent">0%</div>
                </div>
                <div id="status"></div>
                <div id="menuList" class="listWrap">
                    <%--<ul>
                        <li><a href="#inputer"><i class="fa fa-opencart"></i> Style</a>
                        </li>
                        <li><a href="#inputer"><i class="fa fa-ticket"></i> Coupon</a>
                        </li>
                        <li><a href="#inputer"><i class="ic-sms"></i> 방명록</a>
                        </li>
                    </ul>--%>
                </div>
            </div>
        </div>
        <div id="inputer">
            <form id="apiForm">
            </form>
            <div class="panel-footer">
                <button class="btn btn-danger btn-sm active" onclick="menuBar.showMenu()">취소</button>
                <button class="btn btn-primary btn-sm active" onclick="callApi(apiUrl)">저장</button>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->
    </nav>
    <div id="background_blocker" onclick="menuBar.closeMenu();"></div>

    <div id="content-wrapper">
        <div class="disablingDiv"></div>
        <tiles:insertAttribute name="body"/>
    </div>
    <!-- / #content-wrapper -->
    <div id="main-menu-bg"></div>
    <div id="search-resultWrap" class="card">
        <svg class="spinner" width="30px" height="30px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
            <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
        </svg>
        <button id="search-result-close" class="ripplelink iconbutton"><i class="ic-close"></i>
        </button>
        <div id="search-result">
        </div>
    </div>
</div>
<aside></aside>
<!-- / #main-wrapper -->
<script type="text/javascript">
/*
    init.push(function () {
        // Javascript code here
    });
    window.PixelAdmin.start(init);

    function cusorControlForLoading() {
        $('.disablingDiv').css({
            'display': 'block',
            'cursor': 'wait'
        });
    }

    function cusorControlForLoaded() {
        $('.disablingDiv').css({
            'cursor': 'default',
            'display': 'none'
        });
    }
*/
</script>
<div id="goTop" class="o-button replyLink" style="display:none;" onclick='$("body,html").animate({ scrollTop: "0" });return false;'><i class="fa fa-angle-up"></i>
</div>
<div class="pop-content pop-calendar form-horizontal" style="display: none;">
    <div id="datepicker"></div>
    <div class="form-group">
        <select id="regTime" name="regTime" class="form-control">
            <option value="09">09시</option>
            <option value="10">10시</option>
            <option value="11">11시</option>
            <option value="12">12시</option>
            <option value="13">13시</option>
            <option value="14">14시</option>
            <option value="15">15시</option>
            <option value="16">16시</option>
            <option value="17">17시</option>
            <option value="18">18시</option>
            <option value="19">19시</option>
            <option value="20">20시</option>
        </select>
    </div>
    <div class="form-group">
        <input type="number" id="regPhone" name="regPhone" class="form-control" placeholder="전화번호"/>
    </div>
    <div class="form-group">
        <input type="text" id="regName" name="regName" class="form-control" placeholder="예약자 이름"/>
    </div>
    <footer style="text-align: right;"><button class="btn btn-primary">예약하기</button></footer>
</div>
</body>
</html>