<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="QueryBean" scope="page" class="exam.ExamBean"/>
<title>�߼��ɼ���ѯ</title>
<style type="text/css">
<!--
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.trh
{
    background-image: url('image/admin_bg_1.gif');
    background-color: #4455aa;
    color: #FFFFFF;
    font-size: 17px;
    font-weight:bold
}
.trh1{
 
    background-color: #FFFDE8;
    color: #2E60C9;
    font-size: 15px;
    
}
.style1 {font-size: small}
.STYLE2 {
	font-size: xx-large;
	color: #0033FF;
}
.STYLE3 {
	font-size: 18px;
	font-weight: bold;
	color: #FF0000;
}
-->
</style></head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==1){
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<%
	String deptname=new String (request.getParameter("deptname").getBytes("GBK"));
	String classes=new String (request.getParameter("classes").getBytes("GBK"));
	String subjname=new String (request.getParameter("subjname").getBytes("GBK"));
	String ptype=new String (request.getParameter("ptype").getBytes("GBK"));
	String num=request.getParameter("num");
	String title=new String (request.getParameter("title").getBytes("GBK"));
	String name=new String (request.getParameter("name").getBytes("GBK"));
	String small=request.getParameter("small");
	String big=request.getParameter("big");
	String sub1="",sub2="",sub3="",sub4="",sub5="",sub6="",sub7="",sub8="",sub22="";
	if(!title.equals("--��ѡ��--"))
		sub1="and title='"+title+"'";
	if(!classes.equals("--��ѡ��--"))
		sub4="and class='"+classes+"'";
	if(!subjname.equals("--��ѡ��--"))
		sub7="and subjname='"+subjname+"'";
	if(!deptname.equals("--��ѡ��--"))
		sub8="and deptname='"+deptname+"'";
	if(!ptype.equals("--��ѡ��--"))
		sub6="and paperhead='"+ptype+"'";
	if(num.length()!=0)
		sub5="and num='"+num+"'";
	if(name.length()!=0)
		sub3="and name='"+name+"'";
	if(small.length()!=0)
		sub2="and score>="+small+"";
	if(big.length()!=0)
		sub22="and score<="+big+"";
	String ScoreSql="";
	String sub=(sub1+sub2+sub22+sub3+sub4+sub5+sub6+sub7+sub8).trim();
	if (sub.length()==0)
		ScoreSql="select * from score ";
	else
		ScoreSql="select * from score where "+sub.substring(4);
		System.out.println(ScoreSql);
	%>
	  <table width="557" border="0" cellspacing="0">
		<tr>
		  <td><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="stulogin.jsp">ѧ��������</a>&gt;&gt;<a href="queryscore.jsp">�ɼ���ѯ</a>&gt;&gt;�߼���ѯ���</span></td>
		</tr>
	  </table>
	  <br>
	<table width="90%"  border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#799AE1">
	  <tr class="trh">
		<th nowrap scope="col">�û���</th>
		<th nowrap scope="col">����</th>
		<th nowrap scope="col">Ժϵ</th>
		<th nowrap scope="col">�༶</th>
		<th nowrap scope="col">ѧ��</th>
		<th nowrap scope="col">��Ŀ</th>
		<th nowrap scope="col">�Ծ�����</th>
		<th nowrap scope="col">�Ծ����</th>
		<th nowrap scope="col">�ɼ�</th>
	  </tr>
	<%int f=0;
	ResultSet ScoreRs=QueryBean.executeQuery(ScoreSql);
	while (ScoreRs.next())
	{
		String username=new String (ScoreRs.getString("username").getBytes("GBK"));
		title=new String (ScoreRs.getString("title").getBytes("GBK"));
		int Sscore=ScoreRs.getInt("score");
		name=new String (ScoreRs.getString("name").getBytes("GBK"));
		classes=new String (ScoreRs.getString("class").getBytes("GBK"));
		num=new String (ScoreRs.getString("num").getBytes("GBK"));
		ptype=new String (ScoreRs.getString("paperhead").getBytes("GBK"));
		subjname=new String (ScoreRs.getString("subjname").getBytes("GBK"));
		deptname=new String (ScoreRs.getString("deptname").getBytes("GBK"));
		f++;
	%>
	  <tr class="trh1">
		<td nowrap><div align="center"><%=username%></div></td>
		<td nowrap><div align="center"><%=name%></div></td>
		<td nowrap><div align="center"><%=deptname%></div></td>
		<td nowrap><div align="center"><%=classes%></div></td>
		<td nowrap><div align="center"><%=num%></div></td>
		<td nowrap><div align="center"><%=subjname%></div></td>
		<td nowrap><div align="center"><%=ptype%></div></td>
		<td nowrap><div align="center"><%=title%></div></td>
		<td nowrap><div align="center"><%=Sscore%></div></td>
	  </tr>
	 <%}ScoreRs.close();
	 QueryBean.closeStmt();
	 %>
	</table>
	<br>
    <% 
	if(f==0){
	%>
	<table width="77%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
		<td width="100%" align="center" valign="middle" nowrap><div align="center"><span class="STYLE3">�Բ���</span><font  size="+2">û�в�ѯ����������������!</font></div></td>
	  </tr>
	</table>
	<%}%>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
