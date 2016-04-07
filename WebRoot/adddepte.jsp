<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="deptBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<title>添加部门</title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.style2 {color: #FF0000; font-weight: bold; }
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
.style3 {font-size: small}
.STYLE4 {
	font-size: xx-large;
	color: #3333FF;
	font-weight: bold;
}
.STYLE5 {
	color: #9966FF;
	font-weight: bold;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function check()
{	
	var f=document.forms[0];
	var codelen=f.deptcode.value;
	if(codelen.length<=0||codelen.length>3)
	{
		alert("编号应小于10个字符，请重新输入！");
		return false;
	}
}
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
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
</head>
<%
String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="style3">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="admilogin.jsp">管理员主界面</a>&gt;&gt;院系管理</span></td>
  </tr>
</table>
<br>
<div align="center">
<table width="300" border="0">
  <tr>
    <td bgcolor="#FFFFcc" class="style1"><div align="left" class="STYLE5">现有院系</div></td>
  </tr>
</table>
<table width="300" border="1" cellspacing="1" bordercolor="#799ae1">
  <tr class="trh">
    <th nowrap scope="col">编号</th>
    <th nowrap scope="col">院系</th>
	<th nowrap scope="col">删除</th>
  </tr>
<%
String sql="select * from department";
ResultSet rs=deptBean.executeQuery(sql);
while(rs.next()){
String deptcode=rs.getString("deptcode");
String deptname=rs.getString("deptname");
%>
  <tr class="trh1">
    <td nowrap><div align="center"><%=deptcode%></div></td>
    <td nowrap><div align="center"><%=deptname%></div></td>
	<td nowrap><div align="center"><a href="deldetp.jsp?deptcode=<%=deptcode%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onclick="return confirm('确定要删除吗？');"></a></div></td>
  </tr>
<%}
rs.close();
deptBean.closeStmt();
%>
</table>
<form name="form1" method="post" action="adddept.jsp" onSubmit="return check();">
  <table width="300" border="0">
    <tr bgcolor="#FFFFCC">
      <td colspan="2" nowrap><div align="right"></div>        
        <div align="left" class="STYLE5">添加院系</div></td>
      </tr>
    <tr>
      <td width="82" nowrap bgcolor="#CCFFCC"><div align="right" class="trh">院系编号</div></td>
      <td width="208" nowrap bgcolor="#CCFFCC"><div align="left">
        <input name="deptcode" type="text" size="10">
      </div></td>
    </tr>
    <tr>
      <td nowrap><div align="right" class="trh">新增院系</div></td>
      <td nowrap bgcolor="#CCFFCC">        <div align="left"><span class="style1">
            <input type="text" name="deptname">
        </span></div></td></tr>
    <tr>
      <td bgcolor="#CCFFCC">
        <div align="right">
            <input name="Submit" type="submit" onClick="MM_validateForm('deptcode','','RisNum','deptname','','R');MM_validateForm('deptcode','','RisNum','deptname','','R');return document.MM_returnValue" value="添加">
        </div></td>
      <td bgcolor="#CCFFCC">
        <div align="center">
          <input type="reset" name="Submit2" value="重置">
        </div></td>
    </tr>
  </table>
  </form>
</div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
