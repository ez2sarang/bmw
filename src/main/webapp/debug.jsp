<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 2017. 2. 20.
  Time: PM 7:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal modal-fullscreen fade left in" id="modal-fullscreen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" style="display: block; padding-left: 0px;">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>IMPD</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
  <link rel="stylesheet" href="/impd/style/impd.css">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/impd/style/impd.css">


  <style type="text/css" class="init">
    /*.navterm {
        height: 40px
    }
    nav.navbar {
        background-color: #3F51B5/!*2c363f*!/;
        border-radius: 0;
        margin-bottom: 0;
        border: none;
        height: 40px
    }

    nav.navbar.affix {
        box-shadow: 0 2px 2px 0 #3F51B5 /!*222930*!/
    }

    nav.navbar .logo {
        margin: 5px 0
    }

    nav.navbar li.active a, nav.navbar li > a:focus, nav.navbar li > a:hover {
        background-color: inherit
    }

    nav.navbar li > a {
        padding-bottom: 30px;
        padding-top: 30px;
        line-height: 20px;
        color: #59D16C;
        text-transform: uppercase
    }

    nav.navbar .navbar-collapse {
        background-color: #3F51B5 /!*2c363f*!/
    }

    nav.navbar .navbar-collapse:not(.in) {
        padding: 0
    }

    nav.navbar .navbar-collapse:not(.in) li.active a, nav.navbar .navbar-collapse:not(.in) li > a:focus, nav.navbar .navbar-collapse:not(.in) li > a:hover {
        border-top: 4px solid #59D16C;
        padding-top: 26px
    }

    nav.navbar .navbar-toggle {
        height: 40px;
        margin-bottom: 20px;
        margin-top: 20px
    }

    nav.navbar .navbar-toggle .icon-bar {
        background-color: #fff;
        height: 4px;
        width: 30px
    }

    .navbar-nav {
        margin: 7.5px -15px
    }

    .navbar-nav > li > a {
        padding-top: 10px;
        padding-bottom: 10px;
        line-height: 20px
    }

    @media (min-width: 768px) {
        .navbar-toggle {
            display: none
        }

        .navbar-nav {
            float: left;
            margin: 0
        }

        .navbar-nav > li {
            float: left
        }

        .navbar-nav > li > a {
            padding-top: 15px;
            padding-bottom: 15px
        }
    }

    .navbar-default .navbar-nav > li > a, .navbar-default .navbar-text {
        color: #777
    }

    .navbar-default .navbar-nav > li > a:focus, .navbar-default .navbar-nav > li > a:hover {
        color: #333;
        background-color: transparent
    }

    .navbar-inverse .navbar-nav > li > a, .navbar-inverse .navbar-text {
        color: #9d9d9d
    }

    .navbar-inverse .navbar-nav > li > a:focus, .navbar-inverse .navbar-nav > li > a:hover {
        color: #fff;
        background-color: transparent
    }

    /!*nav.navbar .navbar-collapse {
        background-color: #3F51B5/!*2c363f*!/
    }

    nav.navbar .navbar-collapse:not(.in) {
        padding: 0
    }

    nav.navbar .navbar-collapse:not(.in) li.active a, nav.navbar .navbar-collapse:not(.in) li > a:focus, nav.navbar .navbar-collapse:not(.in) li > a:hover {
        border-top: 4px solid #59D16C;
        padding-top: 26px
    }*!/
    .content {
        background-color: #F4F2F3
    }

    .content p {
        font-size: 15px;
        line-height: 25px
    }

    .content .link-round {
        color: inherit;
        display: inline-block
    }

    .content .link-round:hover {
        text-decoration: none
    }

    .content .link-round .fa {
        border-radius: 50%;
        font-size: 6em;
        background-color: #ddd6d9;
        line-height: 2em;
        height: 2em;
        width: 2em;
        text-align: center
    }

    .content p.head {
        margin-bottom: 50px
    }*/

    .navbar-sticky {
      padding: 0px 0;
      background-color: slategrey;
      position: -webkit-sticky;
      top: 0px;
      z-index: 1;
      background: #3F51B5;
      text-decoration: none;
      color: #fff;
    }
    .sticky {
      position: fixed;
      width: 100%;
      left: 0;
      top: 0;
      z-index: 100;
      border-top: 0;
    }

    /* Float the list items side by side */
    .navbar-sticky ul li {float: left;}

    /* Style the links inside the list items */
    .navbar-sticky ul li a {
      display: inline-block;
      /*color: #5fbeda;*/
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
      transition: 0.3s;
      font-size: 17px;
    }

    .navbar-sticky ul li.active a {
      color: #5fbeda;
    }

    /* Change background color of links on hover */
    /*.navbar-sticky ul li.active a {color: #fff;}*/

    /* Change background color of links on hover */
    .navbar-sticky ul li.active a,
    .navbar-sticky ul li.active a:hover,
    .navbar-sticky ul li.active a:focus,
    {
      color: #fff;
      background-color: #3F51B5;
    }
    .nav>li>a:focus, .nav>li>a:hover {
      background-color: #3F51B5;
    }
    a:focus, a:hover {
      color: #337ab7;
    }
    /*
    .navbar-sticky ul li.active a:hover {color: #fff;}

    .nav > li > a:hover,
    .nav > li > a:focus {
        text-decoration: none;
    }
    */




    /* Hide the list item that contains the link that should open and close the topnav on small screens */
    .navbar-sticky ul li.icon {display: none;}

    /*.sticky li:active, .sticky li a:focus {
        text-decoration: none;
        background-color: green;
    }*/

    /*헤더*/
    header {
      margin: 0;
      padding: 0;
      /*position: fixed;*/
      top: 0;
      left: 0;
      width: 100%;
      height: 56px;
      background: #3F51B5;/*3F51B5*/
      -webkit-transition: 0.3s;
      transition: 0.3s;
      z-index: 900;
      box-shadow: 4px 4px 12px 1.2px rgba(0, 0, 0, 0.2);
    }
    header a, header a:hover, header a:focus {
      text-decoration: none;
      color: #fff;
    }
    header .drawer-toggle {
      /*position: fixed;*/
      top: 0;
      left: 0;
      width: 56px;
      height: 56px;
      line-height: 56px;
      text-align: center;
      font-size: 25px;
      color: #fff;
      text-shadow: rgba(0, 0, 0, 0.3) 1px 1px 2px, rgba(0, 0, 0, 0.3) 0 0 10px;
    }
    header h3 {
      position: absolute;
      top: 0;
      left: 80px;
      margin: 0;
      line-height: 56px;
      font-size: 22px;
    }
    header #search-box {
      position: absolute;
      top: 0;
      left: 100%;
      width: 100%;
      height: 56px;
      background: #3F51B5;
    }
    header #search-box .search-icon {
      position: absolute;
      right: 0;
      width: 56px;
      height: 56px;
      line-height: 56px;
      text-align: center;
      font-size: 25px;
      -webkit-transition: 0.3s;
      transition: 0.3s;
    }
    header #search-box .icon {
      position: fixed;
      right: 0;
      width: 56px;
      height: 56px;
      line-height: 56px;
      text-align: center;
      font-size: 25px;
      -webkit-transition: 0.3s;
      transition: 0.3s;
    }
    header #search-box input {
      background: #3F51B5;
      height: 52px;
      margin: 2px 0;
      padding: 0 10px;
      border: none;
      color: #fff;
      font-size: 20px;
    }
    header #search-box input:focus {
      outline: none;
    }
    header #search-box.opened {
      left: 0;
    }
    header #search-box.opened .search-icon {
      position: static;
      margin: 0 16px;
    }

    .iconmenu {
      height: 56px;
      float: right;
    }

    .iconmenu-wrap {
      display: inline-block;
      position: relative;
    }

    .iconmenu-main {
      font-size: 25px;
      line-height: 56px;
      padding-right: 10px;
      /* 1 */
    }

    #drawer {
      width: 280px;
      height: 100%;
      position: fixed;
      top: 0;
      left: -280px;
      background: #fff;
      z-index: 1050;
      -webkit-transition: .3s;
      transition: .3s;
      overflow: hidden;
    }
    #drawer.opened {
      left: 0;
      box-shadow: 5px 5px 15px 1.5px rgba(0, 0, 0, 0.2);
    }
    #drawer #drawer_profile {
      /*
      //lh3.googleusercontent.com/-TZbqWIiEn0Y/T9kJs6KGq5I/AAAAAAAAAFU/_D_sOnPhfPM/s1000-fcrop64=1,226809a6e0fdabfd/Beach.jpg
      //lh3.googleusercontent.com/-TZbqWIiEn0Y/T9kJs6KGq5I/AAAAAAAAAFU/PxDlgi7luncpm4bjdQQ6QHKv2tRAtrVJQCL0B/s1000-fcrop64=1,226809a6e0fdabfd/Beach.jpg
      */
      background: url(/impd/assets/img/Beach.jpg);
      background-size: cover;
      height: 134px;
      padding: 16px 16px 8px;
      z-index: 10;
    }
    #drawer #drawer_profile img {
      width: 64px;
      height: 64px;
      max-width: 64px;
      max-height: 64px;
      background: #fff;
      border-radius: 50%;
    }
    #drawer #drawer_profile a:hover, #drawer #drawer_profile a:focus {
      text-decoration: none;
    }
    #drawer #drawer_profile #drawer_name {
      color: #fff;
      line-height: 27px;
      font-weight: 900;
    }
    #drawer #drawer_profile #drawer_name p {
      margin: 0;
    }
    #drawer #drawer_profile #drawer_name .blogTitle {
      font-weight: bold;
      font-size: 20px;
    }
    #drawer #drawer_profile #drawer_name .blogDesc {
      font-size: 12px;
      margin-top: -5px;
    }
    #drawer #drawer_login {
      background: #fff;
      position: absolute;
      top: 16px;
      left: 224px;
      color: #aaa;
    }
    #drawer .drawer_container {
      width: 100%;
      position: absolute;
      top: 134px;
      bottom: 0;
      overflow-y: auto;
    }
    #drawer .drawer_container .listWrap h4, #drawer .drawer_container .listWrap a {
      margin: 0;
      line-height: 48px;
      padding-left: 16px;
    }
    #drawer .drawer_container .listWrap ul, #drawer .drawer_container .listWrap li {
      overflow: hidden;
      padding: 0;
      margin: 0;
    }
    #drawer .drawer_container .listWrap ul {
      margin: 0 0 8px;
    }
    #drawer .drawer_container .listWrap ul i {
      margin-right: 16px;
    }
    #drawer .drawer_container .listWrap ul li {
      padding-left: 16px;
    }
    #drawer .drawer_container .listWrap ul li:hover {
      background: #eee;
    }
    #drawer .drawer_container .listWrap ul li li:hover {
      background: #bbb;
    }
    #drawer .drawer_container .listWrap a {
      display: block;
      width: 100%;
      color: #333;
      text-decoration: none;
    }
    #drawer .drawer_container .listWrap .actoggle .open, #drawer .drawer_container .listWrap .actoggle .close {
      float: right;
    }
    #drawer .drawer_container .listWrap .actoggle .close {
      display: none;
    }
    #drawer .drawer_container .listWrap .actoggle.acopen .close {
      display: block;
    }
    #drawer .drawer_container .listWrap .actoggle.acopen .open {
      display: none;
    }
    #drawer .drawer_container .listWrap .actoggle > ul {
      display: none;
      padding-left: 23px !important;
    }

    #drawer #drawer_bottom {
      border-top: #eee solid 1px;
      padding: 24px 16px;
      box-sizing: content-box;
    }

    #background_blocker {
      display: none;
      background: rgba(0, 0, 0, 0.2);
      position: fixed;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      z-index: 999;
    }
    #background_blocker.opened {
      display: block;
    }

    #drawer.opened + #background_blocker {
      display: block;
    }

    html.opened {
      overflow: hidden;
    }

    @media (min-width: 768px) {
      #drawer {
        width: 400px;
        left: -400px;
      }
      #drawer #drawer_login {
        left: 344px;
      }
    }
    #sidebar-wrapper {
      z-index: 1000;
      /*position: fixed;*/
      /*left: 250px;*/
      /*width: 0;*/
      height: 100%;
      /*margin-left: -250px;*/
      overflow-y: auto;
      /*background: #000;*/
      -webkit-transition: all 0.5s ease;
      -moz-transition: all 0.5s ease;
      -o-transition: all 0.5s ease;
      transition: all 0.5s ease;
    }
    /* Sidebar Styles */

    .sidebar-nav {
      position: absolute;
      top: 0;
      width: 250px;
      margin: 0;
      padding: 0;
      list-style: none;
    }

    .sidebar-nav li {
      text-indent: 20px;
      line-height: 40px;
    }

    .sidebar-nav li a {
      display: block;
      text-decoration: none;
      color: #999999;
    }

    .sidebar-nav li a:hover {
      text-decoration: none;
      color: #fff;
      background: rgba(255,255,255,0.2);
    }

    .sidebar-nav li a:active,
    .sidebar-nav li a:focus {
      text-decoration: none;
    }

    .sidebar-nav > .sidebar-brand {
      height: 65px;
      font-size: 18px;
      line-height: 60px;
    }

    .sidebar-nav > .sidebar-brand a {
      color: #999999;
    }

    .sidebar-nav > .sidebar-brand a:hover {
      color: #fff;
      background: none;
    }
    #goTop {
      position: fixed;
      right: 16px;
      bottom: 16px;
      font-weight: bold;
      background: #9d9e8e;
      color: #fff;
      box-shadow: 2px 2px 6px 0.6px rgba(0, 0, 0, 0.2);
      z-index: 10;
    }
    .o-button {
      background: #fff;
      -webkit-transition: 0.4s;
      transition: 0.4s;
      border-radius: 50%;
      border: none;
      width: 40px;
      height: 40px;
      text-align: center;
      line-height: 40px;
      font-size: 16px;
    }
    .o-button:hover {
      z-index: 10;
      box-shadow: 4px 4px 12px 1.2px rgba(0, 0, 0, 0.2);
    }
    .replyLink {
      display: block;
      position: relative;
      overflow: hidden;
    }
    .box {
      padding:20px;
      text-align:center;
    }
    .calendar-open {
      margin-left:-90px;
      /*width: 100%;*/
      /*position: fixed;*/
    }
    .popover-content {
      padding:0;
    }
  </style>
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


  <div id="main-wrapper">
    <header id="header" style="width:100%;">
      <div class="drawer-toggle"><a id="contentBack" href="#" onclick="setTimeout(&quot;$(\&quot;#modal-fullscreen\&quot;).html(\&quot;\&quot;)&quot;, 1000);" data-dismiss="modal"><i class="glyphicon glyphicon-menu-left"></i></a>
      </div>
      <h3><a href="/impd/hnews/mobile.do"></a></h3>
    </header>
  </div>
  <div class="row" id="listDiv">
    <div class="panel panel-info" style="padding-top: 0px;">
      <div class="panel-body">


        <title></title>
        <script>
          $("document").ready(function(){

          });
        </script>


        <div class="bs-callout bs-callout-info thumbnail" id="coupon0">
          <h4><a href="/impd/hnews/viewContent.do">No default class()</a></h4>

          <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"><br>Alerts
            don't have default classes, only base and modifier classes. A default gray alert doesn't
            make too much sense, so you're required to specify a type via contextual class. Choose from
            success, info, warning, or danger.</p>
        </div>
        <div class="bs-callout bs-callout-info thumbnail" id="coupon2">
          <h4><a href="javascript:showPage('/impd/hnews/viewContent.do?contentId=');">No default class()</a></h4>

          <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"><br>Alerts
            don't have default classes, only base and modifier classes. A default gray alert doesn't
            make too much sense, so you're required to specify a type via contextual class. Choose from
            success, info, warning, or danger.</p>
        </div>
        <div class="bs-callout bs-callout-info thumbnail" id="coupon3">
          <h4>No default class</h4>

          <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"><br>Alerts
            don't have default classes, only base and modifier classes. A default gray alert doesn't
            make too much sense, so you're required to specify a type via contextual class. Choose from
            success, info, warning, or danger.</p>
        </div>



      </div>
    </div>
  </div>
  <div id="goTopInfo" class="o-button replyLink" style="display:none;" onclick="$(&quot;body,html&quot;).animate({ scrollTop: &quot;0&quot; });return false;"><i class="fa fa-angle-up"></i></div>


</div>