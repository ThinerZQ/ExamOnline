<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="DelClassBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<title>无标题文档</title>
</head> 
<body>
<%
String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==3){
	String classcode=request.getParameter("classcode");
	String sql="delete from classes where classcode='"+classcode+"'";
	DelClassBean.executeUpdate(sql);
	DelClassBean.closeStmt();
	response.sendRedirect("addclass1.jsp");
	}
else response.sendRedirect("index.jsp");
%>
</body>
</html> 
