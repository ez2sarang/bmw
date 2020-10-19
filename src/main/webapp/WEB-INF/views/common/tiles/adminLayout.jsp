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

    <!-- test
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker3.standalone.css" type="text/css">
    <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
    -->

    <link rel="stylesheet" href="${ctxRoot}/js/flexslider/flexslider.css" type="text/css" />
    <link rel="stylesheet" href="${ctxRoot}/style/impd.css">
    <link rel="stylesheet" href="${ctxRoot}/assets/swiper.css">
    <!-- Latest compiled and minified CSS -->
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">--%>
    <!-- Optional theme -->
    <!-- test
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    -->
    <link rel="stylesheet" type="text/css" href="${ctxRoot}/assets/external/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxRoot}/assets/external/css/fullcalendar.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxRoot}/assets/external/css/fullcalendar.print.css" media="print">

    <!-- test font
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,800,300&subset=latin" rel="stylesheet" type="text/css">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css">
    -->
    <link rel="stylesheet" href="${ctxRoot}/assets/external/css/fonts.css" type="text/css" />
    <link rel="stylesheet" href="${ctxRoot}/assets/external/css/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="${ctxRoot}/assets/external/css/ionicons-2.0.1/css/ionicons.min.css" type="text/css" />


    <%--
    <!--[if lt IE 9]>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- <![endif]-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/jquery.validate.min.js"></script>
    --%>
    <!-- Get jQuery from Google CDN -->
    <!--[if !IE]> -->
    <script type="text/javascript"> window.jQuery || document.write('<script src="${ctxRoot}/assets/external/js/jquery-2.2.0.js">'+"<"+"/script>"); </script>
    <!-- <![endif]-->
    <!--[if lte IE 9]>
    <script type="text/javascript"> window.jQuery || document.write('<script src="${ctxRoot}/assets/external/js/jquery-1.12.0.js">'+"<"+"/script>"); </script>
    <![endif]-->
    <%--<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>--%>
    <script src="${ctxRoot}/assets/external/js/jquery.cookie.js"></script>
    <script src="${ctxRoot}/assets/external/js/jquery-validation-1.16.0/jquery.validate.min.js"></script>
    <script src="${ctxRoot}/assets/external/js/jquery-validation-1.16.0/localization/messages_ko.min.js"></script>

    <%--spinner--%>
    <%--<link rel="stylesheet" href="${ctxRoot}/js/spinner/css/iosOverlay.css">--%>
    <%--<link rel="stylesheet" href="${ctxRoot}/js/spinner/css/prettify.css">--%>
    <%--<script src="${ctxRoot}/js/spinner/js/iosOverlay.js"></script>--%>
    <script src="${ctxRoot}/assets/external/js/spin.js"></script>
    <%--<script src="${ctxRoot}/js/spinner/js/prettify.js"></script>--%>
    <%--<script src="${ctxRoot}/js/spinner/js/custom.js"></script>--%>
    <%--<script src="${ctxRoot}/js/spinner/js/modernizr-2.0.6.min.js"></script>--%>

    <%--<script src="${ctxRoot}/js/validate/messages_ko.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>--%>

    <!-- test
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.kr.min.js"></script>
    -->

    <script src="${ctxRoot}/assets/external/js/moment.js"></script>
    <%--<script src="${ctxRoot}/assets/external/js/moment-with-locales.js"></script>--%>
    <script src="${ctxRoot}/assets/external/js/jquery.form.js"></script>
    <script src="${ctxRoot}/assets/external/js/jquery-dateFormat.js"></script>
    <script src="${ctxRoot}/assets/external/js/dropzone.js"></script>
    <script src="${ctxRoot}/assets/external/js/fullcalendar.min.js"></script>
    <script src="${ctxRoot}/assets/external/js/locale-all.js"></script>
    <script src="${ctxRoot}/js/common.js"></script>
    <script src="${ctxRoot}/js/impd.js"></script>
    <script src="${ctxRoot}/js/impd-ui.js"></script>
    <script src="${ctxRoot}/assets/swiper.js"></script>
    <script src="${ctxRoot}/js/flexslider/jquery.flexslider.js"></script>

    <!-- DEMO ONLY: Function for the proper stylesheet loading according to the demo settings -->
    <script>ctxRoot = "${ctxRoot}";function _pxDemo_loadStylesheet(a,b,c){var c=c||decodeURIComponent((new RegExp(";\\s*"+encodeURIComponent("px-demo-theme")+"\\s*=\\s*([^;]+)\\s*;","g").exec(";"+document.cookie+";")||[])[1]||"default"),d="rtl"===document.getElementsByTagName("html")[0].getAttribute("dir");document.write(a.replace(/^(.*?)((?:\.min)?\.css)$/,'<link href="$1'+(c.indexOf("dark")!==-1&&a.indexOf("/css/")!==-1&&a.indexOf("/themes/")===-1?"-dark":"")+(d&&a.indexOf("assets/")===-1?".rtl":"")+'$2" rel="stylesheet" type="text/css"'+(b?'class="'+b+'"':"")+">"))}</script>

    <!-- DEMO ONLY: Set RTL direction -->
    <script>"1"===decodeURIComponent((new RegExp(";\\s*"+encodeURIComponent("px-demo-rtl")+"\\s*=\\s*([^;]+)\\s*;","g").exec(";"+document.cookie+";")||[])[1]||"0")&&document.getElementsByTagName("html")[0].setAttribute("dir","rtl");</script>

    <!-- DEMO ONLY: Load PixelAdmin core stylesheets -->
    <script>
        _pxDemo_loadStylesheet('${ctxRoot}/assets/admin/dist/css/bootstrap.css', 'px-demo-stylesheet-core');
        _pxDemo_loadStylesheet('${ctxRoot}/assets/admin/dist/css/pixeladmin.css', 'px-demo-stylesheet-bs');
        _pxDemo_loadStylesheet('${ctxRoot}/assets/admin/dist/css/widgets.css', 'px-demo-stylesheet-widgets');
    </script>

    <!-- DEMO ONLY: Load theme -->
    <script>
        function _pxDemo_loadTheme(a){var b=decodeURIComponent((new RegExp(";\\s*"+encodeURIComponent("px-demo-theme")+"\\s*=\\s*([^;]+)\\s*;","g").exec(";"+document.cookie+";")||[])[1]||"default");_pxDemo_loadStylesheet(a+b+".min.css","px-demo-stylesheet-theme",b)}
        _pxDemo_loadTheme('${ctxRoot}/assets/admin/dist/css/themes/');
    </script>

    <!-- Demo assets -->
    <script>_pxDemo_loadStylesheet('${ctxRoot}/assets/admin/dist/demo/demo.css');</script>
    <!-- / Demo assets -->

    <script src="${ctxRoot}/assets/admin/dist/demo/demo.js"></script>

    <script language="javascript">
        var links;
        var opts = {
            lines: 13 // The number of lines to draw
            , length: 28 // The length of each line
            , width: 14 // The line thickness
            , radius: 42 // The radius of the inner circle
            , scale: 1 // Scales overall size of the spinner
            , corners: 1 // Corner roundness (0..1)
            , color: '#000' // #rgb or #rrggbb or array of colors
            , opacity: 0.25 // Opacity of the lines
            , rotate: 0 // The rotation offset
            , direction: 1 // 1: clockwise, -1: counterclockwise
            , speed: 1 // Rounds per second
            , trail: 60 // Afterglow percentage
            , fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
            , zIndex: 2e9 // The z-index (defaults to 2000000000)
            , className: 'spinner' // The CSS class to assign to the spinner
            , top: '50%' // Top position relative to parent
            , left: '50%' // Left position relative to parent
            , shadow: false // Whether to render a shadow
            , hwaccel: false // Whether to use hardware acceleration
            , position: 'absolute' // Element positioning
        }
        var spinner;
        $(document).ready(function() {
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
        });
    </script>

    <!-- holder.js -->
    <script type="text/javascript" src="${ctxRoot}/assets/external/js/holder-2.9.0.js"></script>

</head>
<body>
    <script>var pxInit = [];</script>

    <tiles:insertAttribute name="side_menu"/>

    <tiles:insertAttribute name="top_menu"/>

    <script>
        pxInit.push(function() {
            $('#navbar-notifications').perfectScrollbar();
            $('#navbar-messages').perfectScrollbar();
        });
    </script>

    <!-- Custom styling -->
    <style>
        .page-header-form .input-group-addon,
        .page-header-form .form-control {
            background: rgba(0,0,0,.05);
        }
    </style>
    <!-- / Custom styling -->

    <tiles:insertAttribute name="body"/>

    <tiles:insertAttribute name="footer"/>

    <!-- Initialize demo sidebar on page load -->
    <script>
        pxDemo.initializeDemoSidebar();

        pxInit.push(function() {
            $('#px-demo-sidebar').pxSidebar();
            pxDemo.initializeDemo();
        });
    </script>

    <script src="${ctxRoot}/assets/admin/dist/js/bootstrap.js"></script>
    <script src="${ctxRoot}/assets/admin/dist/js/pixeladmin.js"></script>
    <script type="text/javascript">
//        pxDemo.start(pxInit);
        pxInit.unshift(function() {
            var file = String(document.location).split('/').pop();

            // Remove unnecessary file parts
            file = file.replace(/(\.html).*/i, '$1');

            if (!/.do$/i.test(file)) {
                file = 'index.do';
            }

            // Activate current nav item
            $('#px-demo-nav')
                    .find('.px-nav-item > a[href*="' + file + '"]')
                    .parent()
                    .addClass('active');

            $('#px-demo-nav').pxNav();
            $('#px-demo-footer').pxFooter();
        });

        for (var i = 0, len = pxInit.length; i < len; i++) {
            pxInit[i].call(null);
        }
    </script>

    <%--Modal State--%>
    <%@ include file="/WEB-INF/views/admin/components/modals.jsp" %>

</body>
</html>