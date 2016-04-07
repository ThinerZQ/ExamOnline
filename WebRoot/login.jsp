<%@ page contentType="text/html; charset=GBK" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
Login 
</title>
</head>
<jsp:useBean id="loginBean" scope="session" class="exam.ExamBean" />
<body> 
<%
String username=new String(request.getParameter("username").trim().getBytes("GBK"));
String password=new String(request.getParameter("password").trim().getBytes("GBK"));
String body=new String(request.getParameter("body").trim().getBytes("GBK"));
String sql;
if(body.compareTo("stud")==0){
    sql="select tpri from student where username='"+username+"'and password='"+password+"'";
    ResultSet rset=loginBean.executeQuery(sql);
    if(rset.next()){
		int tpri=rset.getInt("tpri");
		session.setAttribute("username",username);
		session.setAttribute("tpri",new Integer(tpri));
		rset.close();
		loginBean.closeStmt();
		response.sendRedirect("stulogin.jsp");
	}else
	{
		response.sendRedirect("loginfail.jsp");
	}
}
else if(body.compareTo("teac")==0){
	sql="select tpri from teacher where username='"+username+"'and password='"+password+"'";
	ResultSet rs=loginBean.executeQuery(sql);
	if(rs.next()){
		int tpri=rs.getInt("tpri");
		session.setAttribute("username",username);
		session.setAttribute("tpri",new Integer(tpri));
		rs.close();
		loginBean.closeStmt();
		response.sendRedirect("teaclogin.jsp");
	}else 
	{
		response.sendRedirect("loginfail.jsp");
	}
}
else if(body.compareTo("admi")==0){
	sql="select tpri from admin where username='"+username+"'and password='"+password+"'";
	ResultSet rs=loginBean.executeQuery(sql);
	if(rs.next()){
		int tpri=rs.getInt("tpri");
		session.setAttribute("username",username);
		session.setAttribute("tpri",new Integer(tpri));
		rs.close();
		loginBean.closeStmt();
		response.sendRedirect("admilogin.jsp");
	}else 
	{
		response.sendRedirect("loginfail.jsp");
	}
}%>
</body>

</html>
