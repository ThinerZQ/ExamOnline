<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="updateBean" scope="page" class="exam.ExamBean"/>

<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	int tpri=3;
	String username=String.valueOf(session.getAttribute("username"));
	String password=new String(request.getParameter("password").getBytes("GBK"));
	String name=new String(request.getParameter("name").getBytes("GBK"));
	String sex=new String(request.getParameter("sex").getBytes("GBK"));
	String dept=new String(request.getParameter("dept").getBytes("GBK"));
	String num=new String(request.getParameter("num").getBytes("GBK"));
	String email=new String(request.getParameter("email").getBytes("GBK"));
	String body=new String(request.getParameter("body").getBytes("GBK"));
	if(body=="教 师") tpri=2;
	String sql="update admin set password='"+password+"',name='"+name+"',sex='"+sex+"',dept='"+dept+"',num='"+
	num+"',email='"+email+"',tpri="+tpri+" where username='"+username+"'";
	updateBean.executeUpdate(sql);
	updateBean.closeStmt();
}
else response.sendRedirect("index.jsp");

%>
<title>修改成功</title>
<style type="text/css">
<!--
.STYLE1 {font-size: xx-large}
.STYLE2 {
	font-size: xx-large;
	color: #3333FF;
	font-weight: bold;
}
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.STYLE3 {color: #CC33CC}
-->
</style>
</head>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<h1 align="center"><span class="style1 STYLE3">资料修改成功！</span></h1>
<p align="center">点击<a href="admilogin.jsp">这里返回</a></p>
</body>
</html>
