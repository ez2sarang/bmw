<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 10. 29.
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><c:set var="ctxRoot" value="${pageContext.request.contextPath}"
/><html>
<head>
	<title></title>
	<script type="text/javascript" src="${ctxRoot}/js/constant.js"></script>
	<script type="text/javascript" src="${ctxRoot}/extjs/ext-all.js"></script>
	<%--
	<script type="text/javascript" src="${ctxRoot}/extjs/ext-all-sandbox.js"></script>
	<script type="text/javascript" src="${ctxRoot}/extjs/ext-modern-all.js"></script>
	<script type="text/javascript" src="${ctxRoot}/extjs/ext-modern-all-sandbox.js"></script>
	--%>

	<%--<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/admin-dashboard/classic/resources/Admin-all.css"/>--%>
	<%--<script type="text/javascript" src="${ctxRoot}/extjs/admin-dashboard/classic/app.js"></script>--%>
	<%--1.classic 테마
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/classic/theme-classic/resources/theme-classic-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/classic/theme-classic/theme-classic.js"></script>
	--%>

	<%--2.black 테마
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/classic/theme-aria/resources/theme-aria-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/classic/theme-aria/theme-aria.js"></script>
	--%>

	<%--3.ExtJS5부터 추가된 Crisp테마 깔끔함
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/classic/theme-crisp/resources/theme-crisp-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/classic/theme-crisp/theme-crisp.js"></script>
	--%>

	<%--4.Crisp터치테마 깔끔하며 Crisp테마보다 사이즈가 조금씩 더 큼 모바일용 추천테마
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/classic/theme-crisp-touch/resources/theme-crisp-touch-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/classic/ttheme-crisp-touch/theme-crisp-touch.js"></script>
	--%>

	<%--5.Gray 회색테마
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/classic/theme-gray/resources/theme-gray-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/classic/theme-gray/theme-gray.js"></script>
	--%>

	<%--6.Neptune테마 (Facebook?Window8과 비슷)
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/classic/theme-neptune/resources/theme-neptune-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/classic/theme-neptune/theme-neptune.js"></script>
	--%>

	<%--7.Neptune터치테마 (Facebook?Window8과 비슷) 모바일용 추천테마
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/classic/theme-neptune-touch/resources/theme-neptune-touch-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/classic/theme-neptune-touch/theme-neptune-touch.js"></script>
	--%>

	<%--triton
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/classic/theme-triton/resources/theme-triton-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/classic/theme-triton/theme-triton.js"></script>
	--%>

	<%--cupertino
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/modern/theme-cupertino/resources/theme-cupertino-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/modern/theme-cupertino/theme-cupertino.js"></script>
	--%>

	<%--mountainview
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/modern/theme-mountainview/resources/theme-mountainview-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/modern/theme-mountainview/theme-mountainview.js"></script>
	--%>

	<%--neptune
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/modern/theme-neptune/resources/theme-neptune-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/modern/theme-neptune/theme-neptune.js"></script>
	--%>

	<%--windows
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/modern/theme-windows/resources/theme-windows-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/modern/theme-windows/theme-windows.js"></script>
	--%>

	<%--admin-dashboard
	<link rel="stylesheet" type="text/css" href="${ctxRoot}/extjs/admin-dashboard/classic/resources/Admin-all.css"/>
	<script type="text/javascript" src="${ctxRoot}/extjs/admin-dashboard/classic/app.js"></script>
	--%>

	<script>
		Ext.onReady(function () {
//			alert(Ext.os.is);
			Ext.create(FCBase.panel, {
				fullscreen: true
				//도화지를 그려놓을 위치(Ext.getBody()의미 : <body>태그내에 그린다)
				, renderTo: Ext.getBody()
				, width: 400
				, height: 300
				, layout: FCLayout.accordion //레이아웃 유형
				, items: [
					{
						title: '가로정렬 자식레이아웃1'
						, flex: 1
						, frame: true
						, html: '가로정렬내용1'
					}
					, {
						title: '가로정렬 자식레이아웃2'
						, flex: 1
						, frame: true
						, html: '가로정렬내용2'
					}
					, {
						title: '가로정렬 자식레이아웃3'
						, flex: 1
						, frame: true
						, html: '가로정렬내용3'
					}
					, {
						title: '가로정렬 자식레이아웃4'
						, flex: 1
						, frame: true
						, html: '가로정렬내용4'
					}
					, {
						title: '가로정렬 자식레이아웃5'
						, flex: 1
						, frame: true
						, html: '가로정렬내용5'
					}
				], bbar: [
					{
						xtype: 'button'
						, text: '윈도우창'
						, handler: function (btn) {
							Ext.create('Ext.window.Window',{
								autoShow : true,
								width : 300,
								height : 300,
								title : '윈도우제목',
								html : '윈도우 몸통에 들어가는 HTML코드',
								//드래그기능제어(true/false)
								draggable : true,
								//윈도우창 리사이즈기능(true/false)
								resizable : true,
								//브라우저화면을 채우는 기능(true/false)
								maximizable : true,
								//cloasAction을 정의하면 키보드의 esc클릭시 자동 닫힘
								closeAction : 'destroy',
								//모달창으로 부모창비활성(true/false)
								modal : true,
								//윈도우창이 화면에 보여질때 타겟을 지정하게되면 해당 타겟으로부터 나타나는 효과
								animateTarget : btn
							})
						}
					}
					, {
						xtype: 'button'
						, text: 'b버튼2'
						, handler: function () {
							Ext.Msg.alert('버튼클릭', '안녕버튼1?');
						}
					}
				], fbar: [
					{
						xtype: 'button'
						, text: '메시지'
						, handler: function () {
							Ext.MessageBox.show({
								title: '타이틀',
								msg: '메시지내용',
								//버튼정의
								/*buttons: Ext.MessageBox.OK,*/
								buttonText : {
									ok : '확인',
									no : '아니요',
									cancel : '취소',
									yes : '네'
								},
								//아이콘정의
								icon : Ext.MessageBox.WARNING
							});
						}
						, scale: FCScale.small
					}
					, {
						xtype: 'button',
						text: '토글버튼', handler: function (btn) {
							//Ext.Msg.alert('버튼클릭', '안녕버튼1?');
						}
						, scale: FCScale.large
						, enableToggle : true
					}
					, {
						xtype: 'button',
						text: '컨펌', handler: function () {
							Ext.MessageBox.confirm(
									'Confirm 타이틀'
									,'Confirm 컨텐츠 메시지입니다.'
									,function(click_button){
										if(click_button == "yes") {
											Ext.Msg.alert('알람', 'YES');
										} else {
											Ext.Msg.alert('알람', 'NO');
										}
									}
									/*,this */
							);
						}
						, scale: FCScale.medium
					}
					, {
						xtype: 'button',
						text: '토스트', handler: function () {
							Ext.toast({
								html: "토스트메시지(align:b)",
								align : 'b',
								closable: false,
								slideInDuration: 400,
								minWidth: 400
							});
						}
					}
				], tbar: [
					{
						xtype: 'button'
						, text: 't버튼1'
						, menu: [
							{
								text : '메뉴1'
							}
							, {
								text : '메뉴2'
							}
						]
					}
					, {
						xtype: 'splitbutton'
						, text: 't버튼2'
						, menu: [
							{
								text : '구분자메뉴1'
							}
							, {
								text : '구분자메뉴2'
							}
						]
					}
					, {
						xtype: 'segmentedbutton'
						, items: [
							{
								text : '그룹메뉴1'
							}
							, {
								text : '그룹메뉴2'
							}
						]
						, vertical : true
					}
				], lbar: [
					{
						xtype: 'button'
						, text: 'l버튼1'
						, handler: function () {
							Ext.Msg.alert('버튼클릭', '안녕버튼1?');
						}
					}
					, {
						xtype: 'button'
						, text: 'l버튼2'
						, handler: function () {
							Ext.Msg.alert('버튼클릭', '안녕버튼1?');
						}
					}
				], rbar: [
					{
						xtype: 'button'
						, text: 'r버튼1'
						, handler: function () {
							Ext.Msg.alert('버튼클릭', '안녕버튼1?');
						}
					}
					, {
						xtype: 'button'
						, text: 'r버튼2'
						, handler: function () {
							Ext.Msg.alert('버튼클릭', '안녕버튼1?');
						}
					}
				]
			});

			/*Ext.toast({
				html: "토스트메시지",
				closable: false
			});*/
		})
	</script>
</head>
<body>
</body>
</html>
