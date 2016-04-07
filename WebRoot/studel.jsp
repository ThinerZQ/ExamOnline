<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="studelBean" scope="page" class="exam.ExamBean"/>
<%
String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	String username=new String(request.getParameter("username").getBytes("GBK"));
	String sql="delete student where username='"+username+"'";
	studelBean.executeUpdate(sql);
	studelBean.closeStmt(); 
	response.sendRedirect("stumanage.jsp");
	}
else response.sendRedirect("index.jsp");
%>
</head>
<body>
</body>
</html>