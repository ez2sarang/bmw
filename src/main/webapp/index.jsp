<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 15. 6. 22.
  Time: 오후 1:45
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java"
%><%@ include file="/WEB-INF/views/common/includes.jsp"
%><html>
<head>
  <meta name="description" content="QR Code scanner" />
  <meta name="keywords" content="qrcode,qr code,scanner,barcode,javascript" />
  <meta name="language" content="English" />
  <meta name="copyright" content="Lazar Laszlo (c) 2011" />
  <meta name="Revisit-After" content="1 Days"/>
  <meta name="robots" content="index, follow"/>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>impd index</title>
</head>
<body>
<ul>
  <li><a href="${ctxRoot}/test.do">test</a></li>
  <li><a href="${ctxRoot}/home.do">home</a>(sencha)</li>
  <li><a href="${ctxRoot}/admin.do">admin</a>(BackOffice 자동생성)</li>
  <li><a href="${ctxRoot}/bootstrap.do">bootstrap</a></li>
  <li><a href="${ctxRoot}/menusample.do">menusample</a></li>
  <li><input id="shopID" name="shopID" size="10" value="hnews" placeholder="shopID"> <a href="#" onclick="document.location.href='${ctxRoot}/'+document.all.shopID.value+'/mobilesample.do';">/mobilesample</a>(모바일)</li>
  <li><a href="${ctxRoot}/joinsample.do">joinsample</a>(가입)</li>
</ul>
<img src="https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=http://www.fcsoft.co.kr/impd/index.jsp&choe=">


</body>

</html>