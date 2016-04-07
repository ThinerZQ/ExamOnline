<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="AddPoolBean" scope="page" class="exam.ExamBean"/>
<%  
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==2){
	String Sequence=request.getParameter("Sequence");
	String subject=new String(request.getParameter("subject").getBytes("GBK"));
	String type=new String(request.getParameter("type").getBytes("GBK"));
	String question=new String(request.getParameter("question").getBytes("GBK"));
	String option1=new String(request.getParameter("option1").getBytes("GBK"));
	String option2=new String(request.getParameter("option2").getBytes("GBK"));
	String option3=new String(request.getParameter("option3").getBytes("GBK"));
	String option4=new String(request.getParameter("option4").getBytes("GBK"));
	String answer1=request.getParameter("checkbox1");
	String answer2=request.getParameter("checkbox2");
	String answer3=request.getParameter("checkbox3");
	String answer4=request.getParameter("checkbox4");
	String answer="";
	if(answer1!=null)
	answer+=answer1;
	if(answer2!=null)
	answer+=answer2;
	if(answer3!=null)
	answer+=answer3;
	if(answer4!=null)
	answer+=answer4;
	String AddSql="insert pool (sequence,subj,type,question,option1,option2,option3,option4,answer)values('"+Sequence+"','"+subject+"','"+type+"','"+question+"','"+option1+"','"+option2
	+"','"+option3+"','"+option4+"','"+answer+"')";
	AddPoolBean.executeUpdate(AddSql);
	AddPoolBean.closeStmt();
	response.sendRedirect("poolquery.jsp");
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>
<body>
</body>
</html>
