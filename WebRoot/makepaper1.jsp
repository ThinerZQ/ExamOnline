<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"  errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="queryBean1" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="insertBean" scope="page" class="exam.ExamBean"/>
<% 
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==2){
	int single=0;
	int multi=0;
	int judge=0;
	int singlemark=0;
	int multimark=0;
	int judgemark=0;
	int paperid=0;
	int questionid=0;
	int paperstate=0;
	String creatby=String.valueOf(session.getAttribute("username"));
	String deptname=new String (request.getParameter("deptname").getBytes("GBK"));
	String paperhead=new String (request.getParameter("paperhead").getBytes("GBK"));
	String subjname=new String (request.getParameter("subject").getBytes("GBK"));
	int time=Integer.parseInt(request.getParameter("time"));
	try{
		single=Integer.parseInt(request.getParameter("single"));
		singlemark=Integer.parseInt(request.getParameter("singlemark"));
	}catch(NumberFormatException ex1){};
	try{
		multi=Integer.parseInt(request.getParameter("multi"));
		multimark=Integer.parseInt(request.getParameter("multimark"));
	}catch(NumberFormatException ex2){};
	try{
		judge=Integer.parseInt(request.getParameter("judge"));
		judgemark=Integer.parseInt(request.getParameter("judgemark"));
	}catch(NumberFormatException ex3){};
	
	String sql1="select max(paperid) as maxid from paper";
	ResultSet rs1=queryBean1.executeQuery(sql1);
	if(rs1.next())paperid=rs1.getInt("maxid")+1;
	else paperid=1;
	rs1.close();
	queryBean1.closeStmt();
	
	String sql11="insert paper (paperid,paperhead,subjname,deptname,paperstate,time,creatby,"+
	"single,singlemark,multi,multimark,judge,judgemark)values('"+paperid+"','"+paperhead+"','"+
	subjname+"','"+deptname+"','"+paperstate+"','"+time+"','"+creatby+"','"+single+"','"+singlemark+
	"','"+multi+"','"+multimark+"','"+judge+"','"+judgemark+"')";
	insertBean.executeUpdate(sql11);
	insertBean.closeStmt();
	response.sendRedirect("paperstate.jsp");
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>
<body>
</body>
</html>
