<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="subjBean1" scope="page" class="exam.ExamBean"></jsp:useBean>
<jsp:useBean id="subjBean2" scope="page" class="exam.ExamBean"></jsp:useBean>
<title>��ӿ�Ŀ</title>
<style type="text/css">
<!--
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.style1 {
	color: #FF0000;
	font-weight: bold;
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
body,td,th {
	color: #ECE9D8;
}
.STYLE3 {color: #000000}
.STYLE4 {color: #9966FF; font-weight: bold; }
.STYLE5 {
	font-size: xx-large;
	color: #0033FF;
	font-weight: bold;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function check()
{	
	var f=document.forms[0];
	var codelen=f.subjcode.value;
	if(codelen.length<=0||codelen.length>10)
	{
		alert("���ӦС��10���ַ������������룡");
		return false;
	}
}
function confirmdel()
{
	return confirm("��ȷ��Ҫɾ��������¼��");
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
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

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
    <td><span class="style2"><span class="STYLE3">��ǰλ�ã�</span><a href="logout.jsp">��¼ҳ</a><span class="STYLE3">&gt;&gt;</span><a href="admilogin.jsp">����Ա������</a><span class="STYLE3">&gt;&gt;��Ŀ����</span></span></td>
  </tr>
</table>
<BR>
<table width="300" border="0" align="center">
  <tr>
    <td height="17" bgcolor="#FFFFCC" class="STYLE4">���п�Ŀ</td>
  </tr>
</table>
<form name="form1" method="post" action="addsubject.jsp">
<div align="center">
  <table width="300" border="0" cellspacing="0">
      <tr>
        <td nowrap><div align="center" class="STYLE3">ѡ��Ժϵ</div></td>
        <td nowrap><div align="center">
          <select name="deptname" id="deptname">
              <option selected>--��ѡ��--</option>
              <%
				String sql="select deptname from department";
				ResultSet rs=subjBean1.executeQuery(sql);
				while(rs.next()){
				String deptname=rs.getString("deptname");
			  %>
              <option><%=deptname%></option>
              <%}
			  %>
          </select>
        </div></td>
        <td nowrap><input type="submit" name="Submit" value="�鿴"></td>
      </tr>
    </table>
  </div>
</form>
<div align="center">
  <%
String deptname="";
if(request.getParameter("deptname")!=null){
deptname=new String(request.getParameter("deptname").getBytes("GBK"));
%>
</div>
<div align="center">
  <table width="300" border="1" align="center" cellspacing="1" bordercolor="#799AE1">
    <tr>
      <td colspan="3" nowrap scope="col"><div align="center"></div>        
        <div align="left"><%=deptname%><span class="STYLE3">�������¿�Ŀ��</span></div>
      <div align="center"></div></td>
    </tr>
    <tr class="trh">
      <th width="66" nowrap scope="col"><div align="center">���</div></th>
      <th width="152" nowrap scope="col"><div align="center">��Ŀ</div></th>
      <th width="68" nowrap scope="col"><div align="center">ɾ��</div></th>
    </tr>
  <%
String sql2="SELECT subjcode, subjname FROM subject WHERE (deptname = '"+deptname+"')";
ResultSet rs2=subjBean2.executeQuery(sql2);
while(rs2.next()){
String subjcode=rs2.getString("subjcode");
String subjname=rs2.getString("subjname");
%>
    <tr>
      <td nowrap><div align="center"><font color="black"><%=subjcode%></font></div></td>
      <td nowrap><div align="left"><font color="black"><%=subjname%></font></div></td>
      <td nowrap><div align="center"><a href="delsubj.jsp?subjcode=<%=subjcode%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onclick="return confirm('ȷ��Ҫɾ����');"></a></div></td>
    </tr>
    <%}rs2.close();
	subjBean2.closeStmt();%>
  </table>
  <%}%>
</div>
<form name="form2" method="post" action="addsubj.jsp">
<div align="center">
  <table width="300" border="0" bordercolor="#CCFFCC">
      <tr bgcolor="#FFFFCC">
        <td colspan="2"><div align="right"></div>          
          <div align="left" class="STYLE4">������Ŀ</div></td>
      </tr>
      <tr>
        <td width="101"><div align="right" class="trh">Ժϵ</div></td>
        <td width="189" bgcolor="#CCFFCC"><div align="left">
          <select name="deptname2" size="1" id="deptname2">
              <option selected>--��ѡ��--</option>
              <%
				//rs.beforeFirst();
				rs = subjBean1.executeQuery(sql);
				while(rs.next()){
				String deptname2=rs.getString(1);
			  %>
              <option><%=deptname2%></option>
              <%}rs.close();
			  subjBean1.closeStmt();
			  %>
          </select>
        </div></td>
      </tr>
      <tr>
        <td><div align="right" class="trh">��Ŀ���</div></td>
        <td width="189" bgcolor="#CCFFCC"><div align="left">
          <input name="subjcode" type="text" size="10">
        </div></td>
      </tr>
      <tr>
        <td><div align="right" class="trh">��Ŀ����</div></td>
        <td bgcolor="#CCFFCC">
          <div align="left">
            <input type="text" name="subjname">
        </div></td></tr>
      <tr>
        <td bgcolor="#CCFFCC"><div align="right">
            <input name="Submit2" type="submit" onClick="MM_validateForm('subjcode','','RisNum','subjname','','R');return document.MM_returnValue" value="���">
        </div></td>
        <td bgcolor="#CCFFCC"><div align="center">
          <input type="reset" name="Submit3" value="����">
        </div></td>
      </tr>
    </table>
  </div>
</form>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
