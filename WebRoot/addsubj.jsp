<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="addsubjBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==3){
	String deptname1=new String(request.getParameter("deptname2").getBytes("GBK"));
	String deptname=request.getParameter("deptname2");
	String subjcode=request.getParameter("subjcode");
	String subjname=new String(request.getParameter("subjname").getBytes("GBK"));
	String sql="insert subject (subjcode,subjname,deptname)values('"+subjcode+"','"+subjname+"','"+deptname+"')";
	addsubjBean.executeUpdate(sql);
	addsubjBean.closeStmt();
	System.out.println(deptname1+"___"+deptname);
	response.sendRedirect("addsubject.jsp?deptname="+deptname);
}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>

<body>

</body>
</html>
