<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="admiBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="DeptBean" scope="page" class="exam.ExamBean"/>
<html>
<head>
<title>�޸�����</title> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
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
	color: #3333FF;
	font-weight: bold;
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
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+'\n'; }
  } if (errors) alert('�������´���:\n'+errors);
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
<%
String username="",password="",name="",sex="",dept="",num="",email="";
int tpri=0;
username=String.valueOf(session.getAttribute("username"));
String sql="select * from admin where username='"+username+"'";
ResultSet rs=admiBean.executeQuery(sql);
while (rs.next()){
password=rs.getString("password");
name=new String(rs.getString("name").getBytes("GBK"));
sex=new String(rs.getString("sex").getBytes("GBK"));
dept=new String(rs.getString("dept").getBytes("GBK"));
num=rs.getString("num");
email=rs.getString("email");
tpri=rs.getInt("tpri");
}
rs.close();
admiBean.closeStmt();
%>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="admilogin.jsp">����Ա������</a>&gt;&gt;�����ʻ�����</span></td>
  </tr>
</table>
<form method="post" action="admiupdate.jsp">
  <br>
  <table width="292" height="272" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#799AE1">
    <tr>
      <th width="95" height="30" class="trh" scope="row"><div align="right">�û�����</div></th>
      <td width="191" height="30" class="trh1"><%=username%></td>    </tr>
    <tr>
      <th height="30" class="trh" scope="row"><div align="right">���룺</div></th>
      <td height="15" class="trh1"><input name="password" type="password" id="password" value=<%=password%> msg="��������7���ַ�"></td>
	</tr>
    <tr>
      <th height="30" class="trh" scope="row"> <div align="right">ȷ�����룺</div></th>
      <td height="15" class="trh1"><input name="confirmpassword" type="password" id="confirmpassword" value=<%=password%> msg=&quot;ȷ����������7���ַ�&quot;></td>
    </tr>
    <tr>
      <th height="30" class="trh" scope="row"><div align="right"><span class="style1">���</span>��</div></th>
      <td height="30" class="trh1"><select name="body">
          <option selected>�� �� Ա</option>
          <option>�� ʦ</option>
      </select></td>
    </tr>
    <tr>
      <th height="30" class="trh" scope="row"><div align="right">������</div></th>
      <td height="30" class="trh1"><input name="name" type="text" id="name" value="<%=name%>" msg="��ʵ����Ϊ��"></td>   </tr>
    <tr>
      <th height="30" class="trh" scope="row"><div align="right">�Ա�</div></th>
      <td height="30" class="trh1"><select name="sex" size="1" id="sex">
        <option selected>��</option>
        <option>Ů</option>
      </select></td>    </tr>
    <tr>
      <th height="30" class="trh" scope="row"><div align="right">���ţ�</div></th>
      <td height="30" class="trh1"><select name="dept" size="1" id="dept">
	  <%
	  String DeptSql="select deptname from department";
	  ResultSet DeptRs=DeptBean.executeQuery(DeptSql);
	  while(DeptRs.next()){
		String deptname=new String(DeptRs.getString("deptname").getBytes("GBK"));
		if(deptname.equals(dept)){
	  %>
		<option><%=deptname%></option>
		<%}else{%>
		<option selected><%=deptname%></option>
		<%}}DeptRs.close();
		DeptBean.closeStmt();
		%>
	  </select></td>
    </tr>
    <tr>
      <th height="30" class="trh" scope="row"><div align="right">����֤�ţ�</div></th>
      <td height="30" class="trh1"><input name="num" type="text" id="num"value="<%=num%>" msg="����֤��Ϊ��"></td>    </tr>
    <tr>
      <th height="30" class="trh" scope="row"><div align="right">E-mail��</div></th>
      <td height="30" class="trh1"><input name="email" type="text" id="email" value="<%=email%>" msg="���������ʽ����"></td>   
    </tr>
  </table>
  <div align="center"><br>
    <input name="Submit" type="submit" onClick="MM_validateForm('name','','R','num','','R','email','','NisEmail','password','','R','confirmpassword','','R');return document.MM_returnValue" value="�޸�">
    <input name="reset" type="reset" value="����">
  </div>
</form>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
