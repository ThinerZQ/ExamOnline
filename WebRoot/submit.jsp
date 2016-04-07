<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="db1" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="db2" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="db3" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="db4" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="db5" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="db6" scope="page" class="exam.ExamBean"/>
<title>考试结果</title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.trh
{ 
    background-color: #3399ff;
    color: #FFFFFF;
    font-size: 14px;
    font-weight:bold
}
.trh1
{
    background-color: #FFFDE8;
    color: #2E60C9;
    font-size: 14px;
}
.style2 {font-size: small}
.STYLE3 {font-size: xx-large}
-->
</style>
</head>
<%
String username=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username!=null && tpri1.intValue()==1){
	int Sequence=0;
	int SingleCnt=0;
	int SingleScore=0;
	int SingleMark=0;
	int SingleCrt=0;
	int MultiCnt=0;
	int MultiScore=0;
	int MultiMark=0;
	int MultiCrt=0;
	int JudgeCnt=0;
	int JudgeScore=0;
	int JudgeMark=0;
	int JudgeCrt=0;
	Vector Ans1=new Vector();
	Vector Ans2=new Vector();
	String title=String.valueOf(session.getAttribute("title"));
	String sql1="select questionid,answer from question where username='"+username+"'";
	ResultSet rs1=db1.executeQuery(sql1);
	while(rs1.next()){
		Sequence++;
		String answer=request.getParameter("Q"+String.valueOf(Sequence));
		if(answer==null) answer="#";
		int questionid=rs1.getInt("questionid");
		String TrueAnswer=rs1.getString("answer").trim();
		Ans1.addElement(String.valueOf(questionid)+answer.trim());
		Ans2.addElement(String.valueOf(questionid)+TrueAnswer);
		String sql2="insert into answer (questionid,answer,username)values('"+questionid+"','"+answer+"','"+username+"')";
		db2.executeUpdate(sql2);
		db2.closeStmt();
	}
	rs1.close();
	String CntSql1="select count(questionid) as cnt,AVG(mark) AS mark from question where username='"+username+"' and type='单项选择题'";
	ResultSet CntRs1=db1.executeQuery(CntSql1);
	while(CntRs1.next()){
		SingleCnt=CntRs1.getInt("cnt");
		SingleMark=CntRs1.getInt("mark");
	}
	CntRs1.close();
	String CntSql2="select count(questionid) as cnt,AVG(mark) AS mark from question where username='"+username+"' and type='多项选择题'";
	ResultSet CntRs2=db1.executeQuery(CntSql2);
	while(CntRs2.next()){
		MultiCnt=CntRs2.getInt("cnt");
		MultiMark=CntRs2.getInt("mark");
	}
	CntRs2.close();
	String CntSql3="select count(questionid) as cnt,AVG(mark) AS mark from question where username='"+username+"' and type='判断题'";
	ResultSet CntRs3=db1.executeQuery(CntSql3);
	while(CntRs3.next()){
		JudgeCnt=CntRs3.getInt("cnt");
		JudgeMark=CntRs3.getInt("mark");
	}
	CntRs3.close();
	int i=0;
	for(;i<SingleCnt;i++){
		if(Ans1.elementAt(i).equals(Ans2.elementAt(i))){
			SingleScore+=SingleMark;
			SingleCrt++;
			}
	}
	for(;i<SingleCnt+MultiCnt;i++){
		if(Ans1.elementAt(i).equals(Ans2.elementAt(i))){
			MultiScore+=MultiMark;
			MultiCrt++;
			}
	}
	for(;i<SingleCnt+MultiCnt+JudgeCnt;i++){
		if(Ans1.elementAt(i).equals(Ans2.elementAt(i))){
			JudgeScore+=JudgeMark;
			JudgeCrt++;
			}
	}
	int TotalScore=SingleScore+MultiScore+JudgeScore;
	String name="",classes="",num="",paperhead="",subjname="",deptname="";
	String NameSql="select name,deptname,class,num from student where username='"+username+"'";
	ResultSet NameRs=db3.executeQuery(NameSql);
	if(NameRs.next()){
		name=new String(NameRs.getString("name").getBytes("GBK"));
		deptname=new String(NameRs.getString("deptname").getBytes("GBK"));
		classes=new String(NameRs.getString("class").getBytes("GBK"));
		num=new String(NameRs.getString("num").getBytes("GBK"));
	}
	NameRs.close();
	db3.closeStmt();
	String PapSql="select paperhead,subjname from paper where paperid="+String.valueOf(session.getAttribute("paperid"));
	ResultSet PapRs=db4.executeQuery(PapSql);
	if(PapRs.next()){
		paperhead=new String(PapRs.getString("paperhead").getBytes("GBK"));
		subjname=new String(PapRs.getString("subjname").getBytes("GBK"));
	}
	PapRs.close();
	db4.closeStmt();
	String ScoreSql="insert score (username,title,score,name,class,num,paperhead,subjname,deptname)values('"+
	username+"','"+title+"','"+TotalScore+"','"+name+"','"+classes+"','"+num+"','"+paperhead+"','"+subjname+
	"','"+deptname+"')";
	db5.executeUpdate(ScoreSql);
	db5.closeStmt();
	String DelSql="delete question where username='"+username+"'";
	db1.executeUpdate(DelSql);
	db1.closeStmt();
	String UpSql="update monitor set state=2 where username='"+username+"'";
	db6.executeUpdate(UpSql);
	db6.closeStmt();
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><p class="style2">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="stulogin.jsp">学生主界面</a>&gt;&gt;考试结果</p></td>
  </tr>
</table>
<table width="50%" border="0" align="center" cellspacing="0">
  <tr>
    <th height="37" colspan="4" scope="col"><font size="+2" color="#FF0000"><%=title%></font></th>
  </tr>
  <tr>
    <th width="26%" scope="col"><div align="right">姓名：</div></th>
    <td width="16%" scope="col"><div align="left"><%=name%></div></td>
    <th width="31%" scope="col"><div align="right">考试成绩：</div></th>
    <td width="27%" scope="col"><div align="left"><%=TotalScore%>分</div></td>
  </tr>
  <tr>
    <th height="15" colspan="4" scope="col"><div align="left"></div></th>
  </tr>
  <tr>
    <th colspan="4" scope="col">&nbsp;</th>
  </tr>
</table>
  <table width="50%" border="1" align="center" cellspacing="1" bordercolor="#799AE1">
  <tr class="trh">
    <th width="105" nowrap scope="col">题型</th>
    <th width="56" nowrap scope="col">题目</th>
    <th width="45" nowrap scope="col">正确</th>
    <th width="45" nowrap scope="col"><p>错误</p></th>
    <th width="45" nowrap scope="col">分值</th>
    <th width="45" nowrap scope="col">得分</th>
  </tr>
  <tr>
    <td nowrap class="trh"><div align="center">单项选择题</div></td>
    <td nowrap class="trh1"><div align="center">共<%=SingleCnt%>题</div></td>
    <td nowrap class="trh1"><div align="center"><%=SingleCrt%></div></td>
    <td nowrap class="trh1"><div align="center"><%=SingleCnt-SingleCrt%></div></td>
    <td nowrap class="trh1"><div align="center"><%=SingleMark%></div></td>
    <td nowrap class="trh1"><div align="center"><%=SingleScore%></div></td>
  </tr>
  <tr>
    <td nowrap class="trh"><div align="center">多项选择题</div></td>
    <td nowrap class="trh1"><div align="center">共<%=MultiCnt%>题</div></td>
    <td nowrap class="trh1"><div align="center"><%=MultiCrt%></div></td>
    <td nowrap class="trh1"><div align="center"><%=MultiCnt-MultiCrt%></div></td>
    <td nowrap class="trh1"><div align="center"><%=MultiMark%></div></td>
    <td nowrap class="trh1"><div align="center"><%=MultiScore%></div></td>
  </tr>
  <tr>
    <td nowrap class="trh"><div align="center">判断题</div></td>
    <td nowrap class="trh1"><div align="center">共<%=JudgeCnt%>题</div></td>
    <td nowrap class="trh1"><div align="center"><%=JudgeCrt%></div></td>
    <td nowrap class="trh1"><div align="center"><%=JudgeCnt-JudgeCrt%></div></td>
    <td nowrap class="trh1"><div align="center"><%=JudgeMark%></div></td>
    <td nowrap class="trh1"><div align="center"><%=JudgeScore%></div></td>
  </tr>
  <tr>
    <td nowrap class="trh"><div align="center" class="style1">总计</div></td>
    <td nowrap class="trh1"><div align="center" class="style1">共<%=SingleCnt+MultiCnt+JudgeCnt%>题</div></td>
    <td nowrap class="trh1"><div align="center" class="style1"><%=SingleCrt+MultiCrt+JudgeCrt%></div></td>
    <td nowrap class="trh1"><div align="center" class="style1"><%=SingleCnt+MultiCnt+JudgeCnt-(SingleCrt+MultiCrt+JudgeCrt)%></div></td>
    <td nowrap class="trh1"><div align="center" class="style1">总分<%=SingleCnt*SingleMark+MultiCnt*MultiMark+JudgeCnt*JudgeMark%></div></td>
    <td nowrap class="trh1"><div align="center" class="style1"><%=TotalScore%></div></td>
  </tr>
</table>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
