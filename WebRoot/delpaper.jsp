<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<jsp:useBean id="delpaperBean" scope="page" class="exam.ExamBean"/>
<%
String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==2){
	String paperid=request.getParameter("paperid");
	String sql1="delete paper where paperid='"+paperid+"'";
	delpaperBean.executeUpdate(sql1); 
	String sql2="delete question where paperid='"+paperid+"'";
	delpaperBean.executeUpdate(sql2);
	delpaperBean.closeStmt();
	response.sendRedirect("paperstate.jsp");
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>

<body>

</body>
</html>
