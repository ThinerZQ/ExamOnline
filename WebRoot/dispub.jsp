<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<jsp:useBean id="dispubBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="delMBean" scope="page" class="exam.ExamBean"/>
<%
String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==2){
	String paperid=request.getParameter("paperid");
	String sql="update paper set paperstate='0' where paperid='"+paperid+"'";
	dispubBean.executeUpdate(sql); 
	dispubBean.closeStmt();
	String delsql="delete from monitor where paperid='"+paperid+"'";
	delMBean.executeUpdate(delsql);
	delMBean.closeStmt();
	response.sendRedirect("paperstate.jsp");
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>

<body>

</body>
</html>
