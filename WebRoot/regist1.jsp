<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="RegStuBean" scope="page" class="exam.ExamBean"/>
 
<title>无标题文档</title>
</head>

<body>
<% 
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

int tpri=1;
int state=1;
String username= request.getParameter("username") ;
String password=request.getParameter("password");
String name = request.getParameter("name") ;
String sex = request.getParameter("sex") ;
String birthday=request.getParameter("year").trim()+"/"+request.getParameter("month").trim()+"/"+request.getParameter("day").trim();
String deptname= request.getParameter("deptname") ;
String profession= request.getParameter("profession") ;
String classes= request.getParameter("classes") ;
String num=request.getParameter("num");
String email=request.getParameter("email");
String sql="insert into student (username,password,name,sex,birthday,deptname,profession,class,num,email,state,tpri)values('"+
username+"','"+password+"','"+name+"','"+sex+"','"+birthday+"','"+deptname+"','"+profession+"','"+classes+"','"+num+"','"+email+"','"+
state+"','"+tpri+"')";
RegStuBean.executeUpdate(sql);
RegStuBean.closeStmt();
response.sendRedirect("index.jsp");
%>

</body>
</html>
