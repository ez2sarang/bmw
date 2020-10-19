<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 12. 15.
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%><html>
<head>
    <title>날쎈하</title>
    <style>
        #myCalendarContainer{
            width:50%;
            height:50%;
        }
        .row.no-gutter {
            margin-left: 0;
            margin-right: 0;
        }

        .row.no-gutter [class*='col-']:not(:first-child),
        .row.no-gutter [class*='col-']:not(:last-child) {
            padding-right: 0;
            padding-left: 0;
        }

        /* .modal-fullscreen */
        .modal-fullscreen {
            background: transparent;
        }
        .modal-fullscreen .modal-content {
            background: transparent;
            border: 0;
            -webkit-box-shadow: none;
            box-shadow: none;
        }
        .modal-backdrop.modal-backdrop-fullscreen {
            background: #ffffff;
        }
        .modal-backdrop.modal-backdrop-fullscreen.in {
            opacity: 1;
            filter: alpha(opacity=100);
        }

        /* .modal-fullscreen size: we use Bootstrap media query breakpoints */
        .modal-fullscreen .modal-dialog {
            margin: 0;
            margin-right: auto;
            margin-left: auto;
            width: 100%;
        }
        @media (min-width: 768px) {
            .modal-fullscreen .modal-dialog {
                width: 750px;
            }
        }
        @media (min-width: 992px) {
            .modal-fullscreen .modal-dialog {
                width: 970px;
            }
        }
        @media (min-width: 1200px) {
            .modal-fullscreen .modal-dialog {
                width: 1170px;
            }
        }
        .modal.fade:not(.in).left .modal-dialog {
            -webkit-transform: translate3d(-25%, 0, 0);
            transform: translate3d(-25%, 0, 0);
            fadeDuration: 10;
        }

        /**
        swiper
        */
        body {
            /*background: #eee;*/
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            /*color:#000;*/
            margin: 0;
            padding: 0;
        }
        .swiper-container {
            width: 100%;
            height: 100%;
            margin: 0px auto;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
        /*.swiper-wrapper {
            height:auto !important;
        }

        .swiper-slide {
            height:auto !important;
        }*/
        /*.swiper-wrapper {
            min-height: 100%;
        }

        .swiper-slide {
            height: auto !important;
        }*/
        /*.swiper-slide {
            text-align:center;
        }
        .swiper-slide img {
            width:auto;
            height:auto;
            max-width:100%;
            max-height:100%:
        }*/
    </style>
    <script src="${ctxRoot}/assets/kakao.js"></script>
    <script>
        var links;
        var swiper;
        function shareContent() {

        }
        <%--alert('${groupId}');--%>

        $(document).ready(function() {
            Kakao.init('196bdc8b4411d1e029f8cc97083ebb24');
            Kakao.Story.createShareButton({
                container: '#kakaostory-share-button',
                url: 'http://www.fcsoft.co.kr/impd/mobilesample.do',
                text: '이레이바\n염색시 알러지있으신 고객님 이레이바 보톡스 사용하면\n가려움 따가움 알러지 없어요\n아프리카에서 자생하는 쉐어밀크라는 나무에서 추출한\n쉐어버터를 케라틴보톡스에 함유하여 알러지 및 두피\n트러블 알러지 완벽 해결됩니다\n쉐어버터는 피부질환 치료제 및 아토피 질환 치료제로\n쓰이는 물질이며 염색약에 있는 PPD의독성 성분을\n중화시켜 염색시 두피트러블을 없애주는 물질입니다\n문의 ; 010.3776.3838\n https://www.facebook.com/photo.php?fbid=971395212942597&amp;set=a.106454332770027.14132.100002163836652&amp;type=3'
            });
            $('.flexslider').flexslider({
                animation: "slide"
            });
            $('#myCalendar').fullCalendar({
                weekends: true
//                , weekends: false
                , header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                }
                , selectable: true
                , dayClick: function(start, end, allDay, jsEvent, view) {

                    $(this).popover({
                        html: true,
                        placement: 'top',
                        title: function() {
                            return $("#popover-head").html();
                        },
                        content: function() {
                            return $("#popover-content").html();
                        }
                    });
                }
            });
            /*$('#style').onload(function(){
                alert('style');
            });*/

            $("#test").popover({
                html: true,
                placement: 'bottom',
                title: function() {
                    return $("#popover-head").html();
                },
                content: function() {
                    return $("#popover-content").html();
                }
            });

            $(".modal-fullscreen").on('show.bs.modal', function () {
                setTimeout( function() {
                    $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
                }, 0);
            });
            $(".modal-fullscreen").on('hidden.bs.modal', function () {
                $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
            });

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
                swiper = new Swiper('.swiper-container', {
//                    pagination : '.pagination1',
//                    paginationType: 'bullets',//bullets fraction progress custom
                    loop: false ,
                    //, updateTranslate : true
//                    grabCursor: false,
                    targetSpy: {
                        id: '#navbar-collapsible'
                        , activeClass: 'active'
                    } ,
                    onSlideChangeEnd:function(swipe){
                        console.log("index=>"+getSlideDataIndex(swipe))
                    } ,
//                    , activeIndex : 0
                    onTransitionStart: function(swiper) {
                        switch(swiper.activeIndex) {
                            case 1:/*style*/
//                                    alerts($('form#apiForm'));
                                $('form#apiForm').ajaxSubmit({
                                    url: "getStyleList.do"
                                    , complete: function (xhr) {
                                        var msg = JSON.parse(xhr.responseText);
//                                    alerts(msg);
                                        /*var html = $('<div style="100%">').append($('<div class="panel panel-default">').append(
                                                $('<div class="panel-heading">').append(
                                                        $('<span class="panel-title">').text("스타일")
                                                )
                                        ));
                                        var body = $('<div class="panel-body">');
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
//                                            alert(String.format('<img src="{0}/getFileItem/{1}.do" style="width:200px;"/><br/>', ctxRoot, image));
                                            body.append(
                                                    $('<div class="bs-callout bs-callout-info thumbnail" id="">').append(
                                                            $('<h4>').text(msg.resultList[n].name)
                                                    ).append(
                                                            $('<p>').html(String.format('<img src="{0}/getFileItem/{1}.do" style="width:200px;"/><br/>', ctxRoot, image) + msg.resultList[n].description)
                                                    )
                                            )
                                        }
                                        html.append(body);
                                        $('#style').html(html);*/
                                        $('#style').html(accordionList(msg));
                                    }
                                });
                                break;
                            default :
                                break;
                        }
                    }
//                    , animating : true
                });

//                alert(swiper.activeIndex);
            } catch (e) {
                alert(e);
            }

            var todayDate = moment().startOf('day');
            var YM = todayDate.format('YYYY-MM');
            var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
            var TODAY = todayDate.format('YYYY-MM-DD');
            var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

            $('#reservation').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listWeek'
                }
                , theme: true
                , locale : "ko"
                , editable: true
                , eventLimit: true // allow "more" link when too many events
                , navLinks: true
                , events: [
                    {
                        title: '매일 이벤트',
                        start: YM + '-01'
                    },
                    {
                        title: '장기 이벤트',
                        start: YM + '-07',
                        end: YM + '-10'
                    },
                    {
                        id: 999,
                        title: '반복 이벤트',
                        start: YM + '-09T16:00:00'
                    },
                    {
                        id: 999,
                        title: '반복 이벤트',
                        start: YM + '-16T16:00:00'
                    },
                    {
                        title: 'Conference',
                        start: YESTERDAY,
                        end: TOMORROW
                    },
                    {
                        title: '완료',
                        start: TODAY + 'T10:30:00',
                        end: TODAY + 'T12:30:00'
                    },
                    {
                        title: '완료',
                        start: TODAY + 'T12:00:00'
                    },
                    {
                        title: '불가',
                        start: TODAY + 'T14:30:00'
                    },
                    {
                        title: '완료',
                        start: TODAY + 'T17:30:00'
                    },
                    {
                        title: '완료',
                        start: TODAY + 'T20:00:00'
                    },
                    {
                        title: '완료',
                        start: TOMORROW + 'T07:00:00'
                    },
                    {
                        title: 'Click for Google',
                        url: 'http://google.com/',
                        start: YM + '-28'
                    }
                ]
            });

        });

        function getSlideDataIndex(swipe){
            var activeIndex = swipe.activeIndex;
            var slidesLen = swipe.slides.length;
            if(swipe.params.loop){
                switch(swipe.activeIndex){
                    case 0:
                        activeIndex = slidesLen-3;
                        break;
                    case slidesLen-1:
                        activeIndex = 0;
                        break;
                    default:
                        --activeIndex;
                }
            }
            return  activeIndex;
        }

        /**
         * 목록가기
         */
        function goList() {
            $('#detailDiv').html('').hide();
            $('#listDiv').show();
        }


        function editEvent(eventId) {
            $('#listDiv').hide();
            location.href = "#detailView";
            var tUrl = "${ctxRoot}/event/editEventForm/" + eventId + ".do";
            $('#detailDiv').load(tUrl);
            $('#detailDiv').show();
        }


    </script>
</head>
<body>
<div class="row no-gutter">
    <%--<div class="col-xs-12" style="font-size: 20px; color: dimgray;" align="center">
        <div class="col-xs-4">
            <a class="icon popover-calendar" data-contentwrapper=".pop-calendar" href="" onclick="return false;">
                <i class="fa fa-calendar"></i> 예약
            </a>
        </div>
        <div class="col-xs-4" style="border-left-style: dotted;border-right-style: dotted;; border-color: darkgrey;">
            <a class="icon" href="#" onclick="try {$('#modal-fullscreen').load('${ctxRoot}/hnews/contents.do',function(response, status, xhr){ if (status == 'success') {$('#modal-fullscreen').modal('show');}})} catch(e) { alert(e); }" &lt;%&ndash;data-target="#modal-fullscreen"&ndash;%&gt; data-toggle="modal" data-direction="left"><i class="fa fa-ticket"></i> 스타일</a>
        </div>
        <div class="col-xs-4">
            <a class="icon" href="#coupon"><i class="fa fa-opencart"></i> 쿠폰</a>
        </div>
    </div>--%>
    <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <section id="home">
                    <div class="col-xs-12">
                        <section class="slider flexslider">
                            <ul class="slides">
                                <li>
                                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-01.jpg" style="width:100%; height:auto;"/>
                                    <p class="flex-caption">Style Apple</p>
                                </li>
                                <li>
                                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:100%; height:auto;"/>
                                    <p class="flex-caption">헤어컷 2</p>
                                </li>
                                <li>
                                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-03.jpg" style="width:100%; height:auto;"/>
                                    <p class="flex-caption">펌 3</p>
                                </li>
                            </ul>
                        </section>
                    </div>
                    <div class="col-xs-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <span class="panel-title">스타일</span>
                            </div>
                            <div class="panel-body">
                                <div class="bs-callout bs-callout-info thumbnail" id="style1">
                                    <h4>No default class</h4>
                                    <p>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't
                                        make too much sense, so you're required to specify a type via contextual class. Choose from
                                        success, info, warning, or danger.</p>
                                </div>
                                <button id="kakaostory-share-button">공유</button>
                            </div>
                        </div>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <span class="panel-title">쿠폰</span>
                            </div>
                            <div class="panel-body">
                                <div class="bs-callout bs-callout-info thumbnail" id="coupon1">
                                    <h4>No default class</h4>
                                    <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"/><br/>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't
                                        make too much sense, so you're required to specify a type via contextual class. Choose from
                                        success, info, warning, or danger.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="swiper-slide">
                <section id="style" style="width:100%">
                    <div class="col-xs-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <span class="panel-title">스타일</span>
                            </div>
                            <div class="panel-body">
                                <div class="bs-callout bs-callout-info thumbnail" id="">
                                    <h4>No default class</h4>
                                    <p>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't
                                        make too much sense, so you're required to specify a type via contextual class. Choose from
                                        success, info, warning, or danger.</p>
                                </div>
                                <button id="kakaostory-share-button">공유</button>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="swiper-slide">
                <section id="coupon">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <span class="panel-title">쿠폰</span>
                        </div>
                        <div class="panel-body">
                            <div class="bs-callout bs-callout-info thumbnail" id="">
                                <h4>No default class</h4>
                                <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"/><br/>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't
                                    make too much sense, so you're required to specify a type via contextual class. Choose from
                                    success, info, warning, or danger.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <span class="panel-title">쿠폰</span>
                        </div>
                        <div class="panel-body">
                            <div class="bs-callout bs-callout-info thumbnail" id="">
                                <h4>No default class</h4>
                                <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"/><br/>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't
                                    make too much sense, so you're required to specify a type via contextual class. Choose from
                                    success, info, warning, or danger.</p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="swiper-slide">
                <section id="calendar">
                    <div class='two-col'>
                        <div class='content'>
                            <div id="reservation"></div>
                        </div>
                    </div>
                    <%--<div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="panel-title">예약</span>
                        </div>
                    </div>--%>
                </section>
            </div>
        </div>
    </div>
    <%--<div class="col-xs-12">
        <section id="features" class="slider flexslider">
            <ul class="slides">
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-01.jpg" />
                    <p class="flex-caption">Style Apple</p>
                </li>
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" />
                    <p class="flex-caption">헤어컷 2</p>
                </li>
                <li>
                    <img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-03.jpg" />
                    <p class="flex-caption">펌 3</p>
                </li>
            </ul>
        </section>
    </div>
    <div class="col-xs-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                <span class="panel-title">스타일</span>
            </div>
            <div class="panel-body">
                <div class="bs-callout bs-callout-info thumbnail" id="style1">
                    <h4>No default class</h4>
                    <p>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't
                        make too much sense, so you're required to specify a type via contextual class. Choose from
                        success, info, warning, or danger.</p>
                </div>
                <button id="kakaostory-share-button">공유</button>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <span class="panel-title">쿠폰</span>
            </div>
            <div class="panel-body">
                <div class="bs-callout bs-callout-info thumbnail" id="coupon1">
                    <h4>No default class</h4>
                    <p><img src="http://getbootstrap.com/2.3.2/assets/img/bootstrap-mdo-sfmoma-02.jpg" style="width:200px;"/><br/>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't
                        make too much sense, so you're required to specify a type via contextual class. Choose from
                        success, info, warning, or danger.</p>
                </div>
            </div>
        </div>
    </div>--%>
</div>
<div class="modal fade" id="layerpop" >
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <!-- 닫기(x) 버튼 -->
                <button type="button" class="close" data-dismiss="modal">×</button>
                <!-- header title -->
                <h4 class="modal-title">Header</h4>
            </div>
            <!-- body -->
            <div class="modal-body">
                Body
            </div>
            <!-- Footer -->
            <div class="modal-footer">
                Footer
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<%--modal(list or detail)--%>
<div class="modal modal-fullscreen fade left" id="modal-fullscreen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>
</body>
</html>