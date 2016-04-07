<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>教师信息</title>
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
<style type="text/css">
<!--
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.trh
{
    background-color: #3399ff;
    color: #FFFFFF;
    font-size: 14px;
    font-weight:bold
}
.trh1
{
 
    background-color: #FFFDE8;
    color: #2E60C9;
    font-size: 14px;
    
}
.style1 {font-size: small}
.STYLE2 {
	color: #0033FF;
	font-size: xx-large;
}
-->
</style></head>
<jsp:useBean id="TchinfoBean" scope="page" class="exam.ExamBean"/>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	String body="",name="",sex="",dept="",num="",email="";
	String username=new String(request.getParameter("username").getBytes("GBK"));
	String sql="select * from teacher where username='"+username+"'";
	ResultSet rs=TchinfoBean.executeQuery(sql);
	while(rs.next()){
		name=rs.getString("name");
		sex=rs.getString("sex");
		dept=rs.getString("dept");
		num=rs.getString("num");
		email=rs.getString("email");
	}rs.close();
	TchinfoBean.closeStmt();
%>
<body onLoad="MM_preloadImages('image/logo1205.png')">
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="499" border="0" cellspacing="0">
<tr>
  <td width="497"><span class="style1">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="admilogin.jsp">管理员主界面</a>&gt;&gt;<a href="teacmanage.jsp">教师帐户管理</a>&gt;&gt;教师信息</span></td>
</tr>
</table>
<br>
<div align="center">
    <div align="center">
      <table width="280" height="198" border="1" cellspacing="1" bordercolor="#799ae1">
        <tr>
          <th width="99" class="trh" scope="row"><div align="right">用户名：</div></th>
          <td width="171" class="trh1"><div align="left"><%=username%></div></td>
        </tr>
        <tr>
          <th class="trh" scope="row"><div align="right">姓名：</div></th>
          <td class="trh1"><div align="left"><%=name%></div></td>
        </tr>
        <tr>
          <th class="trh" scope="row"><div align="right">性别：</div></th>
          <td class="trh1"><div align="left"><%=sex%></div></td>
        </tr>
        <tr>
          <th class="trh" scope="row"><div align="right">部门：</div></th>
          <td class="trh1"><div align="left"><%=dept%></div></td>
        </tr>
        <tr>
          <th class="trh" scope="row"><div align="right">工作证号：</div></th>
          <td class="trh1"><div align="left"><%=num%></div></td>
        </tr>
        <tr>
          <th class="trh" scope="row"><div align="right">E-mail：</div></th>
          <td class="trh1"><div align="left"><%=email%></div></td>
        </tr>
        <tr>
          <th class="trh" scope="row"><div align="right">身份：</div></th>
          <td class="trh1"><div align="left">教师</div></td>
        </tr>
      </table>    
      <p><a href="teacinfoupdate.jsp?username=<%=username%>"><img src="image/logo1268.gif" alt="" name="Image1" width="89" height="31" border="0" id="Image1" onMouseOver="MM_swapImage('Image1','','image/logo1205.png',1)" onMouseOut="MM_swapImgRestore()"></a></p>
</div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
