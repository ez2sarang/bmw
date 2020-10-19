<%@ page contentType="text/html;charset=UTF-8" language="java"
        %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
        %>
<c:set var="ctxRoot" value="${pageContext.request.contextPath}"/><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>Document</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker3.standalone.css"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctxRoot}/style/impd.css">
    <script src="//code.jquery.com/jquery-2.1.4.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.kr.min.js"></script>
    <script src="${ctxRoot}/assets/external/js/jquery.form.js"></script>
    <script src="${ctxRoot}/assets/external/js/dropzone.js"></script>
    <script src="${ctxRoot}/js/impd.js"></script>
    <script>
        ctxRoot = '${ctxRoot}';
        var links;
        $(document).ready(function () {
            $('.datepicker').datepicker({});
            $("#dropzonejs-example").dropzone({
                url: "${ctxRoot}/upload.do"
                , paramName: "fileData" // The name that will be used to transfer the file
                , maxFilesize: 2000 // MB
                , acceptedFiles: "image/*,media/*" //"image/*,application/pdf,.psd"
                /*, accept: function (file, done) {
                    alert(stringify(file));
                }*/
                , addRemoveLinks: true
                , dictDefaultMessage: "Drop files here to upload!"
                , dictResponseError: "Can't upload file!"
                , autoProcessQueue: true
                , thumbnailWidth: 138
                , thumbnailHeight: 120
                , previewTemplate: '<div class="dz-preview dz-file-preview"><div class="dz-details"><div class="dz-filename"><span data-dz-name></span></div><div class="dz-size">File size: <span data-dz-size></span></div><div class="dz-thumbnail-wrapper"><div class="dz-thumbnail"><img data-dz-thumbnail><span class="dz-nopreview">No preview</span><div class="dz-success-mark"><i class="fa fa-check-circle-o"></i></div><div class="dz-error-mark"><i class="fa fa-times-circle-o"></i></div><div class="dz-error-message"><span data-dz-errormessage></span></div></div></div></div><div class="progress progress-striped active"><div class="progress-bar progress-bar-success" data-dz-uploadprogress></div></div></div>'
                , resize: function (file) {
                    var info = {srcX: 0, srcY: 0, srcWidth: file.width, srcHeight: file.height}
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

            $('form#apiForm').ajaxSubmit({
                url: ctxRoot + "/resource.do"
                , complete: function (xhr) {
//                    alert(xhr.responseText);
                    var msg = JSON.parse(xhr.responseText);
                    links = msg;
                    for (var idx in msg) {
                        $("#menuList").append(
                                $('<li class="list-group-item">').append(
                                        $('<a href="#">')
                                                .bind("click", {
                                                    link: msg[idx].link,
                                                    components: msg[idx].components
                                                }, function (e) {
                                                    try {
                                                        setForm(this, e.data.link, e.data.components);
                                                    } catch (e) {
                                                        alert("Error:" + e);
                                                    }
                                                })
                                                .append("" == msg[idx].title ? msg[idx].link : msg[idx].title)
                                )
                        );
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="breadcrumb breadcrumb-page">
    <li class="active">Server (ver.1.0.0)</li>
</ul>
<div class="row">
    <div class="col-md-2" style="overflow-x: auto; height: 400px; border: 1px">
        <ul id="menuList" class="list-group">
        </ul>
    </div>
    <div class="col-md-10" style="overflow-x: auto; border: 1px">
        <div class="panel colourable">
            <div class="panel-heading">
                <%--<textarea id="result" rows="6" class="form-control"></textarea>--%>
                <div class="up-progress">
                    <div class="bar"></div>
                    <div class="percent">0%</div>
                </div>
                <div id="status"></div>
                <%--<div class="dz-preview dz-file-preview">
                    <div class="dz-details">
                        <div class="dz-filename"><span data-dz-name></span></div>
                        <div class="dz-size" data-dz-size></div>
                        <img data-dz-thumbnail />
                    </div>
                    <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress></span></div>
                    <div class="dz-success-mark"><span>✔</span></div>
                    <div class="dz-error-mark"><span>✘</span></div>
                    <div class="dz-error-message"><span data-dz-errormessage></span></div>
                </div>--%>
            </div>
            <div id="formArea" class="panel-body">
                <form id="apiForm">
                </form>
            </div>
            <div class="panel-footer">
                <button class="btn btn-default btn-sm active" onclick="callApi(apiUrl)">전송</button>
            </div>
        </div>
        <form action="/ziminnav/upload.do" method="post" enctype="multipart/form-data">
            <div class="panel">
                <div class="panel-heading">
                    <span class="panel-title">Dropzone.js file uploads</span>
                </div>
                <div class="panel-body">
                    <div class="note note-info">More info and examples at <a href="http://www.dropzonejs.com"
                                                                             target="_blank">http://www.dropzonejs.com</a>
                    </div>

                    <div id="dropzonejs-example" class="dropzone-box">
                        <div class="dz-default dz-message">
                            <i class="glyphicon glyphicon-cloud-upload"></i>
                            Drop files in here<br><span class="dz-text-small">or click to pick manually</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fallback">
                <input type="file" name="fileData" multiple=""/>
            </div>
            <button>submit</button>
        </form>
    </div>
</div>
</body>
</html>