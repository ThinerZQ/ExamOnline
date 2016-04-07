<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="ShowPaperBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="QueryBean" scope="page" class="exam.ExamBean"/>
<title>试卷预览</title>
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
.style2 {font-size: small}
.STYLE3 {
	font-size: xx-large;
	color: #0033FF;
}
.STYLE4 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style></head>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");


String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==2){
	String paperid=request.getParameter("paperid");
	session.setAttribute("paperid",paperid);
	String username=String.valueOf(session.getAttribute("username"));
	Vector SingleIdVector=new Vector();
	Vector MultiIdVector=new Vector();
	Vector JudgeIdVector=new Vector();
	int single=0;
	int multi=0;
	int judge=0;
	int singlemark=0;
	int multimark=0;
	int judgemark=0;
	int questionid=0;
	int paperstate=0;
	int time=0;
	int Sequence=0;
	String subjname="";
	String deptname="";
	String paperhead="";
	String creatby="";
	String PaperSql="select * from paper where paperid='"+paperid+"'";
	System.out.println(paperid);
	ResultSet PaperRs=ShowPaperBean.executeQuery(PaperSql);
	while(PaperRs.next()){
		paperhead= PaperRs.getString("paperhead") ;
		subjname= PaperRs.getString("subjname") ;
		deptname= PaperRs.getString("deptname") ;
		
		time=PaperRs.getInt("time");
		single=PaperRs.getInt("single");
		singlemark=PaperRs.getInt("singlemark");
		multi=PaperRs.getInt("multi");
		multimark=PaperRs.getInt("multimark");
		judge=PaperRs.getInt("judge");
		judgemark=PaperRs.getInt("judgemark");
	}
	PaperRs.close();
	ShowPaperBean.closeStmt();
	String	title=deptname+subjname+paperhead;
	session.setAttribute("title",title);
	String question="";
	String option1="";
	String option2="";
	String option3="";
	String option4="";
	String answer="";
	String type="";
	%>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><span class="style2">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="teaclogin.jsp">教师主界面</a>&gt;&gt;<a href="paperstate.jsp">发布试卷</a>&gt;&gt;试卷预览</span></td>
  </tr>
</table>	  
<table width="90%" border="0" align="center" cellspacing="0">
		<tr>
		  <td colspan="2"><div align="center"><font size="+2" color="#FF0000"><%=title%></font></div></td>
		</tr>
		<tr>
		  <td colspan="2" bgcolor="#3399ff"><span class="STYLE4"> 单项选择题</span></td>
		</tr>
	<%
	//single
	try{
		if(single>0){
			String sql2="select sequence from pool where subj='"+subjname+"'and type='单项选择题'";
			ResultSet rs2=QueryBean.executeQuery(sql2);
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
			System.out.println(SingleIdVector.elementAt(i));
				String sql3="select * from pool where sequence="+String.valueOf(SingleIdVector.elementAt(i));
				ResultSet rs3=QueryBean.executeQuery(sql3);
				if(rs3.next()){
					Sequence++;
					String qst=new String(rs3.getString("question").getBytes("GBK"));
					question=qst.replace('\'','\"');
					option1=new String(rs3.getString("option1").getBytes("GBK"));
					option2=new String(rs3.getString("option2").getBytes("GBK"));
					option3=new String(rs3.getString("option3").getBytes("GBK"));
					option4=new String(rs3.getString("option4").getBytes("GBK"));
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
	<%
				}rs3.close();
			}
		}
	}catch(NumberFormatException ex1){};
	//multi
	%>
		<tr bgcolor="#6699FF">
		  <td colspan="2" bgcolor="#3399ff"><span class="STYLE4"> 多项选择题</span></td>
		</tr>
	<%
	try{
		if(multi>0){
			String sql5="select sequence from pool where subj='"+subjname+"'and type='多项选择题'";
			ResultSet rs5=QueryBean.executeQuery(sql5);
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
				ResultSet rs6=QueryBean.executeQuery(sql6);
				if(rs6.next()){
					Sequence++;
					String qst=new String(rs6.getString("question").getBytes("GBK"));
					question=qst.replace('\'','\"');
					option1=rs6.getString("option1");
					option2=rs6.getString("option2");
					option3=rs6.getString("option3");
					option4=rs6.getString("option4");
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
	<%			
				}rs6.close();
			}
		}
	}catch(NumberFormatException ex2){};
	//judge
	%>
		<tr bgcolor="#6699FF">
		  <td colspan="2" bgcolor="#3399ff"><span class="STYLE4"> 判断题</span></td>
		</tr>
	<%
	try{
		if(judge>0){
			String sql8="select sequence from pool where subj='"+subjname+"'and type='判断题'";
			ResultSet rs8=QueryBean.executeQuery(sql8);
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
				ResultSet rs9=QueryBean.executeQuery(sql9);
				if(rs9.next()){
					Sequence++;
					String qst=new String(rs9.getString("question").getBytes("GBK"));
					question=qst.replace('\'','\"');
					option1=rs9.getString("option1");
					option2=rs9.getString("option2");
					option3=rs9.getString("option3");
					option4=rs9.getString("option4");
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
	<%
				}rs9.close();
			}
		}
	}catch(NumberFormatException ex3){};
		QueryBean.closeStmt();
%>
</table>
 <%}
else response.sendRedirect("index.jsp");
%>
</body>

</html>
