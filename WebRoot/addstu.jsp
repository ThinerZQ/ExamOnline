<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="DeptBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<jsp:useBean id="ClassBean" scope="page" class="exam.ExamBean"></jsp:useBean>
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
<title>���ѧ���ʻ�</title>
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
.STYLE2 {font-size: xx-large}
.STYLE3 {
	font-size: xx-large;
	color: #3333FF;
	font-weight: bold;
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
    <td width="100%" align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="admilogin.jsp">����Ա������</a>&gt;&gt;<a href="stumanage.jsp">ѧ���ʻ�����</a>&gt;&gt;���ѧ���ʻ�</span></td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="addstu2.jsp"  onSubmit="return checkform()">
  <table width="485" border="1" align="center" cellspacing="1" bordercolor="#799ae1">
    <tr bgcolor="#CCCCCC"> 
      <th width="100" bgcolor="#C2D3FF" class="trh" scope="row"><div align="right">�û�����</div></th>
      <td width="375" bgcolor="#CCCCCC" class="trh1"> <div align="left"> 
          <input name="username" type="text" id="username" msg="�û�����������3���ַ�">
      <span class="style2 STYLE4">*�û������Ȳ�����3</span></div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">�����룺</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <input name="password" type="password" id="password" size="21" msg="����������7���ַ�">
          <span class="STYLE4">*������7���ַ�</span></div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">ȷ�����룺</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <input name="confirmpassword" type="password" id="confirmpassword" size="21" msg="ȷ�����벻��7���ַ�">
          <span class="STYLE4">      *������7���ַ�</span></div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">��ʵ������</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <input name="name" type="text" id="name" msg="��ʵ����Ϊ��">
      </div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">�Ա�</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <select name="sex" id="sex">
            <option selected>��</option>
            <option>Ů</option>
          </select>
      </div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">�������£�</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <select name="year" id="year">
            <option selected>1975</option>
            <option>1976</option>
            <option>1977</option>
            <option>1978</option>
            <option>1979</option>
            <option>1980</option>
            <option>1981</option>
            <option>1982</option>
            <option>1983</option>
            <option>1984</option>
            <option>1985</option>
            <option>1986</option>
            <option>1987</option>
            <option>1988</option>
            <option>1989</option>
            <option>1990</option>
            <option>1991</option>
            <option>1992</option>
            <option>1993</option>
            <option>1994</option>
            <option>1995</option>
          </select>
          <span class="STYLE4">��</span> 
          <select name="month" id="month">
            <option selected>01</option>
            <option>02</option>
            <option>03</option>
            <option>04</option>
            <option>05</option>
            <option>06</option>
            <option>07</option>
            <option>08</option>
            <option>09</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
          </select>
          <span class="STYLE4">��</span> 
          <select name="day" id="day">
            <option selected>01</option>
            <option>02</option>
            <option>03</option>
            <option>04</option>
            <option>05</option>
            <option>06</option>
            <option>07</option>
            <option>08</option>
            <option>09</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
            <option>13</option>
            <option>14</option>
            <option>15</option>
            <option>16</option>
            <option>17</option>
            <option>18</option>
            <option>19</option>
            <option>20</option>
            <option>21</option>
            <option>22</option>
            <option>23</option>
            <option>24</option>
            <option>25</option>
            <option>26</option>
            <option>27</option>
            <option>28</option>
            <option>29</option>
            <option>30</option>
            <option>31</option>
          </select>
          <span class="STYLE4">��</span></div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">Ժϵ��</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><select name="deptname">
	      <option selected value="N">--��ѡ��--</option>
			<%
			String sql="select deptname from department";
			ResultSet rs=DeptBean.executeQuery(sql);
			while(rs.next()){
			String deptname=rs.getString(1);
			%>
    	<option  value="<%=deptname%>"><%=deptname%></option>
    	<%}rs.close();DeptBean.closeStmt();%>
      </select> </td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">רҵ��</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <input name="profession" type="text" id="profession" msg="רҵ����Ϊ��">
      </div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">�༶��</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <select name="classes" size="1" id="classes">
		  <%
		  String ClassSql="select classname from classes";
		  ResultSet ClassRs=ClassBean.executeQuery(ClassSql);
		  while(ClassRs.next()){
		  	String classname=new String(ClassRs.getString("classname").getBytes("GBK"));
		  %>
            <option><%=classname%></option>
			<%}ClassRs.close();
			ClassBean.closeStmt();%>
          </select>
      </div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">ѧ�ţ�</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <input name="num" type="text" id="num" msg="ѧ�ű�����д����">
          <span class="STYLE4">*�������� </span></div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">E-mail��</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="email" type="text" id="email" size="25" msg="E-mail��ַ��д����">
          <span class="STYLE4">*��ѡ</span></div></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">״̬��</div></th>
      <td bgcolor="#CCCCCC" class="trh1"><div align="left"> 
          <select name="st">
            <option selected value="Y">������</option>
            <option value="N">��������</option>
          </select>
      </div></td>
    </tr>
  </table>
  <p align="center"> 
    <input name="Submit" type="submit" onClick="MM_validateForm('username','','R','name','','R','profession','','R','num','','RisNum','email','','NisEmail','password','','R','confirmpassword','','R');return document.MM_returnValue" value="�ύ">
    <input type="reset" name="Submit2" value="����">
  </p>
</form>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
