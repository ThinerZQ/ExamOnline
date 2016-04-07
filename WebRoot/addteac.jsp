<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="DeptBean" scope="page" class="exam.ExamBean"/>
<title>添加教师帐户</title>
<script language="JavaScript" type="text/JavaScript">
<!-- 
function checkform()
{	
	var f=document.forms[0];
	var usernamelen=f.username.value;
	if(f.password.value!=f.confirmpassword.value)
	{
		alert("两次输入的密码不同，请重新输入！");
		return false;
	}
	if(usernamelen.length<3)
	{
		alert("用户名长度不符合要求，请重新输入！");
		return false;
	}
	if(f.password.value.length<7)
	{
		alert("密码长度太短，请重新输入！");
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
-->
</script>
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
    font-size: 14px;
    font-weight:bold
}
.trh1
{
 
    background-color: #FFFDE8;
    color: #2E60C9;
    font-size: 14px;
    
}
.style1 {font-size: small}
.STYLE2 {font-size: xx-large}
.STYLE3 {
	font-size: xx-large;
	font-weight: bold;
	color: #0033FF;
}
.STYLE4 {color: #000000}
-->
</style></head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==3){
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="568" border="0" align="left" cellspacing="0">
  <tr>
	<td width="568" height="15" nowrap><span class="style1">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="admilogin.jsp">管理员主界面</a>&gt;&gt;<a href="teacmanage.jsp">教师帐户管理</a>&gt;&gt;添加教师帐户</span></td>
  </tr>
</table>
  <form name="form1" method="post" action="addteac2.jsp" onSubmit="return checkform()">
      <p>&nbsp;</p>
      <table width="418" border="1" align="center" cellspacing="1" bordercolor="#799AE1">
      <tr> 
        <th width="98" class="trh" scope="row"><div align="right">用户名：</div></th>
        <td width="310" class="trh1" scope="row"><div align="left"> 
            <input name="username" type="text" size="20" msg="用户名长度少于3个字符">
        <span class="style2 STYLE4">*用户名长度不少于3</span></div></td>
      </tr>
      <tr> 
        <th class="trh" scope="row"><div align="right">新密码：</div></th>
        <td class="trh1" scope="row"><div align="left"> 
            <input name="password" type="password" id="password" size="21" msg="新密码少于7个字符">
            <span class="STYLE4">*不少于7个字符</span></div></td>
      </tr>
      <tr> 
        <th class="trh" scope="row"><div align="right">确认密码：</div></th>
        <td class="trh1" scope="row"><div align="left"> 
            <input name="confirmpassword" type="password" id="confirmpassword" size="21" msg="确认密码不于7个字符">
            <span class="STYLE4">*不少于7个字符</span></div></td>
      </tr>
      <tr> 
        <th class="trh" scope="row"><div align="right">真实姓名：</div></th>
        <td class="trh1" scope="row"><div align="left"> 
            <input name="name" type="text" id="name" size="20" msg="真实姓名为空">
        </div></td>
      </tr>
      <tr> 
        <th class="trh" scope="row"><div align="right">性别：</div></th>
        <td class="trh1" scope="row"><div align="left"> 
            <select name="sex" id="sex">
              <option selected>男</option>
              <option>女</option>
            </select>
        </div></td>
      </tr>
      <tr> 
        <th class="trh" scope="row"><div align="right">部门：</div></th>
        <td class="trh1" scope="row"><select name="deptname">
	      <option selected value="N">--请选择--</option>
			<%
			String sql="select deptname from department";
			ResultSet rs=DeptBean.executeQuery(sql);
			while(rs.next()){
			String deptname=rs.getString(1);
			%>
    	<option  value="<%=deptname%>"><%=deptname%></option>
    	<%}rs.close();
		DeptBean.closeStmt();%>
        </select></td>
      </tr>
      <tr> 
        <th class="trh" scope="row"><div align="right">工作证号：</div></th>
        <td class="trh1" scope="row"><div align="left"> 
            <input name="num" type="text" id="num" size="20" msg="工作证号不能为空">
            <span class="STYLE4">*仅限数字</span> </div></td>
      </tr>
      <tr> 
        <th class="trh" scope="row"><div align="right">E-mail：</div></th>
        <td class="trh1" scope="row"><div align="left"> 
            <input name="email" type="text" id="email" size="20" msg="E-mail地址书写错误">
        </div></td>
      </tr>
      <tr> 
        <th height="21" class="trh" scope="row">
<div align="right">身份：</div></th>
        <td class="trh1" scope="row"><div align="left">教师</div></td>
      </tr>
    </table>
    <p align="center"> 
      <input name="Submit" type="submit" onClick="MM_validateForm('username','','R','name','','R','dept','','R','num','','RisNum','email','','NisEmail','password','','R','confirmpassword','','R');return document.MM_returnValue" value="添加">
      <input type="reset" name="Submit2" value="重置">
    </p>
  </form>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
