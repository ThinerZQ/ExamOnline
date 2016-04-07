<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<jsp:useBean id="delsubjBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="delsubjBean2" scope="page" class="exam.ExamBean"/>
<%
String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	String deptname=""; 
	String subjcode=request.getParameter("subjcode");
	String sql2="select deptname from subject where subjcode='"+subjcode+"'";
	ResultSet rs=delsubjBean.executeQuery(sql2);
	if(rs.next()){
		deptname=rs.getString("deptname");
	}
	rs.close();
	delsubjBean.closeStmt();
	String sql="delete from subject where subjcode='"+subjcode+"'";
	delsubjBean2.executeUpdate(sql);
	delsubjBean2.closeStmt();
	response.sendRedirect("addsubject.jsp?deptname="+deptname);
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>

<body>

</body>
</html>
