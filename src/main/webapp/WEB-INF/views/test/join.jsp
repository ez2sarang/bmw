<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 16. 2. 3.
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%>
<%--<link href="http://infinite-woodland-5276.herokuapp.com/assets/stylesheets/pixel-admin.min.css" rel="stylesheet" type="text/css">--%>
<%--<link href="${ctxRoot}/style/asset/pixel-admin.min.css" rel="stylesheet" type="text/css">--%>
<link href="${ctxRoot}/style/asset/pages.min.css" rel="stylesheet" type="text/css">
<link href="${ctxRoot}/style/asset/rtl.min.css" rel="stylesheet" type="text/css">
<link href="${ctxRoot}/style/asset/themes.min.css" rel="stylesheet" type="text/css">
<style>
    #signup-demo {
        position: fixed;
        right: 0;
        bottom: 0;
        z-index: 10000;
        background: rgba(0,0,0,.6);
        padding: 6px;
        border-radius: 3px;
    }
    #signup-demo img { cursor: pointer; height: 40px; }
    #signup-demo img:hover { opacity: .5; }
    #signup-demo div {
        color: #fff;
        font-size: 10px;
        font-weight: 600;
        padding-bottom: 6px;
    }
</style>
<script>
    $(document).ready(function () {
        var $div = $('<div id="signup-demo" class="hidden-xs"><div>PAGE BACKGROUND</div></div>'),
                bgs = ['assets/demo/signin-bg-1.jpg', 'assets/demo/signin-bg-2.jpg', 'assets/demo/signin-bg-3.jpg',
                    'assets/demo/signin-bg-4.jpg', 'assets/demo/signin-bg-5.jpg', 'assets/demo/signin-bg-6.jpg',
                    'assets/demo/signin-bg-7.jpg', 'assets/demo/signin-bg-8.jpg', 'assets/demo/signin-bg-9.jpg'];
        for (var i = 0, l = bgs.length; i < l; i++) $div.append($('<img src="' + bgs[i] + '">'));
        $div.find('img').click(function () {
            var img = new Image();
            img.onload = function () {
                $('#page-signup-bg > img').attr('src', img.src);
                $(window).resize();
            }
            img.src = $(this).attr('src');
        });
        $('body').append($div);
    });
</script>
<body class="theme-default page-signup">
    <div class="signup-container">
        <!-- Header -->
        <div class="signup-header">
            <a href="${ctxRoot}/mobilesample.do" class="logo">
                <img src="http://infinite-woodland-5276.herokuapp.com/assets/demo/logo-big.png" alt="" style="margin-top: -5px;">&nbsp;
                비젠트<%-- TODO 변수처리 --%>
            </a> <!-- / .logo -->
            <div class="slogan">
                Simple. Flexible. Powerful.
            </div>
            <!-- / .slogan -->
        </div>
        <!-- / Header -->

        <!-- Form -->
        <div class="signup-form">
            <form action="index.html" id="signup-form_id" novalidate="novalidate">

                <div class="signup-text">
                    <span>Create an account</span>
                </div>

                <div class="form-group w-icon">
                    <input type="text" name="signup_name" id="name_id" class="form-control input-lg"
                           placeholder="Full name">
                    <span class="fa fa-info signup-form-icon"></span>
                </div>

                <div class="form-group w-icon">
                    <input type="text" name="signup_email" id="email_id" class="form-control input-lg" placeholder="E-mail">
                    <span class="fa fa-envelope signup-form-icon"></span>
                </div>

                <div class="form-group w-icon">
                    <input type="text" name="signup_username" id="username_id" class="form-control input-lg"
                           placeholder="Username">
                    <span class="fa fa-user signup-form-icon"></span>
                </div>

                <div class="form-group w-icon">
                    <input type="password" name="signup_password" id="password_id" class="form-control input-lg"
                           placeholder="Password">
                    <span class="fa fa-lock signup-form-icon"></span>
                </div>

                <div class="form-group" style="margin-top: 20px;margin-bottom: 20px;">
                    <label class="checkbox-inline">
                        <input type="checkbox" name="signup_confirm" class="px" id="confirm_id">
                        <span class="lbl">I agree with the <a href="#" target="_blank">Terms and Conditions</a></span>
                    </label>
                </div>

                <div class="form-actions">
                    <input type="submit" value="회원가입" class="signup-btn bg-primary">
                </div>
            </form>
            <!-- / Form -->

            <!-- "Sign In with" block -->
            <div class="signup-with">
                <!-- Facebook -->
                <a href="index.html" class="signup-with-btn" style="background:#4f6faa;background:rgba(79, 111, 170, .8);">Sign
                    Up with <span>Facebook</span></a>
            </div>
            <!-- / "Sign In with" block -->
        </div>
        <!-- Right side -->
    </div>
</body>
