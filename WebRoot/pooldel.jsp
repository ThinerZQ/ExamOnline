<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="DelQueBean" scope="page" class="exam.ExamBean"/>
<% 
String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==2){
	String Sequence=request.getParameter("Sequence");
	String delsql="delete from pool where sequence="+Sequence;
	DelQueBean.executeUpdate(delsql);
	DelQueBean.closeStmt();
	response.sendRedirect("poolquery.jsp");
	}
else response.sendRedirect("index.jsp");
%>
<title>ɾ����Ŀ</title>
</head>
<body>
</body>
</html>
