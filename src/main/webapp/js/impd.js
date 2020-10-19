/**
 * Created by ez2sarang on 2015. 7. 6..
 */
var sessionToken = '';
var transactionToken = '';
var apiUrl = '';
var ctxRoot = '';
function setForm(link, url, dataIds) {
    //$(link).closest('ul').find('li').removeClass('list-group-item-info');
    //$(link).closest('li').addClass('list-group-item-info');
    var valid = makeValidateData(dataIds);
    try {
        //alerts(valid);
        //$('form#apiForm').attr("enctype","");
        //$('form#apiForm').attr("action", ctxRoot+url+".do");
        apiUrl = url;
        $("#apiForm").html("");
        $("#apiForm").append($("<input type='hidden' id='sessionToken' name='sessionToken'>").val(sessionToken));
        $("#apiForm").append($("<input type='hidden' id='transactionToken' name='transactionToken'>").val(transactionToken));
        var form = $("<ul>");
        for(var i in dataIds) {
            //form.append($("<li>").text(dataIds[i]+" : ").append(getForm(params[dataIds[i]])));
            form.append($("<li"+('hidden'==dataIds[i].type?" style='display:none'":"")+">").text(dataIds[i].label+" : ").append(getForm(dataIds[i])));
        }
        $("#apiForm").append(form);
        if(!isEmpty(valid, true)) {
            $("#apiForm").validate(valid);
        }

        $("#dropzonejs").dropzone({
            url: String.format("{0}/upload.do?sessionToken={1}&txToken={2}", ctxRoot, sessionToken, transactionToken)
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
    } catch (e) {
        console.log("error at setForm:"+e);
    }
    /*$('.datepicker').datepicker({
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
    });*/
}
function getForm(tag) {
    if(tag.type == 'input') {
        input = $("<input type='text' name='"+tag.name+"'>");
        if(tag.value != undefined || tag.value != "") {
            input.val(tag.value);
        }
        return input;
    }
    if(tag.type == 'textarea') {
        input = $("<textarea name='"+tag.name+"'>");
        if(tag.value != undefined || tag.value != "") {
            input.val(tag.value);
        }
        return input;
    }
    if(tag.type == 'password') {
        input = $("<input type='password' name='"+tag.name+"'>");
        if(tag.value != undefined || tag.value != "") {
            input.val(tag.value);
        }
        return input;
    }
    if(tag.type == 'hidden') {
        input = $("<input type='hidden' name='"+tag.name+"'>");
        if(tag.value != undefined || tag.value != "") {
            input.val(tag.value);
        }
        return input;
    }
    if(tag.type == 'select') {
        select = $("<select name='"+tag.name+"'>");
        for(var pos in tag.options) {
            select.append($("<option value='"+tag.options[pos].split(":")[0]+"'"+(tag.value==new String(pos)||tag.value==tag.options[pos].split(":")[0]?" selected":"")+">").text(tag.options[pos].split(":")[1]));
        }
        return select;
    }
    if(tag.type == 'radio') {
        radio = $("<span>");
        for(var pos in tag.options) {
            radio.append(tag.options[pos].split(":")[1]+" : ");
            radio.append($("<input type='radio' name='"+tag.name+"' value='"+tag.options[pos].split(":")[0]+"'"+(tag.value==pos||tag.value==tag.options[pos].split(":")[0]?" checked":"")+">"));
            radio.append("  ");
        }
        return radio;
    }
    if(tag.type == 'checkbox') {
        check = $("<span>");
        for(var pos in tag.options) {
            check.append(tag.options[pos].split(":")[1]+" : ");
            check.append($("<input type='checkbox' name='"+tag.name+"' value='"+tag.options[pos].split(":")[0]+"'"+(tag.value==pos?" checked":"")+">"));
            check.append("  ");
        }
        return check;
    }
    if(tag.type == 'date') {
        date = $("<input name='"+tag.name+"' class='datepicker'"+(tag.format?" data-date-format='"+tag.format+"'":"")+">");
        if(tag.value != undefined || tag.value != "") {
            input.val(tag.value);
        }
        return date;
    }
    if(tag.type == 'file') {
        //file = $("<input type='file' name='"+tag.name+"'"+(tag.options?" "+tag.options:"")+">");
        file = $("<div id='dropzonejs' class='dropzone-box'>").append(
            $("<div class='dz-default dz-message'>")
                .html("<i class='glyphicon glyphicon-cloud-upload'></i>파일찾기<br><span class='dz-text-small'>사진첩 및 카메라를 이용하세요.</span><br>")
        );
        return file;
    }
}

function apiValidation() {
    $('#apiForm').validate({
        rules: {
        },
        success: function(label) {
            label.addClass("valid");
        },
        submitHandler: function() {

        }
    });
}

function sessionValidate() {
    var empty = false;
    var emptyName = "";
    $('#apiForm input').each(function(){
        if(isEmpty(this.value) && (this.name == 'sessionToken' || this.name == 'transactionToken')) {
            empty = true;
            emptyName = this.name;
        }
    });
    if(empty) {
        alert(emptyName);
        return;
    }
}

function callApi(url) {
    try{
        var bar = $('.bar');
        var percent = $('.percent');
        var status = $('#status');
        //apiValidation();

        //jQuery id exist check
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

        if(!$('form#apiForm').valid()) {
            alert('실패');
            return;
        }
        $('form#apiForm').ajaxSubmit({
//            target:        '#output2',   // target element(s) to be updated with server response
//            beforeSubmit:  showRequest,  // pre-submit callback
//            success:       showResponse  // post-submit callback
            // other available options:
            //url:       url         // override for form's 'action' attribute
            //type:      type        // 'get' or 'post', override for form's 'method' attribute
            //dataType:  null        // 'xml', 'script', or 'json' (expected server response type)
            //clearForm: true        // clear all form fields after successful submit
            //resetForm: true        // reset the form after successful submit

            // $.ajax options can be used here too, for example:
            //timeout:   3000
            url: ctxRoot+url+".do"
            , type: "post"
            , beforeSend: function() {
                status.empty();
                var percentVal = '0%';
                bar.width(percentVal)
                percent.html(percentVal);
            },
            uploadProgress: function(event, position, total, percentComplete) {
                try {
                    var percentVal = percentComplete + '%';
                    bar.width(percentVal)
                    percent.html(percentVal);
                } catch (e) {
                    alert(e);
                }
                //console.log(percentVal, position, total);
            },
            success: function() {
                var percentVal = '100%';
                bar.width(percentVal)
                percent.html(percentVal);
            },
            complete: function(xhr) {
                status.html(xhr.responseText);
                var msg = JSON.parse(xhr.responseText);
                alert("카카:\n"+stringify(msg));
                try {
                    if(msg.transactionToken != undefined && msg.transactionToken != "") {
                        transactionToken = msg.transactionToken;
                        $("#transactionToken").val(transactionToken);
                    }
                    if(msg.sessionToken != undefined && msg.sessionToken != "") {
                        sessionToken = msg.sessionToken;
                        $("#sessionToken").val(sessionToken);
                    }
                    menuBar.showMenu();
                } catch (e) {
                    alert("error callApi:"+e);
                }
            }
        });
    }catch(e){alert("error:"+ new Error(e).lineNumber +"\n"+ e.stack);}
}

function makeValidateData(components) {
    var rules = {};
    var messages = {};
    for(n in components) {
        if(!isEmpty(components[n].rules, true)) {
            console.log(n+"="+stringify(components[n].rules));
            if(components[n].rules.length == 1) {
                if('required' == components[n].rules[0].split(":")[0]) {
                    rules[components[n].name] = 'required';
                } else {
                    rules[components[n].name] = {};
                    rules[components[n].name][components[n].rules[0].split(":")[0]] = components[n].rules[0].split(":")[1];
                }
                if(!isEmpty(components[n].messages.required)) {
                    messages[components[n].name] = components[n].messages.required;
                } else {
                    if(!isEmpty(components[n].messages, true)) {
                        messages[components[n].name] = components[n].messages;
                    }
                }
            } else {
                for(m in components[n].rules) {
                    if(!rules[components[n].name]) {
                        rules[components[n].name] = {};
                        console.log("rules 이름 생성:"+components[n].name);
                    }
                    rules[components[n].name][components[n].rules[m].split(":")[0]] = eval(components[n].rules[m].split(":")[1]);
                    if(!isEmpty(components[n].messages, true)) {
                        messages[components[n].name] = components[n].messages;
                    }
                }
            }
        }
    }
    if(!isEmpty(rules, true) && !isEmpty(messages, true)) {
        return {
            "rules": rules
            , "messages": messages
            //, errorClass: "validation-error"
            //, validClass: "impd-valid-class"
            , success: function (label) {
                label.addClass("valid");
            }
        };
    } else if(!isEmpty(rules, true)) {
        return {
            "rules": rules
            //, errorClass: "validation-error"
            //, validClass: "impd-valid-class"
            , success: function (label) {
                label.addClass("valid");
            }
        };
    } else {
        return {};
    }
}

function drawMenu(id, data, icon) {
    $(id).append(
        $('<ul>').append(
            $('<li class="listWrap">').append(
                $('<a href="javascript:">')
                    .bind("click", {
                        link: data.link,
                        components: data.components
                    }, function (e) {
                        try {
                            if(e.data.link !='/login' && isEmpty(transactionToken)) {
                                alert('로그인 후 이용바랍니다.');
                                return;
                            }
                            menuBar.showInput();
                            setForm(this, e.data.link, e.data.components);
                        } catch (e) {
                            alert("Error:" + e);
                        }
                    })
                    .append($('<i class="fa fa-'+icon+'">'))
                    .append("" == data.title ? data.link : data.title)
            )
        )
    );
}

function progressHandlingFunction(e){
    if(e.lengthComputable){
        $('progress').attr({value:e.loaded,max:e.total});
    }
}

/**
 * 인자값을 타입형태의 문자로 리턴한다.
 * @param obj
 * @returns examples:
 - typeOf(); //undefined
 - typeOf(null); //null
 - typeOf(NaN); //number
 - typeOf(5); //number
 - typeOf({}); //object
 - typeOf([]); //array
 - typeOf(''); //string
 - typeOf(function () {}); //function
 - typeOf(/a/) //regexp
 */
function typeOf(obj) {
    return {}.toString.call(obj).split(' ')[1].slice(0, -1).toLowerCase();
}

/**
 * Object는 undefined null
 * 숫자는 NaN
 * 문자는 빈값을 체크한다.
 *
 * ( value != null && typeof value == "object" && !Object.keys(value).length ) => [], {} 도 빈값으로 처리할 경우
 * @param val
 * @param isIncludeObjects object도 포함
 * @returns {boolean}
 */
function isEmpty(val, isIncludeObjects) {
    switch (typeOf(val)) {
        case 'undefined':
        case 'null':
            return true;
        case 'number':
            if (isNaN(val)) {
                return true;
            }
        case 'object':
            if(isIncludeObjects && !Object.keys(val).length) {
                return true;
            }
        default:
            break;
    }
    switch ($.trim(val)) {
        case "":
            return true;
        default:
            return false;
    }
}

function stringify(obj) {
    if ("JSON" in window) {
        return JSON.stringify(obj);
    }

    var t = typeof (obj);
    alert('t:'+t);
    if (t != "object" || obj === null) {
        // simple data type
        if (t == "string") obj = '"' + obj + '"';

        return String(obj);
    } else {
        // recurse array or object
        var n, v, json = [], arr = (obj && obj.constructor == Array);

        for (n in obj) {
            v = obj[n];
            t = typeof(v);
            if (obj.hasOwnProperty(n)) {
                if (t == "string") {
                    v = '"' + v + '"';
                } else if (t == "object" && v !== null) {
                    v = jQuery.stringify(v);
                }

                json.push((arr ? "" : '"' + n + '":') + String(v));
            }
        }

        return (arr ? "[" : "{") + String(json) + (arr ? "]" : "}");
    }
}

function alerts(obj) {
    alert(stringify(obj));
}

String.format = function( text )
{
    //check if there are two arguments in the arguments list
    if ( arguments.length <= 1 )
    {
        //if there are not 2 or more arguments there's nothing to replace
        //just return the original text
        return text;
    }
    if('array' == typeOf(arguments[1])) {
        return eval(String.format("String.format('{0}',", arguments[0])+String.format("'{0}')", arguments[1].join("','")));
    } else {
        //decrement to move to the second argument in the array
        var tokenCount = arguments.length - 2;
        for( var token = 0; token <= tokenCount; token++ )
        {
            //iterate through the tokens and replace their placeholders from the original text in order
            text = text.replace( new RegExp( "\\{" + token + "\\}", "gi" ), arguments[ token + 1 ] );
        }
        return text;
    }
};
/**
 *
 */
$.fn.gotoAnchor = function(anchor, idx) {
    if(idx>=0) {
        $(anchor).closest('ul').find('li').removeClass('active');
        $(anchor).closest('ul').find('li').eq(idx).addClass('active');
        swiper._slideTo(idx, 300);
    }
    /*
     $(this).closest('ul').find('li').removeClass('active');$(this).closest('ul').find('li').eq(idx).addClass('active');swiper._slideTo(idx, 300);
    */
}
/**
 *
 */
function gotoNavi(anchor, idx) {
    if(idx>=0) {
        $(anchor).closest('ul').find('li').removeClass('active');
        $(anchor).closest('ul').find('li').eq(idx).addClass('active');
        //console.log("==>"+$(anchor).closest('ul').find('li').eq(idx).text());//Home, style, coupon...
        swiper._slideTo(idx, 300);
    }
}

function showPage(url) {
    try {
        $('#modal-fullscreen').load(url, function (response, status, xhr) {
            try {
                if (status == 'success') {
                    $('#modal-fullscreen').modal('show');
                }
            } catch (e) {
                console.log(e);
                //$('#modal-fullscreen').trigger('show.bs.modal');
                //$('#modal-fullscreen').css("display", "");
                console.log($('#modal-fullscreen').html());
            }
        });
    } catch (e) {
        console.log(e);
    }
}