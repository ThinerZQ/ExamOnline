<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理员主界面</title>
<style type="text/css">
<!--
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.style3 {font-size: 14px}
.STYLE4 {
	font-family: "宋体";
	font-size: xx-large;
	color: #0000FF;
	font-weight: bold;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>
<style type="text/css">
.spanstyle {
position:absolute;
visibility:visible;
top:-50px;
font-size:9pt;
color: #000000;
font-weight:bold;
}.style1 {	color: #FF0000;
	font-weight: bold;
	font-size: large;
}
.trh
{
   
    background-color: #3399ff;
    color: #FFFFFF;
    font-size: 24px;
    font-weight:bold
}
.STYLE6 {color: #FF00FF; font-weight: bold; font-size: large; }
.STYLE6 a {text-decoration:none;}
</style>
<script language="javascript" type="text/javascript">
/*var x,y
var step=20
var flag=0
var message="基于java的网上考试系统"
message=message.split("")
var xpos=new Array()
for (i=0;i<=message.length-1;i++) {
xpos[i]=-50}
var ypos=new Array()
for (i=0;i<=message.length-1;i++) {
ypos[i]=-50}
function handlerMM(e){
x = (document.layers) ? e.pageX : document.body.scrollLeft+event.clientX
y = (document.layers) ? e.pageY : document.body.scrollTop+event.clientY
flag=1}
function makesnake() {
if (flag==1 && document.all) {
for (i=message.length-1; i>=1; i--) {
xpos[i]=xpos[i-1]+step
ypos[i]=ypos[i-1] }
xpos[0]=x+step
ypos[0]=y
for (i=0; i<message.length-1; i++) {
var thisspan = eval("span"+(i)+".style")
thisspan.posLeft=xpos[i]
thisspan.posTop=ypos[i] } }
else if (flag==1 && document.layers) {
for (i=message.length-1; i>=1; i--) {
xpos[i]=xpos[i-1]+step
ypos[i]=ypos[i-1] }
xpos[0]=x+step
ypos[0]=y
for (i=0; i<message.length-1; i++) {
var thisspan = eval("document.span"+i)
thisspan.left=xpos[i]
thisspan.top=ypos[i]} }
var timer=setTimeout("makesnake()",30)}*/
</script>
<%
String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==3){
%>
<body onLoad="MM_preloadImages('image/zszh2.gif','image/jszh2.gif','image/xszh2.gif','image/tjbm2.gif','image/tjkm2.gif','image/ksqk2.gif','image/bjgl2.gif')">
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<br>
<div id="Layer1" style="position:absolute; left:180px; top:41px; width:0px; height:8px; z-index:1"></div>
<script language="javascript" type="text/javascript">
<!--
for (i=0;i<=message.length-1;i++) {
document.write("<span id='span"+i+"'class='spanstyle'>")
document.write(message[i])
document.write("</span>")}
if (document.layers){
document.captureEvents(Event.MOUSEMOVE);}
document.onmousemove = handlerMM;
-->
</script>
<table width="60%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="left"><span class="style3"><strong><%=session.getAttribute("username")%></strong>您已经成功登陆本网上考试系统！退出时请点击</span><span class="STYLE6"><a href="logout.jsp">安全退出</a></span></div></td>
  </tr>
  <tr>
    <td>您具有以下权限：</td>
  </tr>
</table>
<br>
<div align="center"></div>
<table width="60%" height="172"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCFFCC">
  <tr class="trh">
    <td height="47" bgcolor="#3399FF"><div align="center">
      <p>帐户管理</p>
    </div></td>
    <td><div align="center">
      <p>资源管理</p>
    </div></td>
    <td><div align="center">
      <p>监控中心</p>
    </div></td>
  </tr>
  <tr>
    <td height="38"><div align="center">
      <p><a href="admicount.jsp" onMouseOver="MM_swapImage('Image1','','image/zszh2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/zszh.gif" name="Image1" width="147" height="31" border="0" id="Image1"></a></p>
    </div></td>
    <td><div align="center"><a href="adddepte.jsp" onMouseOver="MM_swapImage('Image4','','image/tjbm2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/tjbm.gif" name="Image4" width="147" height="31" border="0" id="Image4"></a></div></td>
    <td><div align="center"><a href="monitor.jsp" onMouseOver="MM_swapImage('Image6','','image/ksqk2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/ksqk.gif" name="Image6" width="147" height="31" border="0" id="Image6"></a></div></td>
  </tr>
  <tr>
    <td height="45"><div align="center">
      <p><a href="teacmanage.jsp" onMouseOver="MM_swapImage('Image2','','image/jszh2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/jszh.gif" name="Image2" width="147" height="31" border="0" id="Image2"></a></p>
    </div></td>
    <td><div align="center"><a href="pooladd.jsp"></a><a href="addsubject.jsp" onMouseOver="MM_swapImage('Image5','','image/tjkm2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/tjkm.gif" name="Image5" width="147" height="31" border="0" id="Image5"></a></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="42"><div align="center">
      <p><a href="stumanage.jsp" onMouseOver="MM_swapImage('Image3','','image/xszh2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/xszh.gif" name="Image3" width="147" height="31" border="0" id="Image3"></a></p>
    </div></td>
    <td><div align="center"><a href="addclass1.jsp" onMouseOver="MM_swapImage('Image7','','image/bjgl2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/bjgl.gif" name="Image7" width="147" height="31" border="0" id="Image7"></a></div></td>
    <td><div align="center"></div></td>
  </tr>
</table>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
