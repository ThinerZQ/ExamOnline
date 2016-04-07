<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="AddTeacBean" scope="page" class="exam.ExamBean"/>
<% 
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	int tpri=2;
	String username=new String(request.getParameter("username").getBytes("GBK"));
	String password=new String(request.getParameter("password").getBytes("GBK"));
	String name=new String(request.getParameter("name").getBytes("GBK"));
	String sex=new String(request.getParameter("sex").getBytes("GBK"));
	String dept=new String(request.getParameter("deptname").getBytes("GBK"));
	String num=new String(request.getParameter("num").getBytes("GBK"));
	String email=new String(request.getParameter("email").getBytes("GBK"));
	String sql="insert into teacher (username,password,name,sex,dept,num,email,tpri)values('"+username+"','"+
	password+"','"+name+"','"+sex+"','"+dept+"','"+num+"','"+email+"','"+tpri+"')";
	AddTeacBean.executeUpdate(sql);
	AddTeacBean.closeStmt();
	response.sendRedirect("teacmanage.jsp");
	}
else response.sendRedirect("index.jsp");
%>
