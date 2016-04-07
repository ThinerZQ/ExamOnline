<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="TchInfoUpdateBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<jsp:useBean id="TchDelBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<jsp:useBean id="TchToAdmiBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<title>无标题文档</title>
</head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
%>
<body>
<% 
int tpri=2;
String username=request.getParameter("username");
String password=request.getParameter("password");
String name=request.getParameter("name");
String sex=request.getParameter("sex");
String dept=request.getParameter("deptname");
String num=request.getParameter("num");
String email=request.getParameter("email");
String body=request.getParameter("body");
if (body.equals("管理员")){
	tpri=3;
	String DelSql="delete from teacher where username='"+username+"'";
	TchDelBean.executeUpdate(DelSql);
	TchDelBean.closeStmt();
	String InsertSql="insert admini(username,password,name,sex,dept,num,email,tpri)values('"+username+"','"+
	password+"','"+name+"','"+sex+"','"+dept+"','"+num+"','"+email+"','"+tpri+"')";
	TchToAdmiBean.executeUpdate(InsertSql);
	TchToAdmiBean.closeStmt();
}
else{
	String UpdateSql="update teacher set password='"+password+"',name='"+name+"',sex='"+sex+"',dept='"+dept+"',num='"+
	num+"',email='"+email+"',tpri="+tpri+" where username='"+username+"'";
	TchInfoUpdateBean.executeUpdate(UpdateSql);
	TchInfoUpdateBean.closeStmt();
}
response.sendRedirect("teacinfo.jsp?username="+username);%>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
