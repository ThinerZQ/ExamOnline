<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="publishBean" scope="page" class="exam.ExamBean"/>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==2){
	String paperid=request.getParameter("paperid");
	String sql="update paper set paperstate='1' where paperid='"+paperid+"'";
	publishBean.executeUpdate(sql); 
	publishBean.closeStmt();
	response.sendRedirect("paperstate.jsp");
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>

<body>

</body>
</html>
