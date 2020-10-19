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
    .page-signup-header {
        box-shadow: 0 2px 2px rgba(0, 0, 0, .05), 0 1px 0 rgba(0, 0, 0, .05);
    }

    .page-signup-header .btn {
        position: absolute;
        top: 12px;
        right: 15px;
    }

    html[dir="rtl"] .page-signup-header .btn {
        right: auto;
        left: 15px;
    }

    .page-signup-container {
        width: auto;
        margin: 30px 10px;
    }

    .page-signup-container form {
        border: 0;
        box-shadow: 0 2px 2px rgba(0, 0, 0, .05), 0 1px 0 rgba(0, 0, 0, .05);
    }

    @media (min-width: 544px) {
        .page-signup-container {
            width: 350px;
            margin: 60px auto;
        }
    }

    .page-signup-social-btn {
        width: 40px;
        padding: 0;
        line-height: 40px;
        text-align: center;
        border: none !important;
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
    $(document).ready(function () {
        $('#submitBtn').on('click', function(){
            alertConfirm('회원가입', '회원가입 하시겠습니까?'/*<spring:message code="confirm.save" arguments="${alertMsg}"/>*/, function(result) {
                if(result) {
                    $('#inForm').submit();
                }
            });
        });
        $("#inForm").pxValidate({
            focusInvalid: false,
            rules: {
                'userId': {
                    required: true
                    , minlength: 4
                    , remote: {
                        url: "${ctxRoot}/access/checkId.do"
                        , type: "post"
                        , data: {
                            userId: function () {
                                return $("#userId").val();
                            }
                        }
                    }
                }
                , 'userName': {
                    required: true
                }
                , 'password': {
                    required: true
                    , minlength: 4
                }
                , 'userEmail': {
                    email: true
                }
                , 'agree': {
                    required: true
                }
            }
            , messages: {userId:{remote:'해당 아이디가 사용중입니다.'}}
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
                        , url: "${ctxRoot}/access/registSignup.do"
                        , data: $('form#inForm').serialize()
                        , beforeSend: function (jqXHR, settings) {
                            jqXHR.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                        }
                        , success: function (msg) {
                            if (msg == 'OK') {
                                alertSuccess('Success', '회원가입을 축하드립니다.<hr>로그인을 이용해주십시요.', function () {
                                    document.location = '${ctxRoot}/access/signin.do';
                                });
                            } else {
                                alertDanger('Fail', msg, function () {
                                    $("#saveButton").prop("disabled", false);
                                    setCursor("inForm", "default");
                                });
                            }
                        }
                        , error: function (request, status, error) {
                            alertWindow('Error', String.format('{0}<hr>{1}<hr><textarea rows="10" cols="75">{2}</textarea>', stringify(request), stringify(status), stringify(error)));
                            $("#saveButton").prop("disabled", false);
                            setCursor("inForm", "default");
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

<div class="page-signup-header p-a-2 text-sm-center bg-white">
    <a class="px-demo-brand px-demo-brand-lg text-default" href="${ctxRoot}/admin/index.do"><span
            class="px-demo-logo bg-primary m-t-0"><span class="px-demo-logo-1"></span><span
            class="px-demo-logo-2"></span><span class="px-demo-logo-3"></span><span class="px-demo-logo-4"></span><span
            class="px-demo-logo-5"></span><span class="px-demo-logo-6"></span><span class="px-demo-logo-7"></span><span
            class="px-demo-logo-8"></span><span class="px-demo-logo-9"></span></span><strong>IMPD</strong> Admin</a>
    <a href="${ctxRoot}/access/signin.do" class="btn btn-primary">Sign In</a>
</div>

<div class="page-signup-container">
    <h2 class="m-t-0 m-b-4 text-xs-center font-weight-semibold font-size-20">Create an Account</h2>

    <form id="inForm" action="${ctxRoot}/access/registSignup.do" method="get" class="panel p-a-4">
        <fieldset class="form-group form-group-lg">
            <input type="text" name="userName" id="userName" class="form-control" placeholder="Full Name">
        </fieldset>

        <fieldset class="form-group form-group-lg">
            <input type="email" name="userEmail" id="userEmail" class="form-control" placeholder="Email">
        </fieldset>

        <fieldset class="form-group form-group-lg">
            <input type="text" name="userId" id="userId" class="form-control" placeholder="User ID">
        </fieldset>

        <fieldset class="form-group form-group-lg">
            <input type="password" name="password" id="password" class="form-control" placeholder="Password">
            <small class="text-muted">Minimum 6 characters</small>
        </fieldset>

        <fieldset class="form-group form-group-lg">
            <input type="text" name="type" id="type" class="form-control" placeholder="Company">
        </fieldset>

        <label class="custom-control custom-checkbox">
            <input type="checkbox" name="agree" id="agree"  class="custom-control-input">
            <span class="custom-control-indicator"></span>
            I agree with the <a href="#" target="_blank">Terms and Conditions</a>
        </label>

        <input type="hidden" id="status" name="status" value="join"/>
        <button id="submitBtn" type="button" class="btn btn-block btn-lg btn-primary m-t-3">Sign Up</button>
    </form>

    <h4 class="m-y-3 text-xs-center font-weight-semibold text-muted">or sign up with</h4>

    <%--open sign up--%>
    <div class="text-xs-center">
        <a href="#" class="page-signup-social-btn btn btn-success btn-rounded" data-toggle="tooltip"
           title="Facebook"><i class="fa fa-facebook"></i></a>&nbsp;&nbsp;&nbsp;
        <a href="#" class="page-signup-social-btn btn btn-info btn-rounded" data-toggle="tooltip"
           title="Twitter"><i class="fa fa-twitter"></i></a>&nbsp;&nbsp;&nbsp;
        <a href="#" class="page-signup-social-btn btn btn-danger btn-rounded" data-toggle="tooltip"
           title="Google+"><i class="fa fa-google-plus"></i></a>
    </div>
</div>