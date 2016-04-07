<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="AddStuBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	int tpri=1;
	int state=1;
	String username=new String(request.getParameter("username").getBytes("GBK"));
	String password=request.getParameter("password");
	String name=new String(request.getParameter("name").getBytes("GBK"));
	String sex=new String(request.getParameter("sex").getBytes("GBK"));
	String birthday=request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("day");
	String deptname=new String(request.getParameter("deptname").getBytes("GBK"));
	String profession=new String(request.getParameter("profession").getBytes("GBK"));
	String classes=new String(request.getParameter("classes").getBytes("GBK"));
	String num=request.getParameter("num");
	String st=request.getParameter("st").trim();
	if(st.equals("N"))state=0;
	String email=request.getParameter("email");
	String sql="insert into student (username,password,name,sex,birthday,deptname,profession,class,num,email,state,tpri)values('"+
	username+"','"+password+"','"+name+"','"+sex+"','"+birthday+"','"+deptname+"','"+profession+"','"+classes+"','"+num+"','"+email+"','"+
	state+"','"+tpri+"')";
	AddStuBean.executeUpdate(sql);
	AddStuBean.closeStmt();
	response.sendRedirect("stumanage.jsp");
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>
<body> 
</body>
</html>
 