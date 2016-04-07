<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>教师主界面</title>
<style type="text/css">
<!--
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.style1 {
	color: #FF0000;
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
.style4 {font-size: 14px}
.STYLE5 {
	font-size: xx-large;
	color: #0033FF;
}
.STYLE6 {color: #FF00FF}
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
<%
String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==2){
%>
<body onLoad="MM_preloadImages('image/scsj2.gif','image/sjfb2.gif','image/cx2.gif','image/tj2.gif')">
<div align="center">
  <table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
  <p>&nbsp;</p>
  <table width="70%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td bgcolor="#CCFFCC"><div align="center" class="STYLE6">系统提示</div></td>
    </tr>
    <tr>
      <td><div align="center"><span class="style4"><strong><%=session.getAttribute("username")%></strong>您好！您已经成功登陆本网上考试系统，为了您的帐户安全，退出时</span><span class="style1"><a href="logout.jsp">安全退出</a></span></div></td>
    </tr>
    <tr>
      <td><div align="left">您具有以下权限：</div></td>
    </tr>
  </table>
  <br>
</div>
<table width="60%" height="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr class="trh">
    <td width="48%" height="27"><div align="center">题库管理</div></td>
    <td width="52%"><div align="center">试卷管理</div></td>
  </tr>
  <tr>
    <td height="43" bgcolor="#CCFFCC"><div align="center"><a href="poolquery.jsp" onMouseOver="MM_swapImage('Image3','','image/cx2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/cx.gif" name="Image3" width="147" height="31" border="0" id="Image3"></a></div></td>
    <td bgcolor="#CCFFCC"><div align="center"><a href="makepaper.jsp"><img src="image/scsj1.gif" name="Image1" width="147" height="31" border="0" id="Image1" onMouseOver="MM_swapImage('Image1','','image/scsj2.gif',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
  </tr>
  <tr>
    <td height="45" bgcolor="#CCFFCC"><div align="center"><a href="pooladd.jsp" onMouseOver="MM_swapImage('Image4','','image/tj2.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="image/tj.gif" name="Image4" width="147" height="31" border="0" id="Image4"></a></div></td>
    <td bgcolor="#CCFFCC"><div align="center"><a href="paperstate.jsp"><img src="image/sjfb1.gif" name="Image2" width="147" height="31" border="0" id="Image2" onMouseOver="MM_swapImage('Image2','','image/sjfb2.gif',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
  </tr>
  <tr>
    <td height="13" colspan="2"><div align="center"></div>      <div align="center"></div></td>
  </tr>
</table>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
