<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="queryBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<jsp:useBean id="queryBean2" scope="page" class="exam.ExamBean"></jsp:useBean>
<html>
<title>学生注册</title> 
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function checkform()
{
	var f=document.forms[0];
	if(f.username.value.length<3)
	{
		alert("用户名太短，请重新输入！");
		return false;
	}
	if(f.password.value.length<7)
	{
		alert("密码不能少于7个字符");
		return false;
	}
	if(f.password.value!=f.confirmpassword.value)
	{
		alert("两次输入的密码不同，请重新输入！");
		return false;
	}

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
  } if (errors) alert('发生以下错误:\n'+errors);
  document.MM_returnValue = (errors == '');
}

function MM_openBrWindow() { //v2.0
var gt = unescape('%3e');
var popup = null;
var over = "Launch Pop-up Navigator";
var f=document.forms[0];
popup = window.open('', '用户名检查结果', 'width=500,height=250,resizable=1,scrollbars=auto');
if (popup != null) {
	if (popup.opener == null) {
		popup.opener = self; 
	}
	popup.location.href ="check.jsp?username="+f.username.value;
  }
}
//-->
</script>
<style type="text/css">
<!--
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.trh
{
    background-color: #6699ff;
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
.style1 {color: #FFFFFF}
.STYLE2 {
	font-size: x-large;
	color: #0000FF;
}
.STYLE4 {color: #000000; }
-->
</style>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<center>
<form action="regist1.jsp" method="post" name="form1" target="_blank" id="form1"  onSubmit="return checkform();">
    <table width="64%" height="435" border="1" align="center" cellpadding=2 cellspacing="1" bordercolor="#799AE1" >
      <tr align="center" bgColor="#FFFFCC">
    <td height=64 colSpan=4 align="center" bgcolor="#6783D1" class="trh" >
	<h1>学生信息注册</h1>
        <h4><font color="red" face="宋体">前面带*的必须填写</font></h4>    </td>
<tr>
        <td width="33%" height=35 align="right" class="trh"><span class="style1">*用户名：</span></td>
        <td height=35 colSpan=2 class="trh1"> <input name="username" type="text" size="20" msg="用户名不能为空"></td>
        <td width="24%" height=35 class="trh1"> <a href="javascript:MM_openBrWindow()" class="STYLE4">查看是否被占用</a></td>
</tr>
<tr>
    <td height=30 align="right" class="trh"><span class="style1">*密  码：</span></td>
    <td height=30 colSpan=3 class="trh1"><input name="password" type="password"  id="password" size="20" msg="密码少于7个字符"></td>
</tr>
<tr>
    <td height=30 align="right" class="trh"><span class="style1">*确认密码：</span></td>
    <td height=30 colSpan=3 class="trh1"><input name="confirmpassword" type="password" id="confirmpassword" size="20" msg="确认密码不于7个字符"></td>
</tr>
<tr>
    <td height=30 align="right" class="trh"><span class="style1">真实姓名：</span></td>
    <td height=30 colSpan=3 class="trh1"><input name="name" type="text" id="name" size="0" msg="真实姓名为空"></td>
</tr>
<tr>
        <td height=30 colSpan=1 align="right" nowrap class="trh"><span class="style1">出生年月：</span></td>
        <td width="22%" height=30 colSpan=1 nowrap class="trh1">
<select name="year" size="1" >
            <option value="1979" selected>1979 </option>
            <option value="1980">1980 </option>
            <option value="1981">1981 </option>
            <option value="1982">1982 </option>
            <option value="1983">1983 </option>
            <option value="1984">1984 </option>
            <option value="1985">1985 </option>
            <option value="1986">1986 </option>
			<option value="1987">1987 </option>
			<option value="1988">1988 </option>
			<option value="1989">1989 </option>
			<option value="1990">1990 </option>
        </select>
<span class="STYLE4">年</span></td>

        <td width="21%" height=30 colspan=1 align="center" nowrap class="trh1"><select name="month" size="1" >
          <option value="1" selected>1 </option>
          <option value="2">2 </option>
          <option value="3">3 </option>
          <option value="4">4 </option>
          <option value="5">5 </option>
          <option value="6">6 </option>
          <option value="7">7 </option>
          <option value="8">8 </option>
          <option value="9">9 </option>
          <option value="10">10 </option>
          <option value="11">11 </option>
          <option value="12">12 </option>
        </select>
        <span class="STYLE4">月</span></td>

        <td height=30 colspan=1 align="left" nowrap class="trh1">
<select name="day" size="1">
            <option value="1" selected>1 </option>
            <option value="2">2 </option>
            <option value="3">3 </option>
            <option value="4">4 </option>
            <option value="5">5 </option>
            <option value="6">6 </option>
            <option value="7">7 </option>
            <option value="8">8 </option>
            <option value="9">9 </option>
            <option value="10">10 </option>
            <option value="11">11 </option>
            <option value="12">12 </option>
            <option value="13">13 </option>
            <option value="14">14 </option>
            <option value="15">15 </option>
            <option value="16">16 </option>
            <option value="17">17 </option>
            <option value="18">18 </option>
            <option value="19">19 </option>
            <option value="20">20 </option>
            <option value="21">21 </option>
            <option value="22">22 </option>
            <option value="23">23 </option>
            <option value="24">24 </option>
            <option value="25">25 </option>
            <option value="26">26 </option>
            <option value="27">27 </option>
            <option value="28">28 </option>
            <option value="29">29 </option>
            <option value="30">30 </option>
            <option value="31">31 </option>
        </select>
<span class="STYLE4">日</span></td>
</tr>
<tr>
    <td height=30 align="right" class="trh"><span class="style1">性  别：</span></td>
    <td height=30 colSpan=3 class="trh1"><select name="sex" size="1" id="sex" >
            <option value="男" selected>男</option>
	<option value="女">女</option>
     </select></td>
</tr>
<tr>
    <td height=30 align="right" class="trh" ><span class="style1">*学  院：</span></td>
    <td height=30 colSpan=3 class="trh1">
	<select name="deptname" size="1" id="deptname">
    <%
	String sql1="select deptname from department";
	ResultSet rs1=queryBean.executeQuery(sql1);
	while(rs1.next()){
	String deptname=rs1.getString("deptname");
	%>
    <option selected><%=deptname%></option>
    <%}rs1.close();queryBean.closeStmt();
	%>
    </select></td>
</tr>
<tr>
    <td height=30 align="right" class="trh"><span class="style1">*专  业：</span></td>
    <td height=30 colSpan=3 class="trh1"><input name="profession" id="profession" size="20" msg="专业不能为空"></td>
</tr>
<tr>
    <td height=30 align="right" class="trh"><span class="style1">*班  级：</span></td>
    <td height=30 colSpan=3 class="trh1">
	<select name="classes" size="1" id="classes">
		  <%
		  String ClassSql="select classname from classes";
		  ResultSet ClassRs=queryBean2.executeQuery(ClassSql);
		  while(ClassRs.next()){
		  	String classname=new String(ClassRs.getString("classname").getBytes("GBK"));
		  %>
            <option selected><%=classname%></option>
			<%}ClassRs.close();
			queryBean2.closeStmt();
			%>
        </select></td>
</tr>
<tr>
    <td height=30 align="right" class="trh"><span class="style1">*学  号：</span></td>
    <td height=30 colSpan=3 class="trh1"><input name="num" type="text" id="num" size="20" msg="学号必须填写数字"></td>
</tr>
<tr>
    <td height=30 align="right" class="trh"><span class="style1">E-MAIL：</span></td>
    <td height=30 colSpan=3 class="trh1"><input name="email" type="text" size="20" msg="E-mail地址书写错误"></td>
</tr>
</table>
<br>
    <input name="" type="submit" onClick="MM_validateForm('username','','R','name','','R','profession','','R','num','','RisNum','email','','NisEmail','password','','R','confirmpassword','','R','profession','','R');return document.MM_returnValue" value="提交">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="重置" type="reset" value="重置">
    &nbsp;
</form>
</center>
</body>
</html>