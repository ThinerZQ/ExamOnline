<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<jsp:useBean id="adddeptBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==3){
	String deptcode=request.getParameter("deptcode");
	System.out.println("==" + request.getParameter("deptname"));
	String deptname = request.getParameter("deptname");
	String sql="insert department (deptcode,deptname)values('"+deptcode+"','"+deptname+"')";
	adddeptBean.executeUpdate(sql);
	adddeptBean.closeStmt();
	response.sendRedirect("adddepte.jsp");
	}
else{
	response.sendRedirect("index.jsp");
	}
%>
<title>无标题文档</title>
</head>

<body>

</body>
</html>
