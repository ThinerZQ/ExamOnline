<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="QueryBean1" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="QueryBean2" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="QueryBean3" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="QueryBean4" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="QueryBean5" scope="page" class="exam.ExamBean"/>

<title>�ɼ���ѯ</title>
<style type="text/css">
<!--
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
    font-size: 15px;
    
}
.style1 {font-size: small}
.STYLE2 {
	font-size: xx-large;
	color: #0033FF;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.msg; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+'\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+'\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+'\n'; }
  } if (errors) alert('�������´���:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
</head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==1){
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><p class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="stulogin.jsp">ѧ��������</a>&gt;&gt;�ɼ���ѯ</p>
    </td>
  </tr>
</table>
<br>
<table width="55%" border="1" align="center" cellspacing="1" bordercolor="#799AE1">
  <tr class="trh">
    <td colspan="4"><div align="left" class="trh"><%=username%>�����������п��Եĳɼ���¼</div></td>
  </tr>
  <tr class="trh">
    <th width="23%" nowrap><div align="center">�û���</div></th>
    <th width="23%" nowrap><div align="center">����</div></th>
    <th width="37%" nowrap><div align="center">�Ծ����</div></th>
    <th width="17%" nowrap><div align="center">�ɼ�</div></th>
  </tr>
  <%
String subjname="";
String name="";
String sql1="select name from student where username='"+username+"'";
ResultSet rs1=QueryBean1.executeQuery(sql1);
if(rs1.next()){name=new String(rs1.getString("name").getBytes("GBK"));}
rs1.close();QueryBean1.closeStmt();
String sql2="select title,score from score where username='"+username+"'";
ResultSet rs2=QueryBean2.executeQuery(sql2);
while(rs2.next()){
	String title=new String(rs2.getString("title").getBytes("GBK")); 
	int score=rs2.getInt("score");
%>
  <tr class="trh1">
    <td nowrap><div align="center"><%=username%></div></td>
    <td nowrap><div align="center"><%=name%></div></td>
    <td nowrap><div align="center"><%=title%></div></td>
    <td nowrap><div align="center"><%=score%></div></td>
  </tr>
  <%}rs2.close();%>
</table>
<!--<form name="form1" method="post" action="queryscore_advance.jsp">
  <table width="55%" border="1" align="center" cellspacing="1" bordercolor="#799AE1">
    <tr>
      <td colspan="4" class="trh">�߼���ѯ</td>
    </tr>
    <tr>
      <td width="13%" class="trh"><div align="right">Ժϵ</div></td>
      <td width="28%" class="trh1"><select name="deptname" id="deptname">
          <option selected>--��ѡ��--</option>
          <%
			String sql3="select deptname from department";
			ResultSet rs3=QueryBean3.executeQuery(sql3);
			while(rs3.next()){
			String deptname=new String(rs3.getString("deptname").getBytes("GBK"));
		  %>
          <option><%=deptname%></option>
          <%}rs3.close();QueryBean3.closeStmt();%>
      </select></td>
      <td width="18%" class="trh"><div align="right">��Ŀ</div></td>
      <td width="41%" class="trh1"><select name="subjname" id="subjname">
          <option selected>--��ѡ��--</option>
          <%
			String sql4="select subjname from subject";
			ResultSet rs4=QueryBean4.executeQuery(sql4);
			while(rs4.next()){
			subjname=new String(rs4.getString("subjname").getBytes("GBK"));
		  %>
          <option><%=subjname%></option>
          <%}rs4.close();QueryBean4.closeStmt();%>
      </select></td>
    </tr>
    <tr>
      <td class="trh"><div align="right">�༶</div></td>
      <td class="trh1"><select name="classes" size="1" id="classes">
        <option selected>--��ѡ��--</option>
		  <%
		  String ClassSql="select classname from classes";
		  ResultSet ClassRs=QueryBean5.executeQuery(ClassSql);
		  while(ClassRs.next()){
		  	String classname=new String(ClassRs.getString("classname").getBytes("GBK"));
		  %>
		  <option><%=classname%></option>
			<%}ClassRs.close();QueryBean5.closeStmt();
			%>
      </select></td>
      <td class="trh"><div align="right">�Ծ�����</div></td>
      <td class="trh1"><select name="ptype" size="1" id="ptype">
        <option>�׶β���</option>
        <option>���п���</option>
        <option>��ĩ����</option>
        <option selected>--��ѡ��--</option>
      </select></td>
    </tr>
    <tr>
      <td class="trh"><div align="right">ѧ��</div></td>
      <td class="trh1"><input name="num" type="text" id="num" size="15" msg="ѧ�ű�����д����"></td>
      <td class="trh"><div align="right">�Ծ����</div></td>
      <td class="trh1"><select name="title" size="1" id="title">
        <option selected>--��ѡ��--</option>
		  <%
		  String PapSql="select title from score group by title";
		  ResultSet PapRs=QueryBean2.executeQuery(PapSql);
		  while(PapRs.next()){
		  	String PapName=new String(PapRs.getString("title").getBytes("GBK"));
		  %>
		  <option><%=PapName%></option>
			<%}PapRs.close();
			QueryBean2.closeStmt();
			%>
      </select></td>
    </tr>
    <tr>
      <td class="trh"><div align="right">����</div></td>
      <td class="trh1"><input name="name" type="text" id="name" size="15"></td>
      <td class="trh"><div align="right">�ɼ���Χ</div></td>
      <td class="trh1">����
          <input name="small" type="text" id="small" size="4" msg="�ɼ���Χֻ����д����">
      ��С��
      <input name="big" type="text" id="big" size="4" msg="�ɼ���Χֻ����д����"></td>
    </tr>
  </table>
  <p align="center">
    <input name="Submit" type="submit" onClick="MM_validateForm('num','','NisNum','small','','NisNum','big','','NisNum');return document.MM_returnValue" value="��ѯ">
    <input type="reset" name="Submit" value="����">	
  </p>
</form>  -->
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
