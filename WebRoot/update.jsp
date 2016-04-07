<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="updateBean" scope="page" class="exam.ExamBean"/>
<% 
String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	String username=new String(request.getParameter("username").getBytes("GBK"));
	String password=new String(request.getParameter("password").getBytes("GBK"));
	String name=new String(request.getParameter("name").getBytes("GBK"));
	String sex=new String(request.getParameter("sex").getBytes("GBK"));
	String dep=new String(request.getParameter("dep").getBytes("GBK"));
	String num=new String(request.getParameter("num").getBytes("GBK"));
	String email=new String(request.getParameter("email").getBytes("GBK"));
	String sql="UPDATE admini SET username = '"+username+"', password = '"+password+"', name = '"+name
	+"',sex='"+sex+"',dep='"+dep+"',num='"+num+"',email='"+email+"'";
	updateBean.executeUpdate(sql);
	updateBean.closeStmt(); 
}
else response.sendRedirect("index.jsp");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>update</title>
</head>

<body> 

</body>
</html>
