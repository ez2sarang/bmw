/**
 * Created by ez2sarang on 2016. 12. 3..
 */
$('body').on('click', '.cg-example-show-code', function() {
    var source = $(this).data('cg-example-source');
    var $pre   = $('<div class="clearfix"></div><pre><code class="html"></code></pre>');
    var $code  = $pre.find('code');

    $code
        .html(_highlightSource('html', source, $(this).parents('.panel').find('.cg-example').attr('data-accent')).replace(/cg\-generated/g, _curColorName))
        .addClass('hljs html xml');

    var $modal = $(
        '<div class="modal fade cg-example-modal" tabindex="-1" role="dialog">' +
        ' <div class="modal-dialog" role="document">' +
        '   <div class="modal-content">' +
        '     <div class="modal-body"></div>' +
        '   </div>' +
        ' </div>' +
        '</div>'
    );

    $modal.find('.modal-body').append($pre);

    $modal
        .on('hidden.bs.modal', function() { $(this).remove(); })
        .modal();
});

function accordionList(msg) {
    var sHTML = '<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">';

    for(var n in msg.resultList) {
        var image;
        if(isEmpty(msg.resultList[n], true) ||
            isEmpty(msg.resultList[n].fileGroup, true) ||
            isEmpty(msg.resultList[n].fileGroup.fileItemList[0], true) ||
            'null' == msg.resultList[n].fileGroup.fileItemList[0].id) {
            image = 0;
        } else {
            image = msg.resultList[n].fileGroup.fileItemList[0].id;
        }
        console.log(image);
        sHTML+='<div class="panel panel-default">';
        sHTML+=String.format('<div class="panel-heading" role="tab" id="heading{0}">',n);
        sHTML+='<h4 class="panel-title">';
        sHTML+=String.format('<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse{0}" aria-expanded="true" aria-controls="collapse{1}">{2}{3}</a>', n, n, String.format('<!--<img src="{0}/getFileItem/{1}.do" style="width:200px;"/><br/>-->', ctxRoot, image),msg.resultList[n].name);
        sHTML+='</h4>';
        sHTML+='</div>';
        sHTML+=String.format('<div id="collapse{0}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading{1}">', n, n);
        sHTML+=String.format('<div class="panel-body">{0}{1}</div>', String.format('<img src="{0}/getFileItem/{1}.do" style="width:200px;"/><br/>', ctxRoot, image), msg.resultList[n].description);
        sHTML+='</div>';
        sHTML+='</div>';
    }
    sHTML+='</div>';
    return sHTML;
}

function alertWindow(title, context, callback) {
    var buttonsData = {
        default: {
            label: 'Close'
            , className: 'btn-default btn'
            , callback: function () {
            }
        }
    };
    try {
        if(callback) {
            buttonsData.main = {
                label: 'OK'
                , className: 'btn-primary btn'
                , callback: callback
            };
        }
    } catch(e) {
        console.log(e);
    }
    return bootbox.dialog({
        title: title
        , message: context
        , className: 'bootbox-lg'
        , buttons: buttonsData
        , backdrop: true
    });
}

function alertConfirm(title, context, callback) {
    bootbox.confirm({
        title: title
        , message: context
        , className: 'bootbox-sm'
        , callback: function (result) {
            callback(result);
        }
    });
}
function alertPrompt(title, callback) {
    bootbox.prompt({
        title: title
        , callback: function(result){
            callback(result);
        }
    });
}

function alertSuccess(title, context, callback) {
    showModal('success', title, context, callback);
}
function alertDanger(title, context, callback) {
    showModal('danger', title, context, callback);
}
function alertWarning(title, context, callback) {
    showModal('warning', title, context, callback);
}
function alertInfo(title, context, callback) {
    showModal('info', title, context, callback);
}
function showModal(type, title, context, callback) {
    $('#modalState-'+type+' .modal-title').html(title);
    $('#modalState-'+type+' .modal-body').html(context);
    $('#modalState-'+type).modal('show');
    if(callback) {
        $('#modalState-'+type).off('hidden.bs.modal').on('hidden.bs.modal', callback);
    }
    $('#modalState-'+type).appendTo('body');
}

function datatableErrorHandling(xhr, nestUrl)
{
    if (xhr.status == 401) {
        alertWarning('Fail', '401 권한 없음<br>재 로그인이 필요합니다.', function() {
            $(location).attr('href', nestUrl);
        });
    } else if (xhr.status == 403) {
        alertWarning('Fail', '403 서버가 요청을 거부<br>재 로그인 후 다시 시도하세요.', function() {
            $(location).attr('href', nestUrl);
        });
    } else {
        alertWarning("","예외가 발생했습니다. 관리자에게 문의하세요.");
    }
}

function formSubmit(submitUrl, successCode, errorCodeList, headerName, token, id) {
    $(".btn").css("cursor","wait");
    $(".btn").prop("disabled", true);

    //jQuery id exist check
    //alert($('#dropzonejs').length+"-"+$('#dropzonejs .dz-preview').length);
    try{
        alert(myDropzone.getAcceptedFiles().length);
    }catch(e){
        console.log(e);
    }
    if($('#dropzonejs').length) {
        try{
            //alert("preview="+$('#dropzonejs .dz-preview').length);
            if($('#dropzonejs .dz-preview').length && $('#dropzonejs .dz-preview').length > 0) {

            } else {
                //실패
                //alert('파일 업로드 필요');
                //return;
            }
        }catch(e){
            alerts(e);
        }
    }

    if($('#entity-form').valid())
    {
        spinner = new Spinner(opts).spin($('#spinner').get(0));
        var result = false;
        $.ajax({
            type: "POST"
            , url: ctxRoot+submitUrl
            , data: $('form#entity-form').serialize()
            , async: false//비동기식으로 했을경우 result값을 세팅할 수 없다.
            , cache: false
//                , contentType: false//사용중지
            , processData: false
            , beforeSend: function (xhr) {
                xhr.setRequestHeader(headerName, token);
            }
            , success: function (data, textStatus, jqXHR) {
                try{
                    if (data == successCode) {
                        result = true;
                        alertSuccess('Success', findCodeMessage(errorCodeList, successCode), function(){
                            table.draw(true);
                            if(!isEmpty(id)) {
                                viewDetail(id);
                            }
                        });
                    } else {
                        result = false;
                        alertWarning('Fail', findCodeMessage(errorCodeList, data), function(){
                        });
                    }
                } catch(e) {
                    console.log(e);
                } finally {
                    spinner.stop();
                    $(".btn").css("cursor","default");
                    $(".btn").prop("disabled", false);
                }
            }
            , error: function (jqXHR, textStatus, errorThrown) {
                result = false;
                try {
                    var msg = "Sorry but there was an error: " + jqXHR.status + " " + jqXHR.statusText;
                    alertWarning('Fail', msg + "<br>" + textStatus + "<br>" + errorThrown);
                } catch (e) {
                    console.log(e);
                } finally {
                    spinner.stop();
                    $(".btn").css("cursor","default");
                    $(".btn").prop("disabled", false);
                }
            }
        });
        return result;
    } else {
        alertDanger("", "입력항목 오류");
        $(".btn").css("cursor","default");
        $(".btn").prop("disabled", false);
        return false;
    }
}

function findCodeMessage(reference, code) {
    try{
        for(var idx in reference) {
            if(code == reference[idx][Object.keys(reference[idx])]) {
                return Object.keys(reference[idx]);
            }
        }
    } catch(e) {
        return e;
    }
}

function handleDragEnter(e) {
    this.classList.add('drag-over');
}
function handleDragLeave(e) {
    this.classList.remove('drag-over');
}
function showInformationDialog(files, objectArray) {
    var responseContent = "";
    for (var i = 0; i < objectArray.length; i++) {
        var infoObject = objectArray[i];
        for ( var infoKey in infoObject) {
            if (infoObject.hasOwnProperty(infoKey)) {
                responseContent = responseContent + " " + infoKey + " -> " + infoObject[infoKey] + "<br>";
            }
        }
        responseContent = responseContent + "<hr>";
    }
    // from the library bootstrap-dialog.min.js
    BootstrapDialog.show({
        title : '<b>Server Response</b>',
        message : responseContent
    });
}

var mockFileList = [];
var myDropzone;
function displayDropzone() {
    try{
        myDropzone = new Dropzone("div#dropzonejs", {
        //$("#dropzonejs").dropzone({
            url: String.format("{0}/upload.do", ctxRoot)
            , paramName: "fileData" // The name that will be used to transfer the file
            , headers : {'X-CSRF-TOKEN': $('meta[name=_csrf]').attr('content')}
            , maxFilesize: 2000 // MB
            , acceptedFiles: "image/*,video/*" //"application/pdf,.psd"
            , autoProcessQueue: false
            , uploadMultiple: true
            , addRemoveLinks: true
            , dictDefaultMessage: "Drop files here to upload!"
            , dictResponseError: "Can't upload file!"
            , removedfile: function(file) {
                alert("File " + file.name + "removed");
                $.ajax({
                    type: 'post',
                    url: 'pic_delete.jsp?id=' + file.name,
                    cache: false,
                    success: function (data) {

                    }
                });
                var _ref;
                try {
                    return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                } catch(e) {
                    console.log(e);
                }
                alert('fail');
                return false;
            }
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
            //that gets called when Dropzone is initialized.
            , init: function () {

                var myDropzone = this;

                // first set autoProcessQueue = false
                $('#upload-button').on("click", function (e) {

                    myDropzone.processQueue();
                });

                // customizing the default progress bar
                this.on("uploadprogress", function (file, progress) {

                    progress = parseFloat(progress).toFixed(0);

                    var progressBar = file.previewElement.getElementsByClassName("dz-upload")[0];
                    progressBar.innerHTML = progress + "%";
                });

                // displaying the uploaded files information in a Bootstrap dialog
                this.on("successmultiple", function (files, serverResponse) {
                    showInformationDialog(files, serverResponse);
                });

                for(var idx in mockFileList) {
                    // Call the default addedfile event handler
                    var mockFile = {name:mockFileList[idx]["id"], size:mockFileList[idx]["size"]};
                    this.emit("addedfile", mockFile);
                    // And optionally show the thumbnail of the file:
                    this.emit("thumbnail", mockFile, "/impd/get/"+mockFileList[idx]["id"]);
                    this.emit("complete", mockFile);
                    this.files.push(mockFile);
                }
            }
            , uploadFiles: function(files) {
                var minSteps         = 6;
                var maxSteps         = 60;
                var timeBetweenSteps = 100;
                var bytesPerStep     = 100000;
                var isUploadSuccess  = Math.round(Math.random());

                var self = this;

                for (var i = 0; i < files.length; i++) {

                    var file = files[i];
                    var totalSteps = Math.round(Math.min(maxSteps, Math.max(minSteps, file.size / bytesPerStep)));

                    for (var step = 0; step < totalSteps; step++) {
                        var duration = timeBetweenSteps * (step + 1);

                        setTimeout(function(file, totalSteps, step) {
                            return function() {
                                file.upload = {
                                    progress: 100 * (step + 1) / totalSteps,
                                    total: file.size,
                                    bytesSent: (step + 1) * file.size / totalSteps
                                };

                                self.emit('uploadprogress', file, file.upload.progress, file.upload.bytesSent);
                                if (file.upload.progress == 100) {

                                    if (isUploadSuccess) {
                                        file.status =  Dropzone.SUCCESS;
                                        self.emit('success', file, 'success', null);
                                    } else {
                                        file.status =  Dropzone.ERROR;
                                        self.emit('error', file, 'Some upload error', null);
                                    }

                                    self.emit('complete', file);
                                    self.processQueue();
                                }
                            };
                        }(file, totalSteps, step), duration);
                    }
                }
            }
        });
    } catch(e) {
      console.log(e);
    }
}


/*$('#dropzonejs').dropzone({
 parallelUploads: 2,
 maxFilesize:     50000,
 filesizeBase:    1000,
 url:"upload.do",

 resize: function(file) {
 return {
 srcX:      0,
 srcY:      0,
 srcWidth:  file.width,
 srcHeight: file.height,
 trgWidth:  file.width,
 trgHeight: file.height,
 };
 }
 });*/

/*$("#dropzonejs").dropzone({
 url: String.format("{0}/upload.do?sessionToken={1}&txToken={2}", ctxRoot, sessionToken, transactionToken)
 , paramName: "fileData" // The name that will be used to transfer the file
 , maxFilesize: 2000 // MB
 , acceptedFiles: "image/!*,media/!*" //"application/pdf,.psd"
 //, accept: function (file, done) {alert(stringify(file));}
 , addRemoveLinks: true
 , dictDefaultMessage: "Drop files here to upload!"
 , dictResponseError: "Can't upload file!"
 , autoProcessQueue: false
 , thumbnailWidth: 138
 , thumbnailHeight: 120
 //, previewTemplate: '<div class="dz-preview dz-file-preview"><div class="dz-details"><div class="dz-filename"><span data-dz-name></span></div><div class="dz-size">File size: <span data-dz-size></span></div><div class="dz-thumbnail-wrapper"><div class="dz-thumbnail"><img data-dz-thumbnail><span class="dz-nopreview">No preview</span><div class="dz-success-mark"><i class="fa fa-check-circle-o"></i></div><div class="dz-error-mark"><i class="fa fa-times-circle-o"></i></div><div class="dz-error-message"><span data-dz-errormessage></span></div></div></div></div><div class="progress progress-striped active"><div class="progress-bar progress-bar-success" data-dz-uploadprogress></div></div></div>'
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
 });*/


/*// Mock the file upload progress (only for the demo)
 //
 Dropzone.prototype.uploadFiles = function(files) {
 var minSteps         = 6;
 var maxSteps         = 60;
 var timeBetweenSteps = 100;
 var bytesPerStep     = 100000;
 var isUploadSuccess  = Math.round(Math.random());

 var self = this;

 for (var i = 0; i < files.length; i++) {

 var file = files[i];
 var totalSteps = Math.round(Math.min(maxSteps, Math.max(minSteps, file.size / bytesPerStep)));

 for (var step = 0; step < totalSteps; step++) {
 var duration = timeBetweenSteps * (step + 1);

 setTimeout(function(file, totalSteps, step) {
 return function() {
 file.upload = {
 progress: 100 * (step + 1) / totalSteps,
 total: file.size,
 bytesSent: (step + 1) * file.size / totalSteps
 };

 self.emit('uploadprogress', file, file.upload.progress, file.upload.bytesSent);
 if (file.upload.progress == 100) {

 if (isUploadSuccess) {
 file.status =  Dropzone.SUCCESS;
 self.emit('success', file, 'success', null);
 } else {
 file.status =  Dropzone.ERROR;
 self.emit('error', file, 'Some upload error', null);
 }

 self.emit('complete', file);
 self.processQueue();
 }
 };
 }(file, totalSteps, step), duration);
 }
 }
 };*/

var validateMethod = $.fn.validate;
$.fn.validate = function (o) {
    if (o && o.rules) {
        for (var name in o.rules) {
            var rule = o.rules[name];
            if (rule.required == true) {
                var label = $("label[for='" + name + "']");
                label.text(label.text() + "(*)");
            }
        }
    }
    return $.proxy(validateMethod, this)(o);
};