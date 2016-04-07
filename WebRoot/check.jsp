<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content_Type" content="text/html;charset=gb2312">
<jsp:useBean id="checkbean" scope="page" class="exam.ExamBean"/>
<title>check</title>
</head> 
<body>
<%
String username=new String(request.getParameter("username").trim().getBytes("8859_1"),"GB2312");
String sql="select username from student where username='"+username+"'";
ResultSet rs=checkbean.executeQuery(sql);
if(rs.next()){
	rs.close();
	checkbean.closeStmt();
	response.sendRedirect("rename_err.htm");
}
else {
	rs.close();
	checkbean.closeStmt();
	response.sendRedirect("pass.jsp");
}
%>
</body>
</html> 
