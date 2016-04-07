<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="StuInfoUpdateBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username"); 
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){ 
	String username=new String(request.getParameter("username").getBytes("GBK"));
	String password=request.getParameter("password");
	String name=new String(request.getParameter("name").getBytes("GBK"));
	String sex=new String(request.getParameter("sex").getBytes("GBK"));
	String birthday=request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("day");
	String deptname=new String(request.getParameter("deptname").getBytes("GBK"));
	String profession=new String(request.getParameter("profession").getBytes("GBK"));
	String classes=new String(request.getParameter("classes").getBytes("GBK"));
	String num=request.getParameter("num");
	int state=0;
	String st=new String(request.getParameter("state").trim().getBytes("GBK"));
	if(st.equals("允许考试"))
		state=1;
	int tpri=1;
	String email=request.getParameter("email");
	String sql="update student set password='"+password+"',name='"+name+"',sex='"+sex+"',birthday='"+birthday+"',deptname='"+deptname+
	"',profession='"+profession+"',class='"+classes+"',num='"+num+"',email='"+email+"',state='"+state+"',tpri='"+tpri+"'where username='"+username+"'";
	StuInfoUpdateBean.executeUpdate(sql);
	StuInfoUpdateBean.closeStmt();
	response.sendRedirect("stuinfo.jsp?username="+username);
	}
else response.sendRedirect("index.jsp");
%>
<title>无标题文档</title>
</head>

<body>

</body>
</html>
