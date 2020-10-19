<%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><c:set var="ctxRoot" value="${pageContext.request.contextPath}"/><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>Document</title>
    <%--<link href="https://nicolargo.github.io/glances/public/styles/vendors.css" rel="stylesheet" type="text/css">--%>
    <%--<link href="https://nicolargo.github.io/glances/public/styles/main.css" rel="stylesheet" type="text/css">--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker3.standalone.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
    <link href="${ctxRoot}/js/flexslider/flexslider.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${ctxRoot}/style/impd.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <c:import url="/WEB-INF/views/include/mainStyle.jsp" charEncoding="UTF-8">
    <c:param name="bgColor" value="F4F2F3"></c:param>
    </c:import>

    <!-- Latest compiled and minified JavaScript -->
    <script src="//code.jquery.com/jquery-2.1.4.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.kr.min.js"></script>
    <script src="${ctxRoot}/assets/external/js/jquery.form.js"></script>
    <script src="${ctxRoot}/assets/external/js/dropzone.js"></script>
    <script src="${ctxRoot}/js/carousel/jQuery.Brazzers-Carousel.js"></script>
    <script src="${ctxRoot}/js/impd.js"></script>
    <script src="${ctxRoot}/js/flexslider/jquery.flexslider.js"></script>
    <script type="text/javascript" language="JavaScript">
        ctxRoot = '${ctxRoot}';
        var links;
        $(document).ready(function() {
            $('.datepicker').datepicker({});
            $("#dropzonejs-example").dropzone({
                url: "/ziminnav/uploadFilex.do"
                , paramName: "fileData" // The name that will be used to transfer the file
                , maxFilesize: 2000 // MB
                , acceptedFiles: "" //"image/*,application/pdf,.psd"
                , /*accept: function(file, done) {alert(stringify(file));},*/
                  addRemoveLinks : true
                , dictDefaultMessage: "Drop files here to upload!"
                , dictResponseError: "Can't upload file!"
                , autoProcessQueue: true
                , thumbnailWidth: 138
                , thumbnailHeight: 120
                , previewTemplate: $("#fileUploadFrame").html()
                , resize: function(file) {
                    var info = { srcX: 0, srcY: 0, srcWidth: file.width, srcHeight: file.height }
                            , srcRatio = file.width / file.height
                            ;
                    if (file.height > this.options.thumbnailHeight || file.width > this.options.thumbnailWidth) {
                        info.trgHeight = this.options.thumbnailHeight;
                        info.trgWidth = info.trgHeight * srcRatio;
                        if (info.trgWidth > this.options.thumbnailWidth) {
                            info.trgWidth = this.options.thumbnailWidth;
                            info.trgHeight = info.trgWidth / srcRatio;
                        }
                    } else {
                        info.trgHeight = file.height;
                        info.trgWidth = file.width;
                    }
                    return info;
                }
            });

            $('.flexslider').flexslider({
                animation: "slide"
            });
        });
    </script>
</head>
<body data-spy="scroll" data-target="#navbar" data-offset="70">
<header id="home" class="masthead">
    <nav class="navbar navbar-fixed-top affix-top" data-spy="affix" data-offset-top="20" <%--style="background-image: url('http://agragregra.github.io/Brazzers-Carousel/img/hero-bg.jpg')"--%>>
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#"><%--<img class="logo" src="https://nicolargo.github.io/glances/public/images/glances.png" height="70">--%></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav navbar-center" style="height: 40px;">
                    <li><a href="#features">Features</a></li>
                    <li><a href="#get-started">Get started</a></li>
                    <li><a href="#community">Community</a></li>
                    <li><a href="#documentation">Documentation</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="col-xs-12 navterm"></div>
<div class="col-xs-12">
    <section id="features" class="slider flexslider" style="width: 100%;">
        <%--<div class="flexslider" style="width: 100%;">
            <ul class="slides" style="width: 100%;">
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-01.jpg" />
                    <p class="flex-caption">Adventurer Cheesecake Brownie</p>
                </li>
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" />
                    <p class="flex-caption">Adventurer Lemon</p>
                </li>
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-03.jpg" />
                    <p class="flex-caption">Adventurer Donut</p>
                </li>
            </ul>
        </div>--%>
            <ul class="slides" style="width: 100%;">
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-01.jpg" />
                    <p class="flex-caption">Adventurer Cheesecake Brownie</p>
                </li>
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" />
                    <p class="flex-caption">Adventurer Lemon</p>
                </li>
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-03.jpg" />
                    <p class="flex-caption">Adventurer Donut</p>
                </li>
            </ul>
    </section>
</div>
<ul>
    <li class="text-muted"><a href="${ctxRoot}/test.do" class="text-muted">test</a></li>
    <li class="text-muted"><a href="${ctxRoot}/home.do" class="text-muted">home</a>(sencha)</li>
    <li class="text-muted"><a href="${ctxRoot}/admin.do" class="text-muted">admin</a>(BackOffice 자동생성)</li>
    <li class="text-muted"><a href="${ctxRoot}/bootstrap.do" class="text-muted">bootstrap</a></li>
    <li class="text-muted"><a href="${ctxRoot}/menusample.do" class="text-muted">menusample</a></li>
    <li class="text-primary"><input id="shopID" name="shopID" size="10" value="hnews" placeholder="shopID"> <a href="#" onclick="document.location.href='${ctxRoot}/'+document.all.shopID.value+'/mobile.do';">/mobile(모바일)</a></li>
    <li class="text-muted"><a href="${ctxRoot}/joinsample.do" class="text-muted">joinsample</a>(가입)</li>
</ul>
<img src="https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=http://www.fcsoft.co.kr/impd/index.jsp&choe=">

<%--<div class="content">
    <section >
        <div class="container">
            <div class="row">

                <div class="col-xs-12">

                </div>
                &lt;%&ndash;<div class="col-xs-12 col-sm-9 col-sm-push-3">
                    <div class="slider slick-initialized slick-slider" role="toolbar">
                        <div aria-live="polite" class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 3198px; transform: translate3d(-1599px, 0px, 0px);" role="listbox"><img class="screenshot img-responsive slick-slide slick-cloned" src="public/images/grafana.png" alt="" data-slick-index="-1" aria-hidden="true" style="width: 533px;" tabindex="-1"><img class="screenshot img-responsive slick-slide" src="public/images/screenshot-wide.png" alt="" data-slick-index="0" aria-hidden="true" style="width: 533px;" tabindex="-1" role="option" aria-describedby="slick-slide00"><img class="screenshot img-responsive slick-slide" src="public/images/screenshot-web.png" alt="" data-slick-index="1" aria-hidden="true" style="width: 533px;" tabindex="-1" role="option" aria-describedby="slick-slide01"><img class="screenshot img-responsive slick-slide slick-current slick-active" src="public/images/screenshot-web2.png" alt="" data-slick-index="2" aria-hidden="false" style="width: 533px;" tabindex="0" role="option" aria-describedby="slick-slide02"><img class="screenshot img-responsive slick-slide" src="public/images/grafana.png" alt="" data-slick-index="3" aria-hidden="true" style="width: 533px;" tabindex="-1" role="option" aria-describedby="slick-slide03"><img class="screenshot img-responsive slick-slide slick-cloned" src="public/images/screenshot-wide.png" alt="" data-slick-index="4" aria-hidden="true" style="width: 533px;" tabindex="-1"></div></div>



                        <ul class="slick-dots" style="display: block;" role="tablist"><li class="" aria-hidden="true" role="presentation" aria-selected="true" aria-controls="navigation00" id="slick-slide00"><button type="button" data-role="none" role="button" aria-required="false" tabindex="0">1</button></li><li aria-hidden="true" role="presentation" aria-selected="false" aria-controls="navigation01" id="slick-slide01" class=""><button type="button" data-role="none" role="button" aria-required="false" tabindex="0">2</button></li><li aria-hidden="false" role="presentation" aria-selected="false" aria-controls="navigation02" id="slick-slide02" class="slick-active"><button type="button" data-role="none" role="button" aria-required="false" tabindex="0">3</button></li><li aria-hidden="true" role="presentation" aria-selected="false" aria-controls="navigation03" id="slick-slide03" class=""><button type="button" data-role="none" role="button" aria-required="false" tabindex="0">4</button></li></ul></div>
                </div>&ndash;%&gt;
                <div class="col-xs-12 col-sm-3 col-sm-pull-9">
                    <ul class="plugin-list list-unstyled">
                        <li>CPU</li>
                        <li>Memory</li>
                        <li>Load</li>
                        <li>Process list</li>
                        <li>Network interface</li>
                        <li>Disk I/O</li>
                        <li>Raid</li>
                        <li>Sensors</li>
                        <li>Filesystem</li>
                        <li>Docker</li>
                        <li>Monitor</li>
                        <li>Alert</li>
                        <li>System info</li>
                        <li>Uptime</li>
                        <li>Quicklook <span class="hidden-xs">(CPU, MEM, LOAD)</span></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <ul class="list-unstyled">
                    <li class="feature col-sm-6 col-lg-3">
                        <div class="feature-text">
                            <h3><span class="fa fa-cube" aria-hidden="true"></span>&nbsp;Cross-platform</h3>
                            <p>
                                Written in Python, Glances will run on almost any plaftorm : GNU/Linux, FreeBSD, OS X and Windows.
                            </p>
                        </div>
                    </li>
                    <li class="feature col-sm-6 col-lg-3">
                        <div class="feature-text">
                            <h3><span class="fa fa-cogs" aria-hidden="true"></span>&nbsp;API</h3>
                            <p>
                                Glances includes a XML-RPC server and a RESTFUL-JSON API which can be used by another client software.
                            </p>
                        </div>
                    </li>
                    <li class="feature col-sm-6 col-lg-3">
                        <div class="feature-text">
                            <h3><span class="fa fa-globe" aria-hidden="true"></span>&nbsp;Web UI</h3>
                            <p>
                                No terminal at hand ? Use the built-in Web UI and monitor your system from any device.
                            </p>
                        </div>
                    </li>
                    <li class="feature col-sm-6 col-lg-3">
                        <div class="feature-text">
                            <h3><span class="fa fa-upload" aria-hidden="true"></span>&nbsp;Export</h3>
                            <p>
                                Export all system statistics to csv, StatsD, InfluxDB or even RabbitMQ. Glances also provides a dedicated Grafana dashboard.
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <section id="get-started">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h2>Get started</h2>

                    <h3>Glances Auto Install script</h3>

                    <p>To install the latest Glances production ready version, just enter the following command line:</p>

                    <pre>$ curl -L http://bit.ly/glances | /bin/bash</pre>

                    <p>or</p>

                    <pre>$ wget -O- http://bit.ly/glances | /bin/bash</pre>
                    <p>Note: Only supported on some GNU/Linux distributions.</p>

                    <h3>PyPI: The simple way</h3>

                    <p>Glances is on PyPI. By using PyPI, you are sure to have the latest stable version.</p>

                    <p>To install, simply use pip:</p>

                    <pre>$ pip install glances</pre>
                </div>
            </div>
        </div>
    </section>
    <section id="community">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h2>Community</h2>
                    <p class="head">
                        Get help from others users or from the Glances developers and stay in touch with us. But never forget : always RTFM!
                    </p>
                    <ul class="row list-inline text-center">
                        <li class="col-xs-6 col-sm-4">
                            <a class="link-round" href="https://gitter.im/nicolargo/glances">
                                <span class="fa fa-comments round" aria-hidden="true"></span>
                                <h3>Chat for developers</h3>
                            </a>
                        </li>
                        <li class="col-xs-6 col-sm-4">
                            <a class="link-round" href="https://groups.google.com/forum/?hl=en#!forum/glances-users">
                                <span class="fa fa-envelope round" aria-hidden="true"></span>
                                <h3>Users' mailing list</h3>
                            </a>
                        </li>
                        <li class="col-xs-12 col-sm-4">
                            <a class="link-round" href="https://twitter.com/nicolargo">
                                <span class="fa fa-twitter round" aria-hidden="true"></span>
                                <h3>Twitter</h3>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section id="documentation">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h2>Documentation</h2>
                    <p class="head">
                        You want more informations or contribute to the Glances project ? Look at our user manual and the development wiki.
                    </p>
                    <ul class="row list-inline text-center">
                        <li class="col-xs-6">
                            <a class="link-round" href="http://glances.readthedocs.org/en/latest/glances-doc.html">
                                <span class="fa fa-book" aria-hidden="true"></span>
                                <h3>Read the doc</h3>
                            </a>
                        </li>
                        <li class="col-xs-6">
                            <a class="link-round" href="https://github.com/nicolargo/glances/wiki">
                                <span class="fa fa-file-text-o round" aria-hidden="true"></span>
                                <h3>Wiki</h3>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</div>--%>
</body>
</html>