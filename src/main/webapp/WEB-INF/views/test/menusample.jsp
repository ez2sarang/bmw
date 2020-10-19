<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 12. 14.
  Time: 오후 8:59
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="author" content=""/>
    <meta name="description" content="최연소 크리에이터 김민준의 포트폴리오"/>
    <xmeta name="generator" content="materialT"/>
    <meta name="format-detection" content="telephone=no">
    <script>
        var desktopModeSwitch = sessionStorage.desktopModeSwitch;
        if (desktopModeSwitch == "on") {
            document.write('<meta name="viewport" content="width=1024, user-scalable=yes, initial-scale=1.0">')
        } else {
            document.write('<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">')
        }
    </script>
    <meta name="HandheldFriendly" content="true"/>
    <meta name="keywords" content=", ">
    <link rel="shortcut icon" href="/favicon.ico"/>
    <link rel="alternate" type="application/rss+xml" title="인포러스트닷컴" href="http://www.inforlust.com/rss"/>
    <link rel="stylesheet" media="screen" type="text/css" href="http://ts.daumcdn.net/custom/blog/190/1901298/skin/images/bootstrap.min.css"/>
    <link rel="stylesheet" media="screen" type="text/css" href="http://ts.daumcdn.net/custom/blog/190/1901298/skin/style.css?_T_=1437944175"/>
    <link rel="stylesheet" media="screen" type="text/css" href="http://ts.daumcdn.net/custom/blog/190/1901298/skin/images/material-design-icons-embedded.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" media="screen" type="text/css" href="http://ts.daumcdn.net/custom/blog/190/1901298/skin/images/material-design-icons-ie7.css"/><![endif]-->
    <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.6.2/html5shiv.js"></script> <![endif]-->
    <title> :: 인포러스트닷컴</title>
    <meta http-equiv="imagetoolbar" content="no"/>
    <style type="text/css">
        #lightbox {
            background-color: #eee;
            padding: 10px;
            border-bottom: 1px solid #666;
            border-right: 1px solid #666;
        }

        #overlay {
            text-align: left;
            background-image: url(http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/lightbox/images/overlay.png);
        }

        #lightboxCaption {
            color: #333;
            background-color: #eee;
            font-size: 90%;
            text-align: center;
            border-bottom: 1px solid #666;
            border-right: 1px solid #666;
        }

        * html #overlay {
            background-color: #000;
            background-image: url(http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/lightbox/images/blank.gif);
            filter: Alpha(opacity=50);
        }

    </style>
    <script src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/lightbox/lightbox_plus_ope.js" type="text/javascript"></script>
    <script type="text/javascript">
        function loadlightbox() {
            if (document.getElementById("lightbox").outerHTML) {
            }
            else {
                document.getElementById("lightbox").outerHTML = "";
                document.getElementById("overlay").outerHTML = "";
            }
        }
        addEvent(window, "load", function () {
            var lightbox = new LightBox({
                loadingimg: 'http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/lightbox/images/loading.gif',
                expandimg: 'http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/lightbox/images/expand.gif',
                shrinkimg: 'http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/lightbox/images/shrink.gif',
                effectimg: 'http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/lightbox/images/zzoop.gif',
                effectpos: {x: -40, y: -20},
                effectclass: 'effectable',
                closeimg: 'http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/lightbox/images/close.gif'
            });
        });
    </script>
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/A_ShareEntryWithSNS/css/shareEntryWithSNS.css"/>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/A_ShareEntryWithSNS/script/shareEntryWithSNS.js"></script>

    <style type="text/css">
        #daumSearchBox {
            height: 21px;
            background-image: url(http://i1.daumcdn.net/imgsrc.search/search_all/show/tistory/plugin/bg_search2_2.gif);
            margin: 5px auto;
            padding: 0;
        }

        #daumSearchBox input {
            background: none;
            margin: 0;
            padding: 0;
            border: 0;
        }

        #daumSearchBox #daumLogo {
            width: 34px;
            height: 21px;
            float: left;
            margin-right: 5px;
            background-image: url(http://i1.daumcdn.net/img-media/tistory/img/bg_search1_2_2010ci.gif);
        }

        #daumSearchBox #show_q {
            background-color: transparent;
            border: none;
            font: 12px Gulim, Sans-serif;
            color: #555;
            margin-top: 4px;
            margin-right: 15px;
            float: left;
        }

        #daumSearchBox #show_btn {
            background-image: url(http://i1.daumcdn.net/imgsrc.search/search_all/show/tistory/plugin/bt_search_2.gif);
            width: 37px;
            height: 21px;
            float: left;
            margin: 0;
            cursor: pointer;
            text-indent: -1000em;
        }
    </style>
    <style type="text/css">
        .ExifInfo {
            margin: 5px 0px 0px 0px;
            font: 8pt tahoma;
            color: #777777;
            text-align: center;
        }

        .ExifInfo span {
            display: inline-block !important;
            white-space: normal !important;
        }

        .ExifInfo .exifBar {
            font: 7pt Arial;
            color: #ccc;
            margin: 0px 2px 0px 2px;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/TistoryProfileLayer/style.css"/>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/TistoryProfileLayer/profile.js"></script>
    <script type="text/javascript">var asyncProfileItems = [];</script>
    <style type="text/css">
        .another_category {
            border: 1px solid #E5E5E5;
            padding: 10px 10px 5px;
            margin: 10px 0;
            clear: both;
        }

        .another_category h4 {
            font-size: 12px !important;
            margin: 0 !important;
            border-bottom: 1px solid #E5E5E5 !important;
            padding: 2px 0 6px !important;
        }

        .another_category h4 a {
            font-weight: bold !important;
        }

        .another_category table {
            table-layout: fixed;
            border-collapse: collapse;
            width: 100% !important;
            margin-top: 10px !important;
        }

        * html .another_category table {
            width: auto !important;
        }

        *:first-child + html .another_category table {
            width: auto !important;
        }

        .another_category th, .another_category td {
            padding: 0 0 4px !important;
        }

        .another_category th {
            text-align: left;
            font-size: 12px !important;
            font-weight: normal;
            word-break: break-all;
            overflow: hidden;
            line-height: 1.5;
        }

        .another_category td {
            text-align: right;
            width: 80px;
            font-size: 11px;
        }

        .another_category th a {
            font-weight: normal;
            text-decoration: none;
            border: none !important;
        }

        .another_category th a.current {
            font-weight: bold;
            text-decoration: none !important;
            border-bottom: 1px solid !important;
        }

        .another_category th span {
            font-weight: normal;
            text-decoration: none;
            font: 10px Tahoma, Sans-serif;
            border: none !important;
        }

        .another_category_color_gray, .another_category_color_gray h4 {
            border-color: #E5E5E5 !important;
        }

        .another_category_color_gray * {
            color: #909090 !important;
        }

        .another_category_color_gray th a.current {
            border-color: #909090 !important;
        }

        .another_category_color_gray h4, .another_category_color_gray h4 a {
            color: #737373 !important;
        }

        .another_category_color_red, .another_category_color_red h4 {
            border-color: #F6D4D3 !important;
        }

        .another_category_color_red * {
            color: #E86869 !important;
        }

        .another_category_color_red th a.current {
            border-color: #E86869 !important;
        }

        .another_category_color_red h4, .another_category_color_red h4 a {
            color: #ED0908 !important;
        }

        .another_category_color_green, .another_category_color_green h4 {
            border-color: #CCE7C8 !important;
        }

        .another_category_color_green * {
            color: #64C05B !important;
        }

        .another_category_color_green th a.current {
            border-color: #64C05B !important;
        }

        .another_category_color_green h4, .another_category_color_green h4 a {
            color: #3EA731 !important;
        }

        .another_category_color_blue, .another_category_color_blue h4 {
            border-color: #C8DAF2 !important;
        }

        .another_category_color_blue * {
            color: #477FD6 !important;
        }

        .another_category_color_blue th a.current {
            border-color: #477FD6 !important;
        }

        .another_category_color_blue h4, .another_category_color_blue h4 a {
            color: #1960CA !important;
        }

        .another_category_color_violet, .another_category_color_violet h4 {
            border-color: #E1CEEC !important;
        }

        .another_category_color_violet * {
            color: #9D64C5 !important;
        }

        .another_category_color_violet th a.current {
            border-color: #9D64C5 !important;
        }

        .another_category_color_violet h4, .another_category_color_violet h4 a {
            color: #7E2CB5 !important;
        }
    </style>
    <script type="text/javascript">
        //<![CDATA[
        var servicePath = "";
        var blogURL = "";
        var s_trackbackUrlCopied = "엮인글 주소가 복사되었습니다";
        var s_trackbackUrlCopyFailed = "엮인글 주소를 복사하지 못했습니다";
        var SCRIPT_VERSION = '1865';
        //]]>
    </script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/lib/jigu/jigu-latest.min.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/T.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/EAF2.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/common.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/gallery.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/flash.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/PHON.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/swfobject.js"></script>
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/style/dialog.css"/>
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/Tabloid/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/Tabloid/css/tabloid.css"/>
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/Tabloid/css/items.css"/>
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/Tabloid/css/util.css"/>
    <link rel="stylesheet" id="ttTabloidGridCSS" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/Tabloid/css/grid/tistory-grid-min.css"/>
    <style type="text/css">
        div#ttCanvas .tt-item .tt-post-title, div#ttCanvas .tt-item .tt-post-title a, div#ttCanvas .tt-post-title a {
            color: #333333;
            font-family: NanumBarunGothic, '맑은 고딕', 'malgun gothic', AppleGothicNeoSD, 'Apple SD 산돌고딕 Neo', 'Microsoft NeoGothic', 'Droid sans', sans-serif;
        }

        div#ttCanvas .tt-post-summary a, div#ttCanvas .tt-post-summary {
            color: #333333
        }

        div#ttCanvas .tt-post-etcinfo, div#ttCanvas .tt-post-etcinfo span, div#ttCanvas .tt-post-etcinfo span a {
            color: #333333;
            opacity: 0.6;
            filter: alpha(opacity=60);
            _display: inline-block;
        }

        div#ttCanvas hr.tt-line {
            border-color: #333333;
            opacity: 0.3;
            filter: alpha(opacity=30);
        }

        div#ttCanvas {
            margin-left: auto;
        }

        div#ttCanvas {
            margin-top: 0;
        }</style>
    <script type="text/javascript">
        var content_width = 350;
    </script>
    <script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/Tabloid/js/supplement/items.js"></script>
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/style/menubar.css"/>
    <style type="text/css">.tt_article_useless_p_margin p {
        padding-top: 0 !important;
        padding-bottom: 0 !important;
        margin-top: 0 !important;
        margin-bottom: 0 !important;
    }</style>
</head>

<body class="tedition_blog tistory_grid_350" id="tt-body-index">
<div id="overlay" style="display:none;position:fixed;top:0px;left:0px;z-index:150;width:100%;height:100%;"></div>
<div id="lightbox" style="display:none;position:absolute;z-index:160;"></div>
<div style="margin:0px; padding:0px; border:none; background:none; float:none; clear:none; z-index:0"></div>
<header id="header">

    <div class="drawer-toggle"><i class="ic-menu"></i>
    </div>
    <h3><a href="/">인포러스트닷컴</a></h3>

    <div id="search-box">
        <a class="search-icon" href="" onclick="return false;" title="search"><i class="ic-search"></i></a>

        <input placeholder="블로그 검색" class="search-query" type="text" name="search" value="" onkeypress="if (event.keyCode == 13) { blogSearch($(this).val()); }"/>

    </div>
</header>
<!--header close-->
<script type="text/javascript">
    function secondaryDomainLogin(authData) {
        if (!authData) {
            return;
        }

        var request = new HTTPRequest("POST", '/api/secondaryDomain/');
        request.async = false;
        request.onSuccess = function () {
            window.location.reload();
        };
        request.onVerify = function () {
            try {
                var result = eval("(" + this.getText() + ")");
                return (result.error == false)
            }
            catch (e) {
                return false;
            }
        };
        request.send('authData=' + encodeURIComponent(authData));
    }
</script>
<script type="text/javascript" src="http://www.tistory.com/api/secondaryDomain/?callback=secondaryDomainLogin&amp;dummy=1022631063"></script>

<script type="text/javascript">
    //<![CDATA[
    var TOP_SSL_URL = 'https://www.tistory.com';

    function processShortcut(event) {
        if (isIE) {
            event = window.event;
            event.target = event.srcElement;
        }

        if (event.altKey || event.ctrlKey || event.metaKey)
            return;
        switch (event.target.nodeName) {
            case "INPUT":
            case "SELECT":
            case "TEXTAREA":
                return;
        }
        switch (event.keyCode) {
            case 81: //Q

                window.location = "/admin";
                break;
            case 83: //S
                window.location = "../../../../";
                break;
            case 90: //Z
                window.location = "#recentEntries";
                break;
            case 88: //X
                window.location = "#recentComments";
                break;
            case 67: //C
                window.location = "#recentTrackback";
                break;
        }
    }
    document.onkeydown = processShortcut;

    function addComment(caller, entryId) {
        var oForm = findFormObject(caller);
        if (!oForm)
            return false;
        var request = new HTTPRequest("POST", oForm.action);
        request.onSuccess = function () {
            if (entryId == 0)
                window.location = blogURL + "/guestbook";
            else {
                document.getElementById("entry" + entryId + "Comment").innerHTML = this.getText("/response/commentBlock");
                if (document.getElementById("recentComments"))
                    document.getElementById("recentComments").innerHTML = this.getText("/response/recentCommentBlock");
                if (document.getElementById("commentCount" + entryId))
                    document.getElementById("commentCount" + entryId).innerHTML = this.getText("/response/commentView");
                if (document.getElementById("commentCountOnRecentEntries" + entryId))
                    document.getElementById("commentCountOnRecentEntries" + entryId).innerHTML = "(" + this.getText("/response/commentCount") + ")";
            }
            if (typeof window.needCommentCaptcha !== "undefined") {
                captchaPlugin.init('complete');
            }
        }
        request.onError = function () {
            var description = this.getText("/response/description");
            if (description) {
                alert(description);
            }
        }
        var queryString = "key=tistory";
        var captchaInput = document.getElementById('inputCaptcha');
        if (oForm["name"])
            queryString += "&name=" + encodeURIComponent(oForm["name"].value);
        if (oForm["password"])
            queryString += "&password=" + encodeURIComponent(oForm["password"].value);
        if (oForm["homepage"])
            queryString += "&homepage=" + encodeURIComponent(oForm["homepage"].value);
        if (oForm["secret"] && oForm["secret"].checked)
            queryString += "&secret=1";
        if (oForm["comment"])
            queryString += "&comment=" + encodeURIComponent(oForm["comment"].value);
        if (captchaInput) {
            if (!captchaInput.value) {
                alert('그림문자가 입력되지 않았습니다.');
                return false;
            }
            queryString += "&captcha=" + encodeURIComponent(captchaInput.value);
        }
        request.send(queryString);
    }
    function commentRequireLogin() {
        if (confirm("'인포러스트닷컴' 블로그에 댓글을 남기시려면 티스토리에 로그인하셔야 합니다. \n 지금 로그인하시겠습니까?")) {
            window.location = "../../../../";
        } else {
            window.focus();
        }
    }
    function commentObserverForAuth(evetObj) {
        var reex = /name|password|homepage|secret|comment/;
        if (isIE)
            var name = evetObj.srcElement.name
        else
            var name = evetObj.target.name
        if (reex.test(name) && !(new RegExp("^entry\\d+password$").test(name))) {
            commentRequireLogin();
        }
    }

    STD.addEventListener(document);
    document.addEventListener("click", commentObserverForAuth, false);
    var openWindow = '';
    function alignCenter(win, width, height) {
        if (navigator.userAgent.indexOf("Chrome") == -1)
            win.moveTo(screen.width / 2 - width / 2, screen.height / 2 - height / 2);
    }

    function deleteComment(id) {
        var width = 450;
        var height = 360;
        try {
            openWindow.close();
        } catch (e) {
        }
        openWindow = window.open("/comment/delete/" + id, "tatter", "width=" + width + ",height=" + height + ",location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
        openWindow.focus();
        alignCenter(openWindow, width, height);
    }

    function commentComment(parent, guestbookPage) {
        var width = 450;
        var height = 360;
        try {
            openWindow.close();
        } catch (e) {
        }
        openWindow = window.open("/comment/comment/" + parent + (guestbookPage ? "?guestbookPage=" + guestbookPage : ""), "tatter", "width=" + width + ",height=" + height + ",location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
        openWindow.focus();
        alignCenter(openWindow, width, height);
    }

    function editEntry(parent, child) {
        var width = 1169;
        var height = 600;
        if (openWindow != '') openWindow.close();
        openWindow = window.open("/admin/entry/edit/" + parent + "?popupEditor&returnURL=CLOSEME", "tatter", "width=" + 1169 + ",height=" + 600 + ",location=0,menubar=0,resizable=1,scrollbars=1,status=0,toolbar=0");
        openWindow.focus();
        alignCenter(openWindow, width, height);
    }

    function guestbookComment(parent) {
        var width = 450;
        var height = 360;
        try {
            openWindow.close();
        } catch (e) {
        }
        openWindow = window.open("/comment/comment/" + parent, "tatter", "width=" + width + ",height=" + height + ",location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
        openWindow.focus();
        alignCenter(openWindow, width, height);
    }

    function sendTrackback(id) {
        var width = 700;
        var height = 500;
        try {
            openWindow.close();
        } catch (e) {
        }
        openWindow = window.open("/trackback/send/" + id, "tatter", "width=580,height=400,location=0,menubar=0,resizable=1,scrollbars=1,status=0,toolbar=0");
        openWindow.focus();
        alignCenter(openWindow, width, height);
    }

    function deleteTrackback(id, entryId) {
        if (confirm("트랙백을 삭제하기 위해서는 로그인이 필요합니다.\n로그인 하시겠습니까?\t")) {
            window.location = "../../../../";
            return false;
        } else {
            return false;
        }
    }

    function reloadEntry(id) {
        var password = document.getElementById("entry" + id + "password");
        if (!password)
            return;
        document.cookie = "GUEST_PASSWORD=" + encodeURIComponent(password.value) + ";path=";

        window.location.href = window.location.href;
    }
    loadedComments = new Array();
    loadedTrackbacks = new Array();
    function viewTrigger(id, category, categoryId) {
        var request = new HTTPRequest("GET", "/" + category + "/view/" + id);
        var target = document.getElementById('entry' + id + (category == 'comment' ? 'Comment' : 'Trackback'));
        if (target == null)
            return false;
        request.onSuccess = function () {
            target.innerHTML = this.getText("/response/result");
            target.style.display = 'block';
            highlight();
            category == 'comment' ? loadedComments[id] = true : loadedTrackbacks[id] = true;
            if (categoryId > -1)
                location = location.toString();
            if (category == 'trackback') {
                var holder = document.getElementById('TrackbackCopyHolder' + id);
                if (holder) {
                    holder.innerHTML = AC_FL_RunContentNotWriteGetString(
                            'src', 'http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/script/copyTrackback',
                            'Flashvars', 'url=http://www.inforlust.com/trackback/' + id + '&mode=whiteButton',
                            'width', '29',
                            'height', '18',
                            'id', 'TrackbackCopyButton' + id,
                            'wmode', 'transparent',
                            'allowScriptAccess', 'always',
                            'type', 'application/x-shockwave-flash',
                            'pluginspage', 'http://www.macromedia.com/go/getflashplayer'
                    );
                }
            }
            if (typeof window.needCommentCaptcha !== "undefined") {
                captchaPlugin.init();
            }
        }
        request.onError = function () {
            alert('실패 했습니다');
        }
        request.send();
    }
    function highlight() {
        var hash = new RegExp("^#(comment\\d+)").exec(window.location.hash);
        if (hash && (el = document.getElementById(hash[1])))
            highlightElement(hash[1], 0, el.style.backgroundColor);
    }
    function highlightElement(id, amount, origColor) {
        var el = document.getElementById(id);
        if (!el) {
            return;
        }
        el.style.backgroundColor = amount % 2 ? "#FFFF44" : origColor;
        if (++amount < 7) {
            setTimeout("highlightElement('" + id + "', " + amount + ", '" + origColor + "')", 200);
        }
    }
    function toggleLayerForEntry(id, category, categoryId, mode) {
        if ((category == 'comment' ? loadedComments[id] : loadedTrackbacks[id])) {
            try {
                var obj = document.getElementById('entry' + id + (category == 'comment' ? 'Comment' : 'Trackback'));
                if (mode == undefined)
                    obj.style.display = (obj.style.display == "none") ? "block" : "none";
                else
                    obj.style.display = (mode == 'show') ? "block" : "none";
            } catch (e) {

            }
            return true;
        } else {
            if (categoryId) {
                viewTrigger(id, category, categoryId);
            } else {
                viewTrigger(id, category, -1);
            }
        }
    }
    function ObserverForAnchor(evetObj) {
        var lo = location.toString();
        var queryString = lo.substr(lo.lastIndexOf('/') + 1);
        if (queryString.indexOf('#') > -1) {
            var qsElements = queryString.split('#');
            if (qsElements[1].indexOf('comment') > -1) {
                var category = 'comment';
            } else if (qsElements[1].indexOf('trackback') > -1) {
                var category = 'trackback';
            }
            if (category) {
                entryid = qsElements[0];
                categoryId = qsElements[1].substr(category.length);
                toggleLayerForEntry(entryid, category, categoryId, 'show');
            }
        }
    }

    STD.addEventListener(window);
    window.addEventListener("load", ObserverForAnchor, false);
    //]]>
</script>
<div style="margin:0px; padding:0px; border:none; background:none; float:none; clear:none; z-index:0"></div>

<div class="container">
    <!--광고위치 1: 모든 카드 위-->
    <div class="contents clearfix">
        <div class="loadingSpinner">
            <svg class="spinner" width="30px" height="30px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
            </svg>
        </div>
        <div id="search-resultWrap" class="card">
            <svg class="spinner" width="30px" height="30px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33"
                        r="30"></circle>
            </svg>
            <button id="search-result-close" class="ripplelink iconbutton"><i class="ic-close"></i>
            </button>
            <div id="search-result">
            </div>
        </div>
        <div id="homeCards" class="home clearfix" style="display:none">
            <div class="homeBG">
                <p class="homeDesc">최연소 크리에이터 김민준의 포트폴리오</p>
            </div>
            <div class="homeProfile">
                <img src="http://cfile1.uf.tistory.com/image/245B8B4B56385A362CC720" alt="블로그 이미지"/>
            </div>
        </div>
        <!--홈 화면 카드 끝-->

        <div class="card clearfix">
            <!--광고위치 2: 제목 위-->

            <!-- 검색결과 끝 -->

            <!-- 미디어로그 끝 -->

            <!-- 지역로그 끝 -->

            <!-- 태그로그 끝 -->

            <!-- 키워드 끝 -->

            <!-- 공지사항 끝 -->


            <!-- 보호글 끝 -->


            <article class="entry card-padding clearfix" style="display:none">
                <div class="titleWrap">
                    <h2><a href="/22">시각장애아동들을 위한 그림동화책을 만드는 청소년회사 &quot;준브레일&quot;</a></h2>
                    <span class="category"><a href="/category/뉴스">뉴스</a> </span>
                    <span class="date">2015.12.10 16:26</span>

                    <!-- 관리자도구 끝 -->
                </div>
                <!-- titleWrap close -->
                <div class="article clearfix">
                    <!--광고위치 3: 본문 위-->
                    <div class="tt_article_useless_p_margin">
                        <div class="_39k5"
                             style="font-family: Georgia, serif; font-size: 17px; -webkit-font-smoothing: antialiased; line-height: 28px; overflow: hidden; padding-bottom: 60px; position: relative;">
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <p style="text-align: center; clear: none; float: none;"><span class="imageblock"
                                                                                               style="display:inline-block;width:1000px;;height:auto;max-width:100%"><span
                                        dir="http://cfile7.uf.tistory.com/original/271CBD48566928F11B1806"
                                        rel="lightbox" target="_blank"><img
                                        src="http://cfile7.uf.tistory.com/image/271CBD48566928F11B1806"
                                        style="cursor: pointer;max-width:100%;height:auto" width="1000" height="573"
                                        style="""" /></span></span></p>

                                <p><br/></p><br/></div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="color: rgb(59, 89, 152); cursor: pointer; font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);"><a
                                        href="http://www.junbraille.com/" target="_blank" rel="nofollow"
                                        style="color: rgb(59, 89, 152); cursor: pointer;">www.junbraille.com</a></span><span
                                    class="_19ij"
                                    style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);"> </span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">시각 장애 아동들을 위한 촉각형 그림동화책을 제작하는 "준브레일" 회사의 </span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">공식적인 웹사이트와 브랜드로고를 공개합니다!</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">저는 시각 장애인들을 위한 봉사 활동을 하면서 장애 아동들과 함께 이야기를 할 수 있는 기회를 갖게 되었습니다. 시각 장애 아동들은 점자 동화책이 적어 많이 읽지 못한다고 이야기 하였습니다.  </span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">그래서 시각 장애 아동들에게 많은 동화책을 접하게 도와주고 싶었고,  실질적인 도움을 주는 방향으로 생각해보다가 시각 장애 아동들을 위한 촉각형 그림동화책을 제작해 기증하는 프로젝트를 계획했습니다. 그림 동화책을 제작할 때 촉각만으로도 느낄 수 있도록 입체적으로 디자인하고 싶었고, 이를 위해 FDM 방식의 3D프린터를 이용하여 동화책을 만드는데 사용하기로 하였습니다. (3D프린터는 reprap 사의 prusa i3를 바탕으로 직접 조립했습니다.)</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">아직은 계획을 실행하기 위한 단계이지만, 분명 좋은 일들이 일어날 것으로 생각됩니다.  저희는 시각 장애 아동들을 위한 그림동화책을 "픽쳐브레일북"으로 부르고 있는데요. </span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">이번에 "텀블벅 </span><a
                                    href="http://l.facebook.com/l.php?u=http%3A%2F%2Fwww.tumblbug.com%2F&amp;h=xAQHduPuo&amp;s=1"
                                    target="_blank" rel="nofollow"
                                    style="color: rgb(59, 89, 152); cursor: pointer;"><span class="_19ij"
                                                                                            style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">www.tumblbug.com</span></a><span
                                    class="_19ij"
                                    style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);"> " 이라는 크라우드 펀딩 회사를 통해 펀딩을 진행할 수 있는 기회를 갖게 되었습니다. (현재는 펀딩을 위한 페이지가 작업 중에 있습니다!) </span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">그 외에도 "준브레일"을 통해서 가난한 디자이너, 아티스트들을 위해 좋은 가격으로 3D프린트 출력 대행 서비스를 오픈하였고 현재 서비스를 받을 수 있습니다. 또한 "비젼찾기 프로젝트" 서비스를 오픈하여 IT에 관심이 많은 학생들을 중심으로 비젼을 목표로 도움을 주기 위한 서비스를 준비하고 있습니다. </span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">웹사이트를 만드는 것도 strikingly 서비스를 이용해 제작했음에도 많이 힘든 것을 느끼게 되었네요. 도메인은 </span><a
                                    href="http://l.facebook.com/l.php?u=http%3A%2F%2Fwww.junbraille.com%2F&amp;h=iAQGEsyQe&amp;s=1"
                                    target="_blank" rel="nofollow"
                                    style="color: rgb(59, 89, 152); cursor: pointer;"><span class="_19ij"
                                                                                            style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">www.junbraille.com</span></a><span
                                    class="_19ij"
                                    style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);"> 이며, 브랜드 로고는 첨부하였습니다.</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">브랜드 로고를 만들기 위해 전문 디자인 회사 "디너츠"에게 부탁을 드렸고 함께 많은 이야기를 거치며 반복되는 수정을 통해 완성되었습니다. 처음 작업물은 제 뜻으로만 제작하니, 징그러운 느낌이 있었는데 지금은 그래도 이쁜 로고로 제작되었습니다.</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">브랜드 로고에는 많은 의미가 담겨 있습니다. 첫번째로 시각 장애 아동들이 점자를 읽는 것을 상징하는 손가락과 브레일(점자)를 터치하는 것, 촉각의 중요한 역할을 하는 지문 등을 넣었으며 손가락 안에는 Hope(희망)이라는 메세지를 점자로 변환하여 넣었습니다. 처음, 저희가 "준브레일"이라는 프로젝트 이름을 지었을 때, 어떤 메세지를 주고 싶었는지 곰곰히 생각을 하다가  </span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <br/><span id="callbacknestwwwinforlustcom227333"
                                           style="width:1px; height:1px; float:right"><embed allowscriptaccess="always"
                                                                                             id="bootstrapperwwwinforlustcom227333"
                                                                                             src="http://www.inforlust.com/plugin/CallBack_bootstrapperSrc?nil_profile=tistory&amp;nil_type=copied_post"
                                                                                             width="1" height="1"
                                                                                             wmode="transparent"
                                                                                             type="application/x-shockwave-flash"
                                                                                             EnableContextMenu="false"
                                                                                             FlashVars="&amp;callbackId=wwwinforlustcom227333&amp;host=http://www.inforlust.com&amp;embedCodeSrc=http%3A%2F%2Fwww.inforlust.com%2Fplugin%2FCallBack_bootstrapper%3F%26src%3Dhttp%3A%2F%2Fs1.daumcdn.net%2Fcfs.tistory%2Fresource%2F1865%2Fblog%2Fplugins%2FCallBack%2Fcallback%26id%3D22%26callbackId%3Dwwwinforlustcom227333%26destDocId%3Dcallbacknestwwwinforlustcom227333%26host%3Dhttp%3A%2F%2Fwww.inforlust.com%26float%3Dleft"
                                                                                             swLiveConnect="true"/></span>
                            </div>
                            <blockquote class="_2cuy _509u"
                                        style="white-space: pre-wrap; box-sizing: border-box; margin: 56px auto; width: 700px; word-wrap: break-word; color: rgb(127, 127, 127); font-family: 'Hoefler Text', Georgia, serif; font-size: 36px; font-style: italic; line-height: 42px; padding: 32px 80px 28px; position: relative; text-align: center;">
                                "We help the world to see"
                            </blockquote>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">라는 메세지를 담아봤습니다.</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">앞으로 서비스는 계속해서 성장할 것이며 긍정적인 방향으로 웹사이트 내용과 디자인을 수정해 나갈 것 입니다. 앞으로 많이 지켜봐주세요!  "텀블벅"에서의 크라우드 펀딩도 오픈할 때 적극적인 참여를 부탁드립니다! =)</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">----</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <a href="http://l.facebook.com/l.php?u=http%3A%2F%2Fwww.inforlust.com%2F&amp;h=DAQEZK8uD&amp;s=1"
                                   target="_blank" rel="nofollow"
                                   style="color: rgb(59, 89, 152); cursor: pointer;"><span class="_19ij"
                                                                                           style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">www.inforlust.com</span></a><span
                                    class="_19ij"
                                    style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);"> : 김민준 1인 미디어 사이트</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <a href="http://l.facebook.com/l.php?u=http%3A%2F%2Fwww.junbraille.com%2F&amp;h=lAQF1WcIa&amp;s=1"
                                   target="_blank" rel="nofollow"
                                   style="color: rgb(59, 89, 152); cursor: pointer;"><span class="_19ij"
                                                                                           style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">www.junbraille.com</span></a><span
                                    class="_19ij"
                                    style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">: 김민준 대표,청소년 IT 스타트업</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">준브레일 회사 이메일: braillebook@naver.com</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">김민준 개인 이메일: reptilecheck@naver.com</span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">김민준 개인 연락처: 010-6622-1127 </span>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">김민준 개인 블로그: </span><a
                                    href="http://l.facebook.com/l.php?u=http%3A%2F%2Fblog.naver.com%2Freptilecheck&amp;h=MAQG9nIpq&amp;s=1"
                                    target="_blank" rel="nofollow"
                                    style="color: rgb(59, 89, 152); cursor: pointer;"><span class="_19ij"
                                                                                            style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">blog.naver.com/reptilecheck</span></a>
                            </div>
                            <div class="_2cuy _3dgx"
                                 style="white-space: pre-wrap; box-sizing: border-box; margin: 0px auto 28px; width: 700px; word-wrap: break-word;">
                                <span class="_19ij"
                                      style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">김민준 소개: </span><a
                                    href="http://l.facebook.com/l.php?u=http%3A%2F%2Fwww.inforlust.com%2Fnotice%2F1&amp;h=fAQHEFyWS&amp;s=1"
                                    target="_blank" rel="nofollow"
                                    style="color: rgb(59, 89, 152); cursor: pointer;"><span class="_19ij"
                                                                                            style="font-family: Menlo, Consolas, Monaco, monospace; font-size: 14px; padding: 4px; background-color: rgb(246, 247, 248);">www.inforlust.com/notice/1</span></a>
                            </div>
                        </div>
                        <div class="_4lmp" style="border-radius: 0px 0px 7px 7px; overflow: hidden;">
                            <form rel="async" class="commentable_item collapsible_comments" method="post"
                                  data-ft="{&quot;tn&quot;:&quot;]&quot;}"
                                  action="https://www.facebook.com/ajax/ufi/modify.php" id="u_43_3"
                                  style="margin: 0px; padding: 0px;">
                                <div class="_1gtv" style="margin: 0px auto; width: 724px;">
                                    <div class="_57w"
                                         style="color: rgb(145, 151, 163); margin-top: 12px; padding-bottom: 4px; position: relative;">
                                        <div class="_37uu">
                                            <div class="_a7s _3399"
                                                 style="clear: both; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(229, 229, 229); margin: 0px 12px; padding-top: 4px;">
                                                <div class="_524d"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <p><br/></p>

                        <div style='text-align:center;margin:10px 0px 10px 0px;'>
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <ins class="adsbygoogle"
                                 style="display:inline-block;width:728px;height:90px"
                                 data-ad-client="ca-pub-8910668396998143"
                                 data-ad-slot="5156651718"
                                    >
                            </ins>
                            <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
                        </div>
                        <div class="entry-ccl" style="clear: both; text-align: right; margin-bottom: 10px">
                            <a href="http://creativecommons.org/licenses/by-nc-nd/4.0/deed.ko" target="_blank"
                               style="text-decoration: none">
                                <img id="ccl-icon-22-0" class="entry-ccl-by"
                                     src="http://i1.daumcdn.net/cfs.tistory/resource/1865/static/admin/editor/ccl_black01.png"
                                     onmouseover="tistoryCcl.show(this, 1)" onmouseout="tistoryCcl.hide()"
                                     alt="저작자 표시"/>
                                <img id="ccl-icon-22-1" class="entry-ccl-nc"
                                     src="http://i1.daumcdn.net/cfs.tistory/resource/1865/static/admin/editor/ccl_black02.png"
                                     onmouseover="tistoryCcl.show(this, 1)" onmouseout="tistoryCcl.hide()" alt="비영리"/>
                                <img id="ccl-icon-22-2" class="entry-ccl-nd"
                                     src="http://i1.daumcdn.net/cfs.tistory/resource/1865/static/admin/editor/ccl_black03.png"
                                     onmouseover="tistoryCcl.show(this, 1)" onmouseout="tistoryCcl.hide()" alt="변경 금지"/>
                                <!--
                      <rdf:RDF xmlns="http://web.resource.org/cc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
                          <Work rdf:about="">
                              <license rdf:resource="http://creativecommons.org/licenses/by-nc-nd/2.0/kr/" />
                          </Work>
                          <License rdf:about="http://creativecommons.org/licenses/by-nc-nd/">
                              <permits rdf:resource="http://web.resource.org/cc/Reproduction"/>
                              <permits rdf:resource="http://web.resource.org/cc/Distribution"/>
                              <requires rdf:resource="http://web.resource.org/cc/Notice"/>
                              <requires rdf:resource="http://web.resource.org/cc/Attribution"/>
                              <prohibits rdf:resource="http://web.resource.org/cc/CommercialUse"/>
                          </License>
                      </rdf:RDF>
                      -->
                            </a>
                        </div>
                        <script type="text/javascript">
                            if (/MSIE [0-6]\./.test(navigator.userAgent)) {
                                for (var i = 0; i < 3; i++) {
                                    var el = document.getElementById('ccl-icon-22-' + i);
                                    el.style.filter = 'progid:DXImageTransform.Microsoft.AlphaImageLoader(src="' + el.src + '",sizingMethod="image")';
                                    el.src = 'http://i1.daumcdn.net/cfs.tistory/resource/1865/static/admin/form/s.gif';
                                }
                            }
                        </script>
                        <div class="tt-plugin tt-share-entry-with-sns tt-sns-icon-alignment-center tt-sns-icon-size-small">
                            <div class="tt-sns-wrap" id="ttSnsWrap-22">
                                <ul class="tt-sns-service-default">
                                    <li class="tt-sns-service-kakaostory"><a href="javascript:;"
                                                                             onclick="ShareEntryWithSNS.share('kakaostory', '22', '%EC%8B%9C%EA%B0%81%EC%9E%A5%EC%95%A0%EC%95%84%EB%8F%99%EB%93%A4%EC%9D%84%20%EC%9C%84%ED%95%9C%20%EA%B7%B8%EB%A6%BC%EB%8F%99%ED%99%94%EC%B1%85%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EC%B2%AD%EC%86%8C%EB%85%84%ED%9A%8C%EC%82%AC%20%22%EC%A4%80%EB%B8%8C%EB%A0%88%EC%9D%BC%22');">카카오스토리</a>
                                    </li>
                                    <li class="tt-sns-service-twitter"><a href="javascript:;"
                                                                          onclick="ShareEntryWithSNS.share('twitter', '22', '%EC%8B%9C%EA%B0%81%EC%9E%A5%EC%95%A0%EC%95%84%EB%8F%99%EB%93%A4%EC%9D%84%20%EC%9C%84%ED%95%9C%20%EA%B7%B8%EB%A6%BC%EB%8F%99%ED%99%94%EC%B1%85%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EC%B2%AD%EC%86%8C%EB%85%84%ED%9A%8C%EC%82%AC%20%22%EC%A4%80%EB%B8%8C%EB%A0%88%EC%9D%BC%22');">트위터</a>
                                    </li>
                                    <li class="tt-sns-service-facebook"><a href="javascript:;"
                                                                           onclick="ShareEntryWithSNS.share('facebook', '22', '%EC%8B%9C%EA%B0%81%EC%9E%A5%EC%95%A0%EC%95%84%EB%8F%99%EB%93%A4%EC%9D%84%20%EC%9C%84%ED%95%9C%20%EA%B7%B8%EB%A6%BC%EB%8F%99%ED%99%94%EC%B1%85%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EC%B2%AD%EC%86%8C%EB%85%84%ED%9A%8C%EC%82%AC%20%22%EC%A4%80%EB%B8%8C%EB%A0%88%EC%9D%BC%22');">페이스북</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tt-sns-clear"></div>
                        </div>
                        <div style="text-align:left; padding-top:10px;clear:both">
                            <iframe src="http://www.facebook.com/plugins/like.php?href=http://www.inforlust.com/22&amp;layout=button_count&amp;show_faces=true&amp;width=106&amp;action=like&amp;font=tahoma&amp;colorscheme=light&amp;height=65"
                                    scrolling="no" frameborder="0"
                                    style="border:none; overflow:hidden; width:106px; height:30px;"
                                    allowTransparency="true"></iframe>
                        </div>
                        <div class="another_category another_category_color_gray">
                            <h4>'<a href="/category/뉴스">뉴스</a>' 카테고리의 다른 글</h4>
                            <table>
                                <tr>
                                    <th>
                                        <a href="http://www.inforlust.com/22" class="current">시각장애아동들을 위한 그림동화책을 만드는
                                            청소년회사 &quot;준브레일&quot;</a>&nbsp;&nbsp;<span>(0)</span>
                                    </th>
                                    <td>
                                        2015.12.10
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!--광고위치 4: 본문 아래-->
                    <div class="author">
                        <span class="text">Posted by 인포러스트 인포러스트</span>
                    </div>
                </div>
                <!-- 본문 끝 -->

                <!-- 작성자 끝 -->
            </article>
            <!-- entry close -->
            <div id="comments-box" class="clearfix" style="display:none">
                <div class="tabs">
                    <input type="radio" id="tab1" name="tabs" checked/>
                    <input type="radio" id="tab2" name="tabs"/>
                    <input type="radio" id="tab3" name="tabs"/>
                    <input type="radio" id="tab4" name="tabs"/>

                    <div class="labels">
                        <!--디스커스탭이나 추가로 4번탭을 쓰려면 아래 의 주석을 해제하세요-->
                        <label id="tab1L" for="tab1" class="ripplelink"><i class="ic-forum"></i>
                        </label>
                        <!--<label id="tab2L" for="tab2" class="ripplelink">Disqus</label>-->
                        <label id="tab3L" for="tab3" class="ripplelink"><i class="ic-share"></i>
                        </label>
                        <!--<label id="tab4L" for="tab4" class="ripplelink">사용자탭</label>-->
                        <div style="clear:both;"></div>

                    </div>
                    <div class="tab_container">
                        <div id="tab1C" class="tab_content">
                            <div id="entry22Comment" style="display:block">
                                <div class="comment">
                                    <div class="commentList">

                                    </div>
                                    <!-- commentList close -->
                                    <form method="post" action="/comment/add/22" onsubmit="return false"
                                          style="margin: 0">
                                        <div class="write">


                                            <p class="writerInfo col-xs-6">
                                                <label for="name">Name</label>
                                                <input placeholder="이름 [필수]" type="text" id="name" name="name" value=""/>
                                            </p>

                                            <p class="writerInfo col-xs-6">
                                                <label for="password">Password</label>
                                                <input placeholder="비밀번호 [필수]" type="password" id="password" name="password" value=""/>
                                            </p>

                                            <p class="writerInfo col-xs-6">
                                                <label for="homepage">Blog/Homepage</label>
                                                <input placeholder="블로그/ 홈페이지 주소" type="text" class="homepage" id="homepage" name="homepage" value="http://"/>
                                            </p>

                                            <p class="secretWrap col-xs-6">
                                                <input type="checkbox" id="secret" name="secret" class="checkbox"/>
                                                <label for="secret"> 비밀글 </label>
                                            </p>

                                            <div>
                                                <textarea placeholder="댓글을 입력해주세요" name="comment" rows="2"></textarea>
                                            </div>
                                            <div class="clearfix">
                                                <button type="submit" value="댓글 달기"
                                                        onclick="addComment(this, 22); return false;"
                                                        class="submit flatbutton ripplelink">댓글 추가
                                                </button>
                                            </div>
                                        </div>
                                        <!-- commentWrite close -->
                                    </form>
                                </div>
                                <!-- comment close -->
                            </div>
                            <script type="text/javascript">loadedComments[22] = true;
                            highlight()</script>
                        </div>
                        <div id="tab2C" class="tab_content card-padding">
                            <!--여기에 디스커스 코드를 삽입하세요-->
                        </div>
                        <div id="tab3C" class="tab_content card-padding">
                            <!-- AddToAny BEGIN -->
                            <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                                <a class="a2a_button_facebook"></a>
                                <a class="a2a_button_twitter"></a>
                                <a class="a2a_button_google_plus"></a>
                                <a class="a2a_button_pinterest"></a>
                                <a class="a2a_button_evernote"></a>
                                <a class="a2a_button_kakao"></a>
                                <a class="a2a_button_line"></a>
                            </div>
                            <script src="//static.addtoany.com/menu/page.js" async></script>
                            <!-- AddToAny END -->
                            <script>
                                function getTBaddr() {
                                    var str = location.origin + "/trackback/" + "22";
                                    document.getElementById("hackerc_trackback").value = str;
                                    document.getElementById("hackerc_trackback").select();
                                }
                            </script>
                            <div id="entry22Trackback" style="display:block">
                                <div class="trackback">
                                    <h3><i class="ic-note_add"></i>트랙백</h3>

                                    <div class="antiSpamTrack">
                                        <input type="text" id="hackerc_trackback" name="http://hackerc.com"
                                               onclick="getTBaddr()" value="트랙백 주소보기">
                                        <span class="antiSpamTrackbackInfo">※ 스팸 트랙백 차단중 ...<a title="적용방법"
                                                                                               href="http://hackerc.tistory.com/700">{
                                            ? }</a></span>
                                    </div>

                                </div>
                            </div>
                            <script type="text/javascript">loadedTrackbacks[22] = true;</script>
                            <!-- 트랙백 끝 -->
                        </div>
                        <div id="tab4C" class="tab_content card-padding">
                            <!--4번탭 내용-->
                        </div>
                        <div class="notAvailable">현재 브라우저에서는 댓글을 표시할 수 없습니다.
                            <br/> IE9 이상으로 브라우저를 업그레이드하거나, 크롬, 파이어폭스 등 최신 브라우저를 이용해주세요.
                        </div>
                    </div>
                </div>

            </div>


            <div id="paging" style="display:none">
                <a class="no-more-prev flatbutton ripplelink" id="prevPage"><i class="ic-chevron_left"></i>이전페이지</a>
                <a href='?page=2' class=" flatbutton ripplelink" id="nextPage">다음페이지<i class="ic-chevron_right"></i></a>
            </div>

        </div>
    </div>
    <!-- content close -->
    <aside>
        <!--광고위치 5: 컨텐츠카드와 하단패널 사이-->
        <div id="sidebar-col1" class="sidebar-col"></div>
        <div id="sidebar-col2" class="sidebar-col"></div>
        <div style="clear:both;"></div>
        <div class="sidebar-col sidebar-temp clearfix">

            <!-- 블로그 프로필 모듈 -->
            <div id="profile" class="card">
                <div class="card-content">
                    <div id="blogImage"><img src="http://cfile1.uf.tistory.com/image/245B8B4B56385A362CC720"
                                             alt="블로그 이미지"/>
                    </div>
                    <div id="blogDesc">
                        <p>최연소 크리에이터 김민준의 포트폴리오</p>

                        <p class="userID">by <strong>인포러스트</strong>
                        </p>
                    </div>
                </div>
            </div>
            <style>
                #profile #blogImage {
                    text-align: center
                }

                #profile #blogImage img {
                    border-radius: 10%;
                    max-width: 100%;
                    height: auto
                }
            </style>

            <!-- 공지사항 모듈 -->

            <div id="notice" class="card">
                <div class="card-header ripplelink">
                    <i class="ic-more_vert"></i>
                    <h3><i class="ic-announcement"></i> 공지사항</h3>
                </div>
                <div class="card-listed-content">
                    <ul>
                        <li class="ripplelink" onclick="window.open('/notice/1','_self')">인포러스트/ 김민준 소개</li>
                    </ul>
                </div>
            </div>

            <!-- 태그목록 모듈 -->
            <div id="tagbox" class="card">
                <div class="card-header ripplelink">
                    <i class="ic-more_vert"></i>
                    <h3><i class="ic-loyalty"></i> 태그</h3>
                </div>
                <div class="card-content">
                    <a href="/tag/미러리스%20카메라%20추천" class="cloud3"> 미러리스 카메라 추천</a>
                    <a href="/tag/루믹스" class="cloud5"> 루믹스</a>
                    <a href="/tag/박원순" class="cloud3"> 박원순</a>
                    <a href="/tag/드론" class="cloud3"> 드론</a>
                    <a href="/tag/카메라" class="cloud5"> 카메라</a>
                    <a href="/tag/프로젝트파이" class="cloud5"> 프로젝트파이</a>
                    <a href="/tag/파나소닉" class="cloud5"> 파나소닉</a>
                    <a href="/tag/애플" class="cloud5"> 애플</a>
                    <a href="/tag/올림푸스%20펜" class="cloud3"> 올림푸스 펜</a>
                    <a href="/tag/비즈니스인사이더" class="cloud5"> 비즈니스인사이더</a>
                    <a href="/tag/E-Sim" class="cloud5"> E-Sim</a>
                    <a href="/tag/미러리스%20추천" class="cloud3"> 미러리스 추천</a>
                    <a href="/tag/박원순%20서울시장" class="cloud3"> 박원순 서울시장</a>
                    <a href="/tag/애플%20가상통신사" class="cloud5"> 애플 가상통신사</a>
                    <a href="/tag/애플%20통신%20서비스" class="cloud5"> 애플 통신 서비스</a>
                    <a href="/tag/올림푸스%20후기" class="cloud5"> 올림푸스 후기</a>
                    <a href="/tag/올림푸스" class="cloud1"> 올림푸스</a>
                    <a href="/tag/E-P5" class="cloud5"> E-P5</a>
                    <a href="/tag/Xiaomi" class="cloud5"> Xiaomi</a>
                    <a href="/tag/올림푸스%20펜%20E-P5" class="cloud5"> 올림푸스 펜 E-P5</a>
                    <a href="/tag/올림푸스%20미러리스%20카메라" class="cloud5"> 올림푸스 미러리스 카메라</a>
                    <a href="/tag/샤오미" class="cloud5"> 샤오미</a>
                    <a href="/tag/DJI" class="cloud3"> DJI</a>
                    <a href="/tag/헬리캠" class="cloud3"> 헬리캠</a>
                    <a href="/tag/GX8" class="cloud5"> GX8</a>
                    <a href="/tag/애플%20통신사" class="cloud5"> 애플 통신사</a>
                    <a href="/tag/웨어러블%20체온계" class="cloud5"> 웨어러블 체온계</a>
                    <a href="/tag/카메라%20추천" class="cloud3"> 카메라 추천</a>
                    <a href="/tag/올리푸스%20E-P5" class="cloud5"> 올리푸스 E-P5</a>
                    <a href="/tag/애플%20특허" class="cloud5"> 애플 특허</a>
                </div>
            </div>

            <!-- 최근 포스트 모듈 -->
            <div id="recentPost" class="card">
                <div class="card-header ripplelink">
                    <i class="ic-more_vert"></i>
                    <h3><i class="ic-menu"></i> 최근에 올라온 글 </h3>
                </div>
                <div class="card-listed-content">
                    <ul>
                        <li class="ripplelink" onclick="window.open('/22','_self')">
                            <img src="/favicon.ico" class="thumbnail" alt="thumbnail">
                            <a href="/22" onclick="window.open(this.href,'_self');return false">시각장애아동들을 위한 그림동화책..</a>
                            <span class="cnt"><span id="commentCountOnRecentEntries22"></span></span>
                        </li>
                        <li class="ripplelink" onclick="window.open('/21','_self')">
                            <img src="/favicon.ico" class="thumbnail" alt="thumbnail">
                            <a href="/21" onclick="window.open(this.href,'_self');return false">올림푸스 PEN 으로 담은 유럽</a>
                            <span class="cnt"><span id="commentCountOnRecentEntries21">(2)</span></span>
                        </li>
                        <li class="ripplelink" onclick="window.open('/20','_self')">
                            <img src="/favicon.ico" class="thumbnail" alt="thumbnail">
                            <a href="/20" onclick="window.open(this.href,'_self');return false">삼성의 플래그쉽 미러리스, NX1밸..</a>
                            <span class="cnt"><span id="commentCountOnRecentEntries20"></span></span>
                        </li>
                        <li class="ripplelink" onclick="window.open('/19','_self')">
                            <img src="/favicon.ico" class="thumbnail" alt="thumbnail">
                            <a href="/19" onclick="window.open(this.href,'_self');return false">1인 미디어와 함께 하는 박원순서..</a>
                            <span class="cnt"><span id="commentCountOnRecentEntries19"></span></span>
                        </li>
                        <li class="ripplelink" onclick="window.open('/18','_self')">
                            <img src="/favicon.ico" class="thumbnail" alt="thumbnail">
                            <a href="/18" onclick="window.open(this.href,'_self');return false">인포러스트/ 김민준 소개 (포스팅..</a>
                            <span class="cnt"><span id="commentCountOnRecentEntries18"></span></span>
                        </li>
                        <li class="ripplelink more-post" onclick="window.open('/category','_self')">
                            <i class="ic-add"></i> 더 보기
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 최근 댓글 모듈 -->
            <div id="recentComment" class="card">
                <div class="card-header ripplelink">
                    <i class="ic-more_vert"></i>

                    <h3><i class="ic-comment"></i> 최근 댓글</h3>
                </div>
                <div class="card-listed-content">
                    <ul id="recentComments">

                        <li class="ripplelink" onclick="window.open('/21#comment14596396','_self')">
                            핑구야 날자님께서 직접 댓글을 달..
                            <div class="info">
                                <span class="name">인포러스트 인포러스트</span> ㆍ
                                <span class="date">11.15</span>
                            </div>
                        </li>

                        <li class="ripplelink" onclick="window.open('/21#comment14596260','_self')">
                            보기만해도 가보고 싶은 여행지네요..
                            <div class="info">
                                <span class="name">핑구야 날자</span> ㆍ
                                <span class="date">11.14</span>
                            </div>
                        </li>

                        <li class="ripplelink" onclick="window.open('/11#comment14524887','_self')">
                            안녕하세요! 인포러스트입니다. 굼..
                            <div class="info">
                                <span class="name">인포러스트 인포러스트</span> ㆍ
                                <span class="date">08.01</span>
                            </div>
                        </li>

                        <li class="ripplelink" onclick="window.open('/11#comment14524872','_self')">
                            뭔가 귀여운 아이언맨 폰 케이스네..
                            <div class="info">
                                <span class="name">굼뜬고고맨</span> ㆍ
                                <span class="date">08.01</span>
                            </div>
                        </li>

                        <li class="ripplelink" onclick="window.open('/10#comment14521491','_self')">
                            아이쿠 4K 촬영이 가능하고 초소형..
                            <div class="info">
                                <span class="name">인포러스트 인포러스트</span> ㆍ
                                <span class="date">07.28</span>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>

            <!-- 최근 트랙백 모듈 -->
            <div id="recentTrackback" class="card">
                <div class="card-header ripplelink">
                    <i class="ic-more_vert"></i>

                    <h3><i class="ic-inbox"></i> 최근에 받은 트랙백</h3>
                </div>
                <div class="card-listed-content">
                    <ul>

                        <li class="ripplelink" onclick="window.open('/21#trackback18985737','_self')">
                            DSLR카메라 EOS6D로 본 독일의 베를...
                            <div class="info">
                                <span class="name">핑구야 날자의 IT와 일상</span> ㆍ
                                <span class="date">11.14</span>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>

            <!-- 최근 보관함 모듈 -->
            <div id="archive" class="card">
                <div class="card-header ripplelink lessed">
                    <i class="ic-more_vert"></i>

                    <h3><i class="ic-folder"></i> 글 보관함</h3>
                </div>
                <div class="card-listed-content">
                    <ul>

                        <li class="ripplelink" onclick="window.open('/archive/201512','_self')">
                            <i class="ic-folder"></i>
                            <br/>
                            <span>2015/12</span>
                            <br/>
                            <span class="cnt">(1)</span>
                        </li>

                        <li class="ripplelink" onclick="window.open('/archive/201511','_self')">
                            <i class="ic-folder"></i>
                            <br/>
                            <span>2015/11</span>
                            <br/>
                            <span class="cnt">(6)</span>
                        </li>

                        <li class="ripplelink" onclick="window.open('/archive/201509','_self')">
                            <i class="ic-folder"></i>
                            <br/>
                            <span>2015/09</span>
                            <br/>
                            <span class="cnt">(1)</span>
                        </li>

                        <li class="ripplelink" onclick="window.open('/archive/201508','_self')">
                            <i class="ic-folder"></i>
                            <br/>
                            <span>2015/08</span>
                            <br/>
                            <span class="cnt">(4)</span>
                        </li>

                        <li class="ripplelink" onclick="window.open('/archive/201507','_self')">
                            <i class="ic-folder"></i>
                            <br/>
                            <span>2015/07</span>
                            <br/>
                            <span class="cnt">(8)</span>
                        </li>

                    </ul>
                    <div style="clear:both"></div>
                </div>
            </div>
            <style>
                #archive li {
                    display: block;
                    float: left;
                    padding: 0px;
                    width: 25%;
                    text-align: center;
                    border: none;
                    line-height: 15px
                }

                #archive li i {
                    font-size: 40px;
                }

                #archive .cnt {
                    position: relative;
                    left: 10px;
                    top: -40px;
                    color: #fff;
                }
            </style>

            <!-- 달력 모듈 -->
            <div id="calendar" class="card">
                <div class="card-header ripplelink">
                    <i class="ic-more_vert"></i>

                    <h3><i class="ic-event"></i> 달력</h3>
                </div>
                <div class="card-content">
                    <table class="tt-calendar" cellpadding="0" cellspacing="1" style="width: 100%; table-layout: fixed">
                        <caption class="cal_month">
                            <a href="/archive/201511" title="1개월 앞의 달력을 보여줍니다.">&laquo;</a>
                            &nbsp;
                            <a href="/archive/201512" title="현재 달의 달력을 보여줍니다.">2015/12</a>
                            &nbsp;
                            <a href="/archive/201601" title="1개월 뒤의 달력을 보여줍니다.">&raquo;</a>
                        </caption>
                        <thead>
                        <tr>
                            <th class="cal_week2">일</th>
                            <th class="cal_week1">월</th>
                            <th class="cal_week1">화</th>
                            <th class="cal_week1">수</th>
                            <th class="cal_week1">목</th>
                            <th class="cal_week1">금</th>
                            <th class="cal_week1">토</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="cal_week">
                            <td class="cal_day1">&nbsp;</td>
                            <td class="cal_day1">&nbsp;</td>
                            <td class=" cal_day cal_day3">1</td>
                            <td class=" cal_day cal_day3">2</td>
                            <td class=" cal_day cal_day3">3</td>
                            <td class=" cal_day cal_day3">4</td>
                            <td class=" cal_day cal_day3">5</td>
                        </tr>
                        <tr class="cal_week">
                            <td class=" cal_day cal_day_sunday cal_day3">6</td>
                            <td class=" cal_day cal_day3">7</td>
                            <td class=" cal_day cal_day3">8</td>
                            <td class=" cal_day cal_day3">9</td>
                            <td class=" cal_day cal_day3"><a class="cal_click" href="/archive/20151210">10</a></td>
                            <td class=" cal_day cal_day3">11</td>
                            <td class=" cal_day cal_day3">12</td>
                        </tr>
                        <tr class="cal_week cal_current_week">
                            <td class=" cal_day cal_day_sunday cal_day3">13</td>
                            <td class=" cal_day cal_day4">14</td>
                            <td class=" cal_day cal_day3">15</td>
                            <td class=" cal_day cal_day3">16</td>
                            <td class=" cal_day cal_day3">17</td>
                            <td class=" cal_day cal_day3">18</td>
                            <td class=" cal_day cal_day3">19</td>
                        </tr>
                        <tr class="cal_week">
                            <td class=" cal_day cal_day_sunday cal_day3">20</td>
                            <td class=" cal_day cal_day3">21</td>
                            <td class=" cal_day cal_day3">22</td>
                            <td class=" cal_day cal_day3">23</td>
                            <td class=" cal_day cal_day3">24</td>
                            <td class=" cal_day cal_day3">25</td>
                            <td class=" cal_day cal_day3">26</td>
                        </tr>
                        <tr class="cal_week">
                            <td class=" cal_day cal_day_sunday cal_day3">27</td>
                            <td class=" cal_day cal_day3">28</td>
                            <td class=" cal_day cal_day3">29</td>
                            <td class=" cal_day cal_day3">30</td>
                            <td class=" cal_day cal_day3">31</td>
                            <td class="cal_day2">&nbsp;</td>
                            <td class="cal_day2">&nbsp;</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <style>
                .tt-calendar {
                    font-weight: bold
                }

                .tt-calendar caption.cal_month {
                    background: #4285f4;
                    padding: 16px;
                    border-radius: 2px 2px 0 0
                }

                .tt-calendar caption.cal_month a {
                    color: #fff;
                    font-size: large
                }

                .tt-calendar tr {
                    height: 36px
                }

                .tt-calendar .cal_day3 a {
                    display: block;
                    color: #fff;
                    width: 30px;
                    height: 30px;
                    line-height: 30px;
                    background: #4285f4;
                    border-radius: 50%;
                    margin: 0 auto
                }

                .tt-calendar .cal_day4 {
                    color: #4285f4
                }

                .tt-calendar .cal_week2,
                .tt-calendar .cal_day_sunday {
                    color: #ff4081
                }

                .tt-calendar td,
                .tt-calendar th {
                    text-align: center
                }
            </style>

            <!-- 링크 모듈 -->
            <div id="link" class="card">
                <div class="card-header ripplelink lessed">
                    <i class="ic-more_vert"></i>

                    <h3><i class="ic-link"></i> 링크</h3>
                </div>
                <div class="card-listed-content">
                    <ul>

                        <li class="ripplelink" onclick="window.open('http://www.inforlust.com')">인포러스트닷컴</li>

                    </ul>
                </div>
            </div>

            <!-- 카운터 모듈 -->
            <div id="counter" class="card">
                <div class="card-header ripplelink">
                    <i class="ic-more_vert"></i>

                    <h3><i class="ic-assessment"></i> 카운터</h3>
                </div>
                <div class="card-content ripplelink">
                    <dl>
                        <dt>Total</dt>
                        <dd class="total">2,445</dd>
                        <dt class="today">Today</dt>
                        <dd>6</dd>
                        <dt class="yesterday">Yesterday</dt>
                        <dd>8</dd>
                    </dl>
                </div>
            </div>
            <style>#counter dl {
                -webkit-columns: 3;
                -moz-columns: 3;
                columns: 3
            }

            #counter dd {
                margin: 0
            }</style>

        </div>
    </aside>
</div>

<footer id="footer">
    <div class="container">
        <nav class="footMenu">
            <!-- 쓸 메뉴만 빼서 쓰세요
            <a href="/location">지역로그</a> :
            <a href="/tag">태그로그</a> :
            <a href="/media">미디어로그</a> :
            -->
            <a href="/guestbook">방명록</a> :
            <a href="/admin">관리자</a> :
            <a href="/admin/entry/post">글쓰기</a>
        </nav>
        <div class="copyright">
            <a href="/"> 인포러스트</a>'s powered by 김민준::: <a href="http://inforlust.tistory.com/notice/1" target="_blank">매체소개ⓘ</a>
            <br/>

        </div>
        <p>ⓒ 2015. 인포러스트 all rights reserved.</p>
    </div>
</footer>
<div id="toTop" class="iconbutton ripplelink" style="display:none;"
     onclick='$("body,html").animate({ scrollTop: "0" });'><i class="ic-keyboard_arrow_up"></i>
</div>
<!-- 푸터영역 끝 -->
<nav id="drawer">
    <div id="drawer_profile">
        <img src="/favicon.ico" alt="favicon"/>
        <a href="/">
            <div id="drawer_name">
                <p class="blogTitle">인포러스트닷컴</p>

                <p class="blogDesc">최연소 크리에이터 김민준의 포트폴리오</p>
            </div>
        </a>
    </div>
    <div id="drawer_login" class="iconbutton ripplelink">
    </div>
    <div class="drawer_container">
        <div class="listWrap">
            <ul>
                <li><a href="/tag"><i class="ic-loyalty"></i> 태그</a>
                </li>
                <li><a href="/toolbar/popup/link/" target="_blank"><i class="ic-link"></i> 링크 추가</a>
                </li>
                <li><a href="/guestbook"><i class="ic-sms"></i> 방명록</a>
                </li>
            </ul>
            <div id="drawer_admin">
                <h4>관리자 메뉴</h4>
                <ul>
                    <li><a href="/admin"><i class="ic-settings"></i> 관리자 모드</a>
                    </li>
                    <li><a href="/admin/entry/post"><i class="ic-create"></i> 글쓰기</a>
                    </li>
                </ul>
            </div>
            <div id="drawer-tmp-category">
                <ul>
                    <li><a href="/category">분류 전체보기 <span class="c_cnt">(20)</span> <img
                            src=http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/image/category/new_ico_5.gif
                            alt="N" style='vertical-align:middle;padding-left:2px;'/></a>
                        <ul>
                            <li><a href="/category/매체정보">매체정보 <span class="c_cnt">(1)</span></a>
                                <ul>
                                    <li><a href="/category/매체정보/인포러스트%20소개">인포러스트 소개 <span class="c_cnt">(1)</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="/category/리뷰">리뷰 <span class="c_cnt">(5)</span></a>
                                <ul>
                                    <li><a href="/category/리뷰/스마트폰">스마트폰 <span class="c_cnt">(1)</span></a></li>
                                    <li><a href="/category/리뷰/태블릿">태블릿 <span class="c_cnt">(0)</span></a></li>
                                    <li><a href="/category/리뷰/노트북">노트북 <span class="c_cnt">(0)</span></a></li>
                                    <li><a href="/category/리뷰/PC">PC <span class="c_cnt">(0)</span></a></li>
                                    <li><a href="/category/리뷰/카메라">카메라 <span class="c_cnt">(2)</span></a></li>
                                    <li><a href="/category/리뷰/오디오">오디오 <span class="c_cnt">(0)</span></a></li>
                                    <li><a href="/category/리뷰/악세서리">악세서리 <span class="c_cnt">(1)</span></a></li>
                                    <li><a href="/category/리뷰/아이디어%20제품">아이디어 제품 <span class="c_cnt">(0)</span></a></li>
                                    <li><a href="/category/리뷰/카테크">카테크 <span class="c_cnt">(0)</span></a></li>
                                </ul>
                            </li>
                            <li><a href="/category/뉴스">뉴스 <span class="c_cnt">(7)</span> <img
                                    src=http://i1.daumcdn.net/cfs.tistory/resource/1865/blog/image/category/new_ico_5.gif
                                    alt="N" style='vertical-align:middle;padding-left:2px;'/></a>
                                <ul>
                                    <li><a href="/category/뉴스/모바일">모바일 <span class="c_cnt">(3)</span></a></li>
                                    <li><a href="/category/뉴스/디바이스">디바이스 <span class="c_cnt">(1)</span></a></li>
                                    <li><a href="/category/뉴스/인터넷">인터넷 <span class="c_cnt">(2)</span></a></li>
                                    <li><a href="/category/뉴스/콘텐츠">콘텐츠 <span class="c_cnt">(0)</span></a></li>
                                    <li><a href="/category/뉴스/엔터프라이즈">엔터프라이즈 <span class="c_cnt">(0)</span></a></li>
                                </ul>
                            </li>
                            <li><a href="/category/인포데믹스">인포데믹스 <span class="c_cnt">(4)</span></a>
                                <ul>
                                    <li><a href="/category/인포데믹스/간담회및%20행사">간담회및 행사 <span class="c_cnt">(2)</span></a>
                                    </li>
                                    <li><a href="/category/인포데믹스/Images">Images <span class="c_cnt">(2)</span></a></li>
                                </ul>
                            </li>
                            <li><a href="/category/유럽일주%28특집%29">유럽일주(특집) <span class="c_cnt">(2)</span></a></li>
                            <li><a href="/category/스스로%20만드는%203D프린터%28특집%29">스스로 만드는 3D프린.. <span
                                    class="c_cnt">(1)</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div id="drawer-category">
                <h4>카테고리</h4>
            </div>
        </div>
        <div id="drawer_bottom">
            <a class="visible-xs" onclick="desktopMode()">PC화면 보기</a>
            <a href="http://reptilecheck.blog.me/">편집장 개인블로그</a>
            <a href="https://www.facebook.com/crocobstory">운영자 개인페이스북</a>
        </div>
    </div>
</nav>
<div id="background_blocker" onclick="window.history.back();"></div>
<!-- 네비게이션 끝 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!--[if lte IE 8]>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> <![endif]-->
<script src="http://ts.daumcdn.net/custom/blog/190/1901298/skin/images/materialT.js" async></script>
<script src="http://ts.daumcdn.net/custom/blog/190/1901298/skin/images/materialT-drawer.js" async></script>
<script>
    //홈화면 인식
    if (location.pathname == "/") {
        document.title = "인포러스트닷컴"
        $("article,#comments-box,#paging").remove();
        $("body").css("padding-top", "75vh");
        $("#blog-home").show();
        $(".loadingSpinner").remove();
    } else {
        $("article,#comments-box,#paging").show();
        $(".loadingSpinner").remove();
    }
    //rss 불러오기
    var recent_items = [];
    function loadViaRSS(n, l) {
        $.ajax({
            url: "/rss",
            dataType: "xml",
            success: function (t) {
                $(t).find("item").each(function () {
                    var item = {};
                    var link, thumb, title, desc, date;
                    link = $(this).children("link").text();
                    link = link.replace("http://", "");
                    if (link.split("/")[2] !== undefined) link = "/" + link.split("/")[1] + "/" + link.split("/")[2];
                    else link = "/" + link.split("/")[1];
                    title = $(this).children("title").text();
                    date = $(this).children('pubDate').text();
                    desc = $(this).children("description").text();
                    if (desc.match("http://cfile(.*?)\"") !== null) {
                        thumb = desc.match("http://cfile(.*?)\"")[0];
                        thumb = thumb.substring(0, thumb.length - 1);
                    } else {
                        thumb = "";
                    }
                    desc = desc.replace(/(<([^>]+)>)/ig, "");
                    item.link = link;
                    item.thumb = thumb;
                    item.title = title;
                    item.desc = desc;
                    item.date = date;
                    recent_items.push(item);
                });
                $("#recentPost li").each(addThumb("C40x40"));
                initHomeCards(n, l);
            },
            error: function () {
                console.log("RSS loading fail.");
            }
        });
    }
    function thumbSizing(url, size) {
        var s = url.replace("image", size);
        s = s.replace("original", size);
        return s;
    }
    //최근 글 썸네일 생성
    function addThumb(size) {
        return function () {
            var addr = $(this).children("a").attr("href");
            var r = $(this).find(".thumbnail");
            for (var i = 0; i < recent_items.length; ++i) {
                if (addr == decodeURIComponent(recent_items[i].link)) {
                    s = thumbSizing(recent_items[i].thumb, size);
                    r.attr("src", s);
                    r.addClass("byRSS");
                }
            }
        };
    }
    //메인화면 로딩
    function initHomeCards(n, l) {
        if (location.pathname == "/") {
            m = Math.min(n, recent_items.length);
            var col;
            for (var i = 0; i < m; i++) {
                var tmpCard = "";
                tmpCard += '<div class="homeCardWrap col-md-6">';
                tmpCard += '	<div class="homeCard card ripplelink" onclick="window.open(\'' + recent_items[i].link + '\',\'_self\')">';
                tmpCard += '		<img src="' + thumbSizing(recent_items[i].thumb, "C220x220") + '"/>';
                tmpCard += '		<div class="headAndDesc">';
                tmpCard += '			<h3>' + recent_items[i].title + '</h3>';
                tmpCard += '			<p>' + recent_items[i].desc.substring(0, l) + '...</p>';
                tmpCard += '		</div>';
                tmpCard += '	</div>';
                tmpCard += '</div>';
                $("#homeCards").append(tmpCard);
            }
            $("#homeCards").show();
        }
    }
    loadViaRSS(10, 40)//홈화면&최근글 썸네일 로딩(RSS갯수,불러올 글자 수)
</script>
<script type="text/javascript">
    document.oncontextmenu = new Function('return false');
    document.ondragstart = new Function('return false');
    document.onselectstart = new Function('return false');
    document.body.style.MozUserSelect = 'none';
</script>
<script type="text/javascript" src="http://s1.daumcdn.net/cfs.tistory/resource/1865/blog/plugins/PreventCopyContents/js/functions.js"></script>
<script id="DragSearchJs" type="text/javascript" src="http://s1.daumcdn.net/img.search/front/js/searchDragSelection.js?nil_ch=tistory" charset="euc-kr"></script>
<script type="text/javascript">if (asyncProfileItems) {
    tistoryProfile.getSidebarInfo(asyncProfileItems);
}</script>
<script charset="utf-8" type="text/javascript" src="http://m1.daumcdn.net/tiara/js/td.min.js"></script>

<script type="text/javascript">
    //<!--<![CDATA
    var __pageTracker = {};
    if (typeof __Tiara != "undefined" && typeof __Tiara.__getTracker != "undefined") {
        __pageTracker = __Tiara.__getTracker();
    } else {
        __pageTracker.__trackPageview = function () {
        };
        __pageTracker.__addParam = function () {
        };
        __pageTracker.__setTitle = function () {
        };
    }

    __pageTracker.__setTitle("인포러스트닷컴 :: 시각장애아동들을 위한 그림동화책을 만드는 청소년회사 &quot;준브레일&quot;");
    __pageTracker.__addParam("svcdomain", "user.tistory.com");
    __pageTracker.__addParam("category", "");
    __pageTracker.__addParam("articleno", "22");
    __pageTracker.__addParam("plink", "http://www.inforlust.com/22");
    __pageTracker.__addParam("date", "2015-12-10 16:26:46");
    __pageTracker.__addParam("author", "inforlust");
    __pageTracker.__addParam("length ", "14442");
    __pageTracker.__addParam("isauthor", "N");
    __pageTracker.__addParam("ishidden", "1");
    __pageTracker.__addParam("comments", "0");
    __pageTracker.__addParam("param1", "0");
    __pageTracker.__addParam("param2", "e");
    __pageTracker.__addParam("param3", "");


    window.setTimeout("try { __pageTracker.__trackPageview('http://www.inforlust.com/'); } catch(e) {}", 1);
    //]]>-->
</script>

<script type="text/javascript">
    window.roosevelt_params_queue = window.roosevelt_params_queue || [];
    window.roosevelt_params_queue.push({
        channel_id: "dk", channel_label: "tistory"
    });
</script>
<script type="text/javascript" src="//adimg.daumcdn.net/rt/dk_bt/roosevelt_dk_bt.js" async></script>
</body>

</html>