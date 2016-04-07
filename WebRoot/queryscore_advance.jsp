<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="QueryBean" scope="page" class="exam.ExamBean"/>
<title>高级成绩查询</title>
<style type="text/css">
<!--
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.trh
{
    background-image: url('image/admin_bg_1.gif');
    background-color: #4455aa;
    color: #FFFFFF;
    font-size: 17px;
    font-weight:bold
}
.trh1{
 
    background-color: #FFFDE8;
    color: #2E60C9;
    font-size: 15px;
    
}
.style1 {font-size: small}
.STYLE2 {
	font-size: xx-large;
	color: #0033FF;
}
.STYLE3 {
	font-size: 18px;
	font-weight: bold;
	color: #FF0000;
}
-->
</style></head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==1){
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<%
	String deptname=new String (request.getParameter("deptname").getBytes("GBK"));
	String classes=new String (request.getParameter("classes").getBytes("GBK"));
	String subjname=new String (request.getParameter("subjname").getBytes("GBK"));
	String ptype=new String (request.getParameter("ptype").getBytes("GBK"));
	String num=request.getParameter("num");
	String title=new String (request.getParameter("title").getBytes("GBK"));
	String name=new String (request.getParameter("name").getBytes("GBK"));
	String small=request.getParameter("small");
	String big=request.getParameter("big");
	String sub1="",sub2="",sub3="",sub4="",sub5="",sub6="",sub7="",sub8="",sub22="";
	if(!title.equals("--请选择--"))
		sub1="and title='"+title+"'";
	if(!classes.equals("--请选择--"))
		sub4="and class='"+classes+"'";
	if(!subjname.equals("--请选择--"))
		sub7="and subjname='"+subjname+"'";
	if(!deptname.equals("--请选择--"))
		sub8="and deptname='"+deptname+"'";
	if(!ptype.equals("--请选择--"))
		sub6="and paperhead='"+ptype+"'";
	if(num.length()!=0)
		sub5="and num='"+num+"'";
	if(name.length()!=0)
		sub3="and name='"+name+"'";
	if(small.length()!=0)
		sub2="and score>="+small+"";
	if(big.length()!=0)
		sub22="and score<="+big+"";
	String ScoreSql="";
	String sub=(sub1+sub2+sub22+sub3+sub4+sub5+sub6+sub7+sub8).trim();
	if (sub.length()==0)
		ScoreSql="select * from score ";
	else
		ScoreSql="select * from score where "+sub.substring(4);
		System.out.println(ScoreSql);
	%>
	  <table width="557" border="0" cellspacing="0">
		<tr>
		  <td><span class="style1">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="stulogin.jsp">学生主界面</a>&gt;&gt;<a href="queryscore.jsp">成绩查询</a>&gt;&gt;高级查询结果</span></td>
		</tr>
	  </table>
	  <br>
	<table width="90%"  border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#799AE1">
	  <tr class="trh">
		<th nowrap scope="col">用户名</th>
		<th nowrap scope="col">姓名</th>
		<th nowrap scope="col">院系</th>
		<th nowrap scope="col">班级</th>
		<th nowrap scope="col">学号</th>
		<th nowrap scope="col">科目</th>
		<th nowrap scope="col">试卷类型</th>
		<th nowrap scope="col">试卷标题</th>
		<th nowrap scope="col">成绩</th>
	  </tr>
	<%int f=0;
	ResultSet ScoreRs=QueryBean.executeQuery(ScoreSql);
	while (ScoreRs.next())
	{
		String username=new String (ScoreRs.getString("username").getBytes("GBK"));
		title=new String (ScoreRs.getString("title").getBytes("GBK"));
		int Sscore=ScoreRs.getInt("score");
		name=new String (ScoreRs.getString("name").getBytes("GBK"));
		classes=new String (ScoreRs.getString("class").getBytes("GBK"));
		num=new String (ScoreRs.getString("num").getBytes("GBK"));
		ptype=new String (ScoreRs.getString("paperhead").getBytes("GBK"));
		subjname=new String (ScoreRs.getString("subjname").getBytes("GBK"));
		deptname=new String (ScoreRs.getString("deptname").getBytes("GBK"));
		f++;
	%>
	  <tr class="trh1">
		<td nowrap><div align="center"><%=username%></div></td>
		<td nowrap><div align="center"><%=name%></div></td>
		<td nowrap><div align="center"><%=deptname%></div></td>
		<td nowrap><div align="center"><%=classes%></div></td>
		<td nowrap><div align="center"><%=num%></div></td>
		<td nowrap><div align="center"><%=subjname%></div></td>
		<td nowrap><div align="center"><%=ptype%></div></td>
		<td nowrap><div align="center"><%=title%></div></td>
		<td nowrap><div align="center"><%=Sscore%></div></td>
	  </tr>
	 <%}ScoreRs.close();
	 QueryBean.closeStmt();
	 %>
	</table>
	<br>
    <% 
	if(f==0){
	%>
	<table width="77%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
		<td width="100%" align="center" valign="middle" nowrap><div align="center"><span class="STYLE3">对不起！</span><font  size="+2">没有查询到满足条件的数据!</font></div></td>
	  </tr>
	</table>
	<%}%>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
