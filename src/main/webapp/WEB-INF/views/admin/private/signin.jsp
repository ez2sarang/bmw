<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 2017. 3. 5.
  Time: PM 7:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
        %>
<%@ include file="/WEB-INF/views/common/includes.jsp"
        %>
<!-- Custom styling -->
<style>
    .page-signin-header {
        box-shadow: 0 2px 2px rgba(0, 0, 0, .05), 0 1px 0 rgba(0, 0, 0, .05);
    }

    .page-signin-header .btn {
        position: absolute;
        top: 12px;
        right: 15px;
    }

    html[dir="rtl"] .page-signin-header .btn {
        right: auto;
        left: 15px;
    }

    .page-signin-container {
        width: auto;
        margin: 30px 10px;
    }

    .page-signin-container form {
        border: 0;
        box-shadow: 0 2px 2px rgba(0, 0, 0, .05), 0 1px 0 rgba(0, 0, 0, .05);
    }

    @media (min-width: 544px) {
        .page-signin-container {
            width: 350px;
            margin: 60px auto;
        }
    }

    .page-signin-social-btn {
        width: 40px;
        padding: 0;
        line-height: 40px;
        text-align: center;
        border: none !important;
    }

    #page-signin-forgot-form {
        display: none;
    }
</style>
<!-- / Custom styling -->

<!-- Javascript -->
<script>
    pxInit.push(function () {
        $(function () {
            pxDemo.initializeBgsDemo('body', 0, '#000', function (isBgSet) {
                $('h2')[isBgSet ? 'addClass' : 'removeClass']('text-white font-weight-bold');

                $('h4')
                        .addClass(isBgSet ? 'text-white' : 'text-muted')
                        .removeClass(isBgSet ? 'text-muted' : 'text-white');
            });

            $('#page-signin-forgot-link').on('click', function (e) {
                e.preventDefault();

                $('#page-signin-form').css({display: 'none'});
                $('#page-signin-forgot-form').css({display: 'block'});

                $(window).trigger('resize');
            });

            $('#page-signin-forgot-back').on('click', function (e) {
                e.preventDefault();

                $('#page-signin-form').css({display: 'block'});
                $('#page-signin-forgot-form').css({display: 'none'});

                $(window).trigger('resize');
            });

            $('[data-toggle="tooltip"]').tooltip();
        });
        $(function() {
            $(".px-demo-bgs-container").each(function(bgsIndex) {
                $(this).on('click', function(){
                    $.cookie('px-demo-bgs-index', bgsIndex, {path: '${ctxRoot}'});
                });
            });
            $(".px-demo-bgs-container").eq($.cookie('px-demo-bgs-index')).trigger('click');
        });
    });

    $(document).ready(function(){
        $("#inForm").pxValidate({
            focusInvalid: false,
            rules: {
                'userId': {
                    required: true
                    , minlength: 4
                }
                , 'password': {
                    required: true
                    , minlength: 4
                }
            }
//            , errorClass: "impd-error-class"
//            , validClass: "impd-valid-class"
            , success: function (label) {
                label.addClass("valid");
            }
            , submitHandler: function(result) {
                setCursor("inForm", "wait");
                try {
                    $.ajax({
                        type: "POST"
                        , url: "${ctxRoot}/access/login.do"
                        , headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
                        , ignoreAuthModule: true
                        , transformRequest: function(data){
                            return $.param(data);
                        }
                        , beforeSend: function(jqXHR, settings) {
                            jqXHR.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                        }
                        , data: $('form#inForm').serialize()
                        , success: function (msg) {
                            document.location = '${ctxRoot}/admin/index.do';
                            /*if (msg == 'OK') {
                                alertSuccess('Success', '회원가입을 축하드립니다.<hr>로그인을 이용해주십시요.', function () {
                                    document.location = '${ctxRoot}/admin/';
                                });
                            } else {
                                alertDanger('Fail', msg, function () {
                                    $("#saveButton").prop("disabled", false);
                                    setCursor("inForm", "default");
                                });
                            }*/
                        }
                        , error: function (request, status, error) {
                            alertWindow('Error', String.format('{0}<hr>{1}<hr><textarea rows="10" cols="75">{2}</textarea>', stringify(request), stringify(status), stringify(error)));
                            $("#saveButton").prop("disabled", false);
                            setCursor("inForm", "default");
                            location.reload();
                        }
                    });
                } catch (e) {
//                    alertWindow('Exception', stringify(e));
                    console.log(e);
                }
            }
        });

        $("#mailForm").validate({
            focusInvalid: false,
            rules: {
                'userEmail': {
                    required: true
                    , email: true
                }
            }
            , errorClass: "impd-error-class"
            , validClass: "impd-valid-class"
            , success: function (label) {
                label.addClass("valid");
            }
            , submitHandler: function(result) {
                setCursor("mailForm", "wait");
                try {
                    $.ajax({
                        type: "POST"
                        , url: "${ctxRoot}/access/registSignup.do"
                        , data: $('form#mailForm').serialize()
                        , success: function (msg) {
                            if (msg == 'OK') {
                                alertSuccess('Success', '회원가입을 축하드립니다.<hr>로그인을 이용해주십시요.', function () {
                                    document.location = '${ctxRoot}/access/signin.do';
                                });
                            } else {
                                alertDanger('Fail', msg, function () {
                                    $("#saveButton").prop("disabled", false);
                                    setCursor("mailForm", "default");
                                });
                            }
                        }
                        , error: function (request, status, error) {
                            alertWindow('Error', String.format('{0}<hr>{1}<hr><textarea rows="10" cols="75">{2}</textarea>', stringify(request), stringify(status), stringify(error)));
                            $("#saveButton").prop("disabled", false);
                            setCursor("mailForm", "default");
                        }
                    });
                } catch (e) {
//                    alertWindow('Exception', stringify(e));
                    console.log(e);
                }
            }
        });
    });
</script>
<!-- / Javascript -->

<div class="page-signin-header p-a-2 text-sm-center bg-white">
    <a class="px-demo-brand px-demo-brand-lg text-default" href="${ctxRoot}/admin/index.do"><span
            class="px-demo-logo bg-primary m-t-0"><span class="px-demo-logo-1"></span><span
            class="px-demo-logo-2"></span><span class="px-demo-logo-3"></span><span class="px-demo-logo-4"></span><span
            class="px-demo-logo-5"></span><span class="px-demo-logo-6"></span><span class="px-demo-logo-7"></span><span
            class="px-demo-logo-8"></span><span class="px-demo-logo-9"></span></span><strong>IMPD</strong> Admin</a>
    <a href="${ctxRoot}/access/signup.do" class="btn btn-primary">Sign Up</a>
</div>

<!-- Sign In form -->

<div class="page-signin-container" id="page-signin-form">
    <h2 class="m-t-0 m-b-4 text-xs-center font-weight-semibold font-size-20">Sign In to your Account</h2>

    <form id="inForm" action="index.html" class="panel p-a-4">
        <fieldset class=" form-group form-group-lg">
            <input type="text" id="username" name="username" class="form-control" placeholder="UserID">
        </fieldset>

        <fieldset class=" form-group form-group-lg">
            <input type="password" id="password" name="password" class="form-control" placeholder="Password">
        </fieldset>

        <div class="clearfix">
            <label class="custom-control custom-checkbox pull-xs-left">
                <input type="checkbox" id="remember-me" name="remember-me" class="custom-control-input">
                <span class="custom-control-indicator"></span>
                Remember me
            </label>
            <a href="#" class="font-size-12 text-muted pull-xs-right" id="page-signin-forgot-link">Forgot your
                password?</a>
        </div>

        <button type="submit" class="btn btn-block btn-lg btn-primary m-t-3">Sign In</button>
    </form>

    <h4 class="m-y-3 text-xs-center font-weight-semibold text-muted">or sign in with</h4>

    <div class="text-xs-center">
        <a href="index.html" class="page-signin-social-btn btn btn-success btn-rounded" data-toggle="tooltip"
           title="Facebook"><i class="fa fa-facebook"></i></a>&nbsp;&nbsp;&nbsp;
        <a href="index.html" class="page-signin-social-btn btn btn-info btn-rounded" data-toggle="tooltip"
           title="Twitter"><i class="fa fa-twitter"></i></a>&nbsp;&nbsp;&nbsp;
        <a href="index.html" class="page-signin-social-btn btn btn-danger btn-rounded" data-toggle="tooltip"
           title="Google+"><i class="fa fa-google-plus"></i></a>
    </div>
</div>

<!-- / Sign In form -->

<!-- Reset form -->

<div class="page-signin-container" id="page-signin-forgot-form">
    <h2 class="m-t-0 m-b-4 text-xs-center font-weight-semibold font-size-20">Password reset</h2>

    <form id="mailForm" action="index.html" class="panel p-a-4">
        <fieldset class="form-group form-group-lg">
            <input type="email" id="userEmail" name="userEmail" class="form-control" placeholder="Your Email">
        </fieldset>

        <button type="submit" class="btn btn-block btn-lg btn-primary m-t-3">Send password reset link</button>
        <div class="m-t-2 text-muted">
            <a href="#" id="page-signin-forgot-back">&larr; Back</a>
        </div>
    </form>
</div>

<!-- / Reset form -->