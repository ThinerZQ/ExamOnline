<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="DelMoniBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="DelQuesBean" scope="page" class="exam.ExamBean"/>
<%
String user=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(user!=null && tpri.intValue()==3){
	String username=request.getParameter("username");
	 
	String sql="delete from monitor where username='"+username+"'";
	DelMoniBean.executeUpdate(sql);
	DelMoniBean.closeStmt();
	String sql2="delete from question where username='"+username+"'";
	DelQuesBean.executeUpdate(sql2);
	DelQuesBean.closeStmt();
	response.sendRedirect("monitor.jsp");
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>

<body>

</body>
</html>
