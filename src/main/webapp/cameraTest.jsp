<%--
  Created by IntelliJ IDEA.
  User: ez2sarang
  Date: 16. 3. 30.
  Time: 오전 10:55
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
  <title>Web QR</title>

  <style type="text/css">
    body{
      width:100%;
      text-align:center;
    }
    img{
      border:0;
    }
    #main{
      margin: 15px auto;
      background:white;
      overflow: auto;
      width: 100%;
    }
    #header{
      background:white;
      margin-bottom:15px;
    }
    #mainbody{
      background: white;
      width:100%;
      display:none;
    }
    #footer{
      background:white;
    }
    #v{
      width:320px;
      height:240px;
    }
    #qr-canvas{
      display:none;
    }
    #qrfile{
      width:320px;
      height:240px;
    }
    #mp1{
      text-align:center;
      font-size:35px;
    }
    #imghelp{
      position:relative;
      left:0px;
      top:-160px;
      z-index:100;
      font:18px arial,sans-serif;
      background:#f0f0f0;
      margin-left:35px;
      margin-right:35px;
      padding-top:10px;
      padding-bottom:10px;
      border-radius:20px;
    }
    .selector{
      margin:0;
      padding:0;
      cursor:pointer;
      margin-bottom:-5px;
    }
    #outdiv
    {
      width:320px;
      height:240px;
      border: solid;
      border-width: 3px 3px 3px 3px;
    }
    #result{
      border: solid;
      border-width: 1px 1px 1px 1px;
      padding:20px;
      width:70%;
    }

    /*ul{
      margin-bottom:0;
      margin-right:40px;
    }
    li{
      display:inline;
      padding-right: 0.5em;
      padding-left: 0.5em;
      font-weight: bold;
      border-right: 1px solid #333333;
    }
    li a{
      text-decoration: none;
      color: black;
    }*/

    #footer a{
      color: black;
    }
    .tsel{
      padding:0;
    }

  </style>

  <script type="text/javascript" src="${ctxRoot}/js/qrcode/llqrcode.js"></script>
  <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
  <script type="text/javascript" src="${ctxRoot}/js/qrcode/webqr.js"></script>

  <script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-24451557-1']);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

  </script>

</head>

<body>
<ul>
  <li><a href="${ctxRoot}/test.do">test</a></li>
  <li><a href="${ctxRoot}/home.do">home</a>(sencha)</li>
  <li><a href="${ctxRoot}/admin.do">admin</a>(BackOffice 자동생성)</li>
  <li><a href="${ctxRoot}/bootstrap.do">bootstrap</a></li>
  <li><a href="${ctxRoot}/menusample.do">menusample</a></li>
  <li><input id="shopID" name="shopID" size="10" placeholder="shopID"> <a href="#" onclick="document.location.href='${ctxRoot}/'+document.all.shopID.value+'/mobilesample.do';">/mobilesample</a>(모바일)</li>
  <li><a href="${ctxRoot}/joinsample.do">joinsample</a>(가입)</li>
</ul>
<img src="https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=http://www.fcsoft.co.kr/impd/index.jsp&choe=">

<div id="main">
  <div id="header">
    <div style="position:relative;top:+20px;left:0px;"><g:plusone size="medium"></g:plusone></div>
    <p id="mp1">
      QR Code scanner
    </p>
    <ul>
      <li><a href="index.html">Scan</a></li>
      <li><a href="create.html">Create</a></li>
      <li><a href="about.html">About</a></li>
      <li style="border: medium none;"><a href="contact.html">Contact</a></li>
    </ul>
  </div>
  <div id="mainbody">
    <table class="tsel" border="0" width="100%">
      <tr>
        <td valign="top" align="center" width="50%">
          <table class="tsel" border="0">
            <tr>
              <td><img class="selector" id="webcamimg" src="vid.png" onclick="setwebcam()" align="left" /></td>
              <td><img class="selector" id="qrimg" src="cam.png" onclick="setimg()" align="right"/></td></tr>
            <tr><td colspan="2" align="center">
              <div id="outdiv">
              </div></td></tr>
          </table>
        </td>
      </tr>
      <tr><td colspan="3" align="center">
        <img src="down.png"/>
      </td></tr>
      <tr><td colspan="3" align="center">
        <div id="result"></div>
      </td></tr>
    </table>
  </div>&nbsp;
  <div id="footer">
    <br>
    <h5 align="center">Copyright &copy; 2011 <a target="_blank" href="http://www.lazarsoft.info">Lazar Laszlo</a></h5>
  </div>
</div>
<canvas id="qr-canvas" width="800" height="600"></canvas>
<script type="text/javascript">loadWebqr();</script>
</body>

</html>