<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>Document</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker3.standalone.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
    <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.kr.min.js"></script>
    <script src="${ctxRoot}/assets/external/js/jquery.form.js"></script>
    <script src="${ctxRoot}/assets/external/js/dropzone.js"></script>
    <script>
        function callApi(url) {
            try{
                var bar = $('.bar');
                var percent = $('.percent');
                var status = $('#status');
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
                    url: "http://172.16.33.79:8080/updateCopyContent?locationId=1234123&filename=play.mp3"
                    , type: "post"
                    , beforeSend: function() {
                        status.empty();
                        var percentVal = '0%';
                        bar.width(percentVal)
                        percent.html(percentVal);
                    },
                    uploadProgress: function(event, position, total, percentComplete) {
                        var percentVal = percentComplete + '%';
                        bar.width(percentVal)
                        percent.html(percentVal);
                        //console.log(percentVal, position, total);
                    },
                    success: function() {
                        var percentVal = '100%';
                        bar.width(percentVal)
                        percent.html(percentVal);
                    },
                    complete: function(xhr) {
//                        status.html(xhr.responseText);
                        try {
                        var msg = xhr.responseText;
//                        var msg = JSON.parse(xhr.responseText);
//                            alert(xhr.toString());
                            $("#status").val(msg);
                        } catch (e) {
                            alert("error callApi:"+e);
                        }
                    }
                });
            }catch(e){alert("error:"+ new Error(e).lineNumber +"\n"+ e.stack);}
        }


        var links;
        $(document).ready(function() {
            for(var i=0;i<6;i++) {
                callApi();
            }
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
                <div class="up-progress">
                    <div class="bar"></div>
                    <div class="percent">0%</div>
                </div>
                <div id="status"></div>
            </div>
            <div id="formArea" class="panel-body">
                <form id="apiForm">
                </form>
            </div>
            <div class="panel-footer">
                <button class="btn btn-default btn-sm active" onclick="callApi(0)">전송</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>