<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="QueryTchBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="DeptBean" scope="page" class="exam.ExamBean"/>
<title>�޸���Ϣ</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function checkform()
{	
	var f=document.forms[0];
	var username=f.username.value;
	if(f.password.value!=f.confirmpassword.value)
	{ 
		alert("������������벻ͬ�����������룡");
		return false;
	}
	if(username.length<3||username.length>20)
	{
		alert("�û������Ȳ�����Ҫ�����������룡");
		return false;
	}
	if(f.password.value.length<7)
	{
		alert("���볤��̫�̣����������룡");
		return false;
	}
	if(f.deptname.value=="N")
	{
		alert("��ѡ��Ժϵ���ƣ�");
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
  } if (errors) alert('�������´���:\n'+errors);
  document.MM_returnValue = (errors == '');
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
.style1 {font-size: small}
.STYLE2 {
	font-size: xx-large;
	color: #0033FF;
}
.STYLE3 {color: #000000}
-->
</style></head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	String name="";
	String sex="";
	String password="";
	String deptname="";
	String num="";
	String email="";
	String username=request.getParameter("username");
	String sql="select * from teacher where username='"+username+"'";
	ResultSet rs=QueryTchBean.executeQuery(sql);
	while (rs.next()){
		password=new String (rs.getString("password").getBytes("GBK"));
		name=new String (rs.getString("name").getBytes("GBK"));
		sex=new String (rs.getString("sex").getBytes("GBK"));
		deptname=new String (rs.getString("dept").getBytes("GBK"));
		num=new String (rs.getString("num").getBytes("GBK"));
		email=new String (rs.getString("email").getBytes("GBK"));
	}
	rs.close();
	QueryTchBean.closeStmt();
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="90%" border="0" cellspacing="0">
  <tr>
	<td width="520" height="13" nowrap><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="admilogin.jsp">����Ա������</a>&gt;&gt;<a href="teacmanage.jsp">��ʦ�ʻ�����</a>&gt;&gt;<a href="teacinfo.jsp?username=<%=username%>">��ʦ��Ϣ</a>&gt;&gt;�޸���Ϣ</span></td>
  </tr>
</table>
<br>
<div align="center">
  <form name="form1" method="post" action="teacupdate.jsp" onSubmit="return checkform();">
    <table width="430" border="1" cellspacing="1" bordercolor="#799ae1">
      <tr>
        <th width="99" class="trh" scope="row"><div align="right">�û�����</div></th>
        <td width="321" class="trh1" scope="row"><div align="left"><input name="username" type="text"value="<%=username%>" size="20" msg="�û�����������3���ַ�">
          <span class="STYLE3">        *������3���ַ�</span></div></td>
      </tr>
      <tr>
        <th class="trh" scope="row"><div align="right">�����룺</div></th>
        <td class="trh1" scope="row"><div align="left">
          <input name="password" type="password" id="password" size="21" value=<%=password%> msg="����������7���ַ�">
          <span class="STYLE3">*������7���ַ�</span></div></td>
      </tr>
      <tr>
        <th class="trh" scope="row"><div align="right">ȷ�����룺</div></th>
        <td class="trh1" scope="row"><div align="left">
          <input name="confirmpassword" type="password" id="confirmpassword" size="21" value=<%=password%> msg="ȷ����������7���ַ�">
          <span class="STYLE3">*������7���ַ�</span></div></td>
      </tr>
      <tr>
        <th class="trh" scope="row"><div align="right">������</div></th>
        <td class="trh1" scope="row"><div align="left">
          <input name="name" type="text" id="name" size="20" value="<%=name%>" msg="��������Ϊ��">
        </div></td>
      </tr>
      <tr>
        <th class="trh" scope="row"><div align="right">�Ա�</div></th>
        <td class="trh1" scope="row"><div align="left">
          <input name="sex" type="text" id="sex" size="20" value="<%=sex%>" msg="�Ա���Ϊ��">
        </div></td>
      </tr>
      <tr>
        <th class="trh" scope="row"><div align="right">���ţ�</div></th>
        <td class="trh1" scope="row"><div align="left">
          <select name="deptname" size="1" id="deptname">
		  <%
		  String DeptSql="select deptname from department";
		  ResultSet DeptRs=DeptBean.executeQuery(DeptSql);
		  while(DeptRs.next()){
		  	String dept=new String(DeptRs.getString("deptname").getBytes("GBK"));
		 	if (dept.equals(deptname)){
		  %>
            <option selected><%=dept%></option>
			<%}else{%>
			<option><%=dept%></option>
			<%}}
			DeptRs.close();
			DeptBean.closeStmt();%>
          </select>
        </div></td>
      </tr>
      <tr>
        <th class="trh" scope="row"><div align="right">����֤�ţ�</div></th>
        <td class="trh1" scope="row"><div align="left">
          <input name="num" type="text" id="num" size="20" value="<%=num%>" msg="����֤�Ų���Ϊ��">
          <span class="STYLE3">*��д����</span></div></td>
      </tr>
      <tr>
        <th class="trh" scope="row"><div align="right">E-mail��</div></th>
        <td class="trh1" scope="row"><div align="left">
          <input name="email" type="text" id="email" size="20" value="<%=email%>" msg="E-mail��ַ��д����">
        </div></td>
      </tr>
      <tr>
        <th class="trh" scope="row"><div align="right">��ݣ�</div></th>
        <td class="trh1" scope="row"><div align="left">
          <select name="body" size="1" id="body">
            <option selected>��ʦ</option>
            <option value="����Ա">����Ա</option>
          </select>
</div></td>
      </tr>
    </table>
    <p>
      <input name="Submit" type="submit" onClick="MM_validateForm('username','','R','name','','R','sex','','R','dept','','R','num','','RisNum','email','','NisEmail','password','','R','confimpassword','','R');return document.MM_returnValue" value="�޸���Ϣ">
      <input type="reset" name="Submit2" value="����">
</p>
  </form>
</div>
<div align="center"></div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
