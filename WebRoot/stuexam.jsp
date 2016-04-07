<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="PaperBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="MonitorBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="PoolBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="QuestBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="StuBean" scope="page" class="exam.ExamBean"/>
<script language="javascript" type="text/javascript">
<!--
function submitit(){
if (confirm("确认无误？")){ 
return true;
  }
return false;
}
-->
</script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
</script>
<style type="text/css">
<!--
.STYLE2 {
	font-size: xx-large;
	color: #0033FF;
}
-->
</style>
<Script Language="JavaScript" type="text/javascript">
<!-- 
function display(){
rtime=etime-ctime;
if(rtime>3600)
	var h=parseInt(rtime/3600);
else
	var h=0
if (rtime>60){
	m=parseInt(rtime/60-h*60);
		if(m<10)
			m="0"+m
}
else{
	m=0
}
s=parseInt(rtime-h*3600-m*60);
if(s<10)
	s="0"+s;
window.document.all("timer").innerText="剩余时间: "+h+"时"+m+"分"+s+"秒"
window.setTimeout("checktime()",1000)
}

function settimes(times){
var time= new Date();
hours= time.getHours();
mins= time.getMinutes();
secs= time.getSeconds();
etime=hours*3600+mins*60+secs;
this.tt=times
etime+=tt*60;  
checktime();
}

function checktime(){
var time= new Date();
hours= time.getHours();
mins= time.getMinutes();
secs= time.getSeconds();
ctime=hours*3600+mins*60+secs
if(ctime>=etime){
expired();
}
else
display();
}
function expired(){
alert("考试时间到，点击“确定”后系统将自动交卷！");
document.form1.submit()
}
//-->
</Script>
<script language="javascript" type="text/javascript">
var delay_time=50;
var YY=0;
function reloc(){
	YY=document.body.clientHeight;
	timer.style.top=400;
}
function loopfun(){
	reloc();
	setTimeout('loopfun()',delay_time);
}
function helpor()
{
if (event.button==2)
	alert("该页无法保存！")
}
</script>
<title>学生考试界面</title>
<style type="text/css">
<!--
.style1 {
	font-size: 12px;
	color: #FF0000;
}
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
	color: #FFFFFF;
	font-size: 18px;
	text-decoration: blink;    
}
-->
</style></head>
<%
String username=(String)session.getAttribute("username");
String load=(String)session.getAttribute("loaded");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==1){
	String CheckSql="select * from monitor where username='"+username+"'";
	ResultSet CheckRs=MonitorBean.executeQuery(CheckSql);
	if(load==null){
		if (!CheckRs.next()){
			int single=0;
			int multi=0;
			int judge=0;
			int singlemark=0;
			int multimark=0;
			int judgemark=0;
			int questionid=0;
			int paperstate=0;
			int time=0;
			String subjname="";
			String deptname="";
			String paperhead="";
			String creatby="";
			String paperid=request.getParameter("paperid");
			String PaperSql="select * from paper where paperid='"+paperid+"'";
			ResultSet PaperRs=PaperBean.executeQuery(PaperSql);
			while(PaperRs.next()){
				paperhead=new String (PaperRs.getString("paperhead").getBytes("GBK"));
				subjname=new String (PaperRs.getString("subjname").getBytes("GBK"));
				deptname=new String (PaperRs.getString("deptname").getBytes("GBK"));
				time=PaperRs.getInt("time");
				single=PaperRs.getInt("single");
				singlemark=PaperRs.getInt("singlemark");
				multi=PaperRs.getInt("multi");
				multimark=PaperRs.getInt("multimark");
				judge=PaperRs.getInt("judge");
				judgemark=PaperRs.getInt("judgemark");
			}
			PaperRs.close();
			PaperBean.closeStmt();
	%>
<body  onLoad="MM_callJS('javascript:window.history.forward(1);');settimes(<%=time%>)" onmousedown="helpor()">
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<%
session.setAttribute("loaded",username+"lod");
session.setAttribute("paperid",paperid);
Vector SingleIdVector=new Vector();
Vector MultiIdVector=new Vector();
Vector JudgeIdVector=new Vector();
String	title=deptname+subjname+paperhead;
session.setAttribute("title",title);
String question="";
String option1="";
String option2="";
String option3="";
String option4="";
String answer="";
String type="";
//single
try{
	if(single>0){
		String sql2="select sequence from pool where subj='"+subjname+"'and type='单项选择题'";
		ResultSet rs2=PoolBean.executeQuery(sql2);
		while (rs2.next()){
			SingleIdVector.addElement(new Integer(rs2.getInt("sequence")));
		}
		rs2.close();
		for(int i=0;i<SingleIdVector.size()/2;i++){
			int rd1=(int)(Math.random()*SingleIdVector.size());
			int rd2=(int)(Math.random()*SingleIdVector.size());
			//swap
			int temp=Integer.parseInt(String.valueOf(SingleIdVector.elementAt(rd1)));
			SingleIdVector.setElementAt(SingleIdVector.elementAt(rd2),rd1);
			SingleIdVector.setElementAt(new Integer(temp),rd2);
		}
		for (int i=0;i<single;i++){
			String sql3="select * from pool where sequence="+String.valueOf(SingleIdVector.elementAt(i));
			ResultSet rs3=PoolBean.executeQuery(sql3);
			if(rs3.next()){
				questionid=rs3.getInt("sequence");
				type=new String(rs3.getString("type").getBytes("GBK"));
				String qst=new String(rs3.getString("question").getBytes("GBK"));
				question=qst.replace('\'','\"');
				option1=new String(rs3.getString("option1").getBytes("GBK"));
				option2=new String(rs3.getString("option2").getBytes("GBK"));
				option3=new String(rs3.getString("option3").getBytes("GBK"));
				option4=new String(rs3.getString("option4").getBytes("GBK"));
				answer=rs3.getString("answer");
				rs3.close();
				String sql4="insert question (questionid,paperid,question,option1,option2,option3,option4,answer,mark,type,username)values('"+
				questionid+"','"+paperid+"','"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+answer+"','"+singlemark+"','"+type+"','"+username+"')";
				QuestBean.executeUpdate(sql4);
			}
		}
	}
}catch(NumberFormatException ex1){};
//multi
try{
	if(multi>0){
		String sql5="select sequence from pool where subj='"+subjname+"'and type='多项选择题'";
		ResultSet rs5=PoolBean.executeQuery(sql5);
		while (rs5.next()){
			MultiIdVector.addElement(new Integer(rs5.getInt("sequence")));
		}
		rs5.close();
		for(int i=0;i<MultiIdVector.size()/2;i++){
			int rd1=(int)(Math.random()*MultiIdVector.size());
			int rd2=(int)(Math.random()*MultiIdVector.size());
			//swap
			int temp=Integer.parseInt(String.valueOf(MultiIdVector.elementAt(rd1)));
			MultiIdVector.setElementAt(MultiIdVector.elementAt(rd2),rd1);
			MultiIdVector.setElementAt(new Integer(temp),rd2);
		}
		for (int i=0;i<multi;i++){
			String sql6="select * from pool where sequence="+String.valueOf(MultiIdVector.elementAt(i));
			ResultSet rs6=PoolBean.executeQuery(sql6);
			if(rs6.next()){
				questionid=rs6.getInt("sequence");
				type=rs6.getString("type");
				question=rs6.getString("question");
				option1=rs6.getString("option1");
				option2=rs6.getString("option2");
				option3=rs6.getString("option3");
				option4=rs6.getString("option4");
				answer=rs6.getString("answer");
				rs6.close();
				String sql7="insert question (questionid,paperid,question,option1,option2,option3,option4,answer,mark,type,username)values('"+
				questionid+"','"+paperid+"','"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+answer+"','"+multimark+"','"+type+"','"+username+"')";
				QuestBean.executeUpdate(sql7);
			}
		}
	}
}catch(NumberFormatException ex2){};
//judge
try{
	if(judge>0){
		String sql8="select sequence from pool where subj='"+subjname+"'and type='判断题'";
		ResultSet rs8=PoolBean.executeQuery(sql8);
		while (rs8.next()){
			JudgeIdVector.addElement(new Integer(rs8.getInt("sequence")));
		}
		rs8.close();
		for(int i=0;i<JudgeIdVector.size()/2;i++){
			int rd1=(int)(Math.random()*JudgeIdVector.size());
			int rd2=(int)(Math.random()*JudgeIdVector.size());
			//swap
			int temp=Integer.parseInt(String.valueOf(JudgeIdVector.elementAt(rd1)));
			JudgeIdVector.setElementAt(JudgeIdVector.elementAt(rd2),rd1);
			JudgeIdVector.setElementAt(new Integer(temp),rd2);
		}
		for (int i=0;i<judge;i++){
			String sql9="select * from pool where sequence="+String.valueOf(JudgeIdVector.elementAt(i));
			ResultSet rs9=PoolBean.executeQuery(sql9);
			if(rs9.next()){
				questionid=rs9.getInt("sequence");
				subjname=rs9.getString("subj");
				type=rs9.getString("type");
				question=rs9.getString("question");
				option1=rs9.getString("option1");
				option2=rs9.getString("option2");
				option3=rs9.getString("option3");
				option4=rs9.getString("option4");
				answer=rs9.getString("answer");
				String sql10="insert question (questionid,paperid,question,option1,option2,option3,option4,answer,mark,type,username)values('"+
				questionid+"','"+paperid+"','"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+answer+"','"+judgemark+"','"+type+"','"+username+"')";
				QuestBean.executeUpdate(sql10);
			}rs9.close();
		}
	}
}catch(NumberFormatException ex3){};
PoolBean.closeStmt();
String name="",classes="",num="",dept="",profession="";
String NSql="select * from student where username='"+username+"'";
ResultSet Nrs=StuBean.executeQuery(NSql);
if(Nrs.next()){
	name=new String(Nrs.getString("name").getBytes("GBK"));
	dept=new String(Nrs.getString("deptname").getBytes("GBK"));
	profession=new String(Nrs.getString("profession").getBytes("GBK"));
	classes=new String(Nrs.getString("class").getBytes("GBK"));
	num=new String(Nrs.getString("num").getBytes("GBK"));
	}
Nrs.close();
StuBean.closeStmt();
String MSql="insert monitor (num,username,name,papertitle,state,paperid)values('"+num+"','"+username+"','"+name+"','"+title+"','"+1+"','"+paperid+"')";
MonitorBean.executeUpdate(MSql);
int Sequence=0;
%>
<form name="form1" method="post" action="submit.jsp" onsubmit="return submitit();">
  <table width="90%" border="0" align="center" cellspacing="0">
    <tr>
      <td colspan="2"><div align="center" class="trh"><font size="+2" color="#FF0000"><%=title%></font></div></td>
    </tr>
    <tr>
      <td colspan="2"><div align="right"><strong>院系：</strong><%=dept%>||<strong><strong>专业：</strong></strong><%=profession%>||<strong>班级：</strong><%=classes%>||<strong>学号：</strong><%=num%>||<strong>姓名：</strong><%=name%></div></td>
    </tr>
<%
String SingleSql="select questionid,question,option1,option2,option3,option4 from question where paperid='"+paperid
	+"'and type='单项选择题' and username='"+username+"'";
	ResultSet SingleRs=QuestBean.executeQuery(SingleSql);
	if(SingleRs.next()){
%>
    <tr>
      <td colspan="2" bgcolor="#6699FF"><strong> 单项选择题</strong></td>
    </tr>
<%

//SingleRs.beforeFirst();
SingleRs=QuestBean.executeQuery(SingleSql);
while(SingleRs.next()){
	Sequence++;
	String qst=new String(SingleRs.getString("question").getBytes("GBK"));
	question=qst.replace('\"','\'');
	option1=new String(SingleRs.getString("option1").getBytes("GBK"));
	option2=new String(SingleRs.getString("option2").getBytes("GBK"));
	option3=new String(SingleRs.getString("option3").getBytes("GBK"));
	option4=new String(SingleRs.getString("option4").getBytes("GBK"));
%>
    <tr>
      <td colspan="2"><%=Sequence%>. <%=question%></td>
    </tr>
    <tr>
      <td width="41%"><input type="radio" name="Q<%=Sequence%>" value="A">
A. <%=option1%></td>
      <td width="41%"><input type="radio" name="Q<%=Sequence%>" value="B">
      B. <%=option2%></td>
    </tr>
    <tr>
      <td><input type="radio" name="Q<%=Sequence%>" value="C">
C. <%=option3%></td>
      <td><input type="radio" name="Q<%=Sequence%>" value="D">
      D. <%=option4%></td>
    </tr>
<%}}
	String MultiSql="select questionid,question,option1,option2,option3,option4 from question where paperid='"+paperid
	+"'and type='多项选择题' and username='"+username+"'";
	ResultSet MultiRs=QuestBean.executeQuery(MultiSql);
	if(MultiRs.next()){
%>
    <tr bgcolor="#6699FF">
      <td colspan="2"><strong> 多项选择题</strong></td>
    </tr>
<%
//MultiRs.beforeFirst();
MultiRs = QuestBean.executeQuery(SingleSql);
while(MultiRs.next()){
	Sequence++;
	question=new String(MultiRs.getString("question").getBytes("GBK"));
	option1=new String(MultiRs.getString("option1").getBytes("GBK"));
	option2=new String(MultiRs.getString("option2").getBytes("GBK"));
	option3=new String(MultiRs.getString("option3").getBytes("GBK"));
	option4=new String(MultiRs.getString("option4").getBytes("GBK"));
%>
    <tr>
      <td colspan="2"><%=Sequence%>. <%=question%></td>
    </tr>
    <tr>
      <td><input name="Q<%=Sequence%>" type="checkbox" id="Q<%=Sequence%>" value="A">
A. <%=option1%></td>
      <td><input name="Q<%=Sequence%>" type="checkbox" id="Q<%=Sequence%>" value="B">
      B. <%=option2%></td>
    </tr>
    <tr>
      <td><input name="Q<%=Sequence%>" type="checkbox" id="Q<%=Sequence%>" value="C">
C. <%=option3%></td>
      <td><input name="Q<%=Sequence%>" type="checkbox" id="Q<%=Sequence%>" value="D">
      D. <%=option4%></td>
    </tr>
<%}}
	String JudgeSql="select questionid,question,option1,option2,option3,option4 from question where paperid='"+paperid
	+"'and type='判断题' and username='"+username+"'";
	ResultSet JudgeRs=QuestBean.executeQuery(JudgeSql);
	if(JudgeRs.next()){
%>
    <tr bgcolor="#6699FF">
      <td colspan="2"><strong> 判断题</strong></td>
    </tr>
<%
//JudgeRs.beforeFirst();
JudgeRs=QuestBean.executeQuery(JudgeSql);
while(JudgeRs.next()){
	Sequence++;
	question=new String(JudgeRs.getString("question").getBytes("GBK"));
	option1=new String(JudgeRs.getString("option1").getBytes("GBK"));
	option2=new String(JudgeRs.getString("option2").getBytes("GBK"));
	option3=new String(JudgeRs.getString("option3").getBytes("GBK"));
	option4=new String(JudgeRs.getString("option4").getBytes("GBK"));
%>
    <tr>
      <td colspan="2"><%=Sequence%>. <%=question%></td>
    </tr>
    <tr>
      <td><input type="radio" name="Q<%=Sequence%>" value="A">
对</td>
      <td><input type="radio" name="Q<%=Sequence%>" value="B">
      错</td>
    </tr>
<%}}
	SingleRs.close();
	MultiRs.close();
	JudgeRs.close();
	QuestBean.closeStmt();
%>
  </table>
  <p align="center">
    <input type="submit" name="Submit" value="交卷"></p>
</form>
</body>
<%		}else {
			out.println("<script language=\"javascript\">"+"\n");
			out.println("alert(\"你已经参加过此次考试，不能重复参加考试！请与管理员联系。\")");
			out.println("window.location.replace(\"stulogin.jsp\")"+"\n</script>");
		}
	}else if(load.equals(username+"lod")){
		out.println("<script language=\"javascript\">"+"\n");
		out.println("alert(\"禁止刷新！请与管理员联系。你需要重新登录\")");
		out.println("window.location.replace(\"logout.jsp\")"+"\n</script>");
	}
	CheckRs.close();
	MonitorBean.closeStmt();
}
else{
	response.sendRedirect("index.jsp");
	}
%>
</html>
