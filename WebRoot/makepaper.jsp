<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="deptBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="subjBean" scope="page" class="exam.ExamBean"/>
<title>�Ծ��������</title>
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
    color: #0066ff;
	
    font-size: 14px;
    
}
.style1 {font-size: small}
.STYLE2 {
	color: #3333ff;
	font-size: xx-large;
}
.STYLE3 {color: #0066FF}
.STYLE4 {
	color: #0066FF;
	font-weight: bold;
}
-->
</style></head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==2){
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="teaclogin.jsp">��ʦ������</a>&gt;&gt;�����Ծ�</span></td>
  </tr>
</table>
<br>
<form name="form2" method="post" action="makepaper1.jsp">
  <table width="70%" height="97" border="1" align="center" cellspacing="1" bordercolor="#799AE1" >
    <tr class="trh"> 
      <td height="25" colspan="7"> 
        <div align="center"><strong>�Ծ�����</strong></div></td>
    </tr>
    <tr class="trh1"> 
      <td height="18" colspan="7" bgcolor="#fffde8"> 
        <div align="center"><span class="STYLE3">�Ծ����ͣ�</span>
          <select name="paperhead" size="1" id="paperhead">
            <option>���п���</option>
            <option>���տ���</option>
            <option selected>�׶β���</option>
          </select>
      </div></td>
    </tr>
    <tr class="trh1"> 
      <td height="39" colspan="4" valign="middle" nowrap><div align="center"><span class="STYLE3">ѡ����</span>
          <select name="deptname" id="deptname">
      <option selected>--��ѡ��--</option>
      <%
  	String sql1="select deptname from department";
 	ResultSet rs1=deptBean.executeQuery(sql1);
	while(rs1.next()){
	String deptname=new String(rs1.getString("deptname").trim().getBytes("GBK"));
  %>
      <option><%=deptname%></option>
      <%}
  	rs1.close();
	deptBean.closeStmt();
  %>
          </select>
      </div></td>
      <td height="39" colspan="2" nowrap><div align="center"><span class="STYLE3">�趨��Ŀ</span>
          <select name="subject" id="subject">
            <option selected>--��ѡ��--</option>
            <%
			String sql="select subjname from subject";
			ResultSet rs2=subjBean.executeQuery(sql);
			while(rs2.next())
			{
			String subjname=new String(rs2.getString("subjname").trim().getBytes("GBK"));
		  %>
            <option><%=subjname%></option>
            <%}
			rs2.close();
			subjBean.closeStmt();
		  %>
          </select> 
      </div>
      <div align="center"></div></td>
      <td width="30%" nowrap><div align="center"><span class="STYLE3">����ʱ��</span>
          <input name="time" type="text" id="time" size="5">
          <span class="STYLE3">����</span></div></td>
    </tr>
  </table>
	<br>
	<table width="70%" border="1" align="center" cellspacing="1" bordercolor="#799AE1">
    <tr class="trh"> 
      <td height="25" colspan="3"><div align="center"><strong>�Ծ�����</strong></div></td>
    </tr>
    <tr class="trh1"> 
      <th width="35%"> 
      <div align="center"></div>      <div align="center" class="STYLE4">����</div></th>
      <th><div align="center"><strong>����</strong></div></th>
      <th width="30%" height="10"><div align="center" class="trh1"><strong>��ֵ</strong></div></th>
      </tr>
    <tr> 
      <th height="22" class="trh1"><div align="center">����ѡ����</div></th>
      <td height="22" nowrap class="trh1"><div align="center">
      <input name="single" type="text" id="single" size="5">
  ��</div></td>
      <td nowrap class="trh1"><div align="center">ÿ��
          <input name="singlemark" type="text" id="singlemark" size="5">
�� </div></td>
      </tr>
    <tr>
      <th height="22" class="trh1">        <div align="center">����ѡ����      </div></th>
      <td height="22" nowrap class="trh1"><div align="center">
      <input name="multi" type="text" id="multi" size="5">
  ��</div></td>
      <td nowrap class="trh1"><div align="center">ÿ��
          <input name="multimark" type="text" id="multimark" size="5">
��</div></td>
      </tr>
    <tr>
      <th height="23" class="trh1">        <div align="center">�ж���</div></th>
      <td width="35%" nowrap class="trh1"><div align="center">
      <input name="judge" type="text" id="judge" size="5">
  �� </div></td>
      <td nowrap class="trh1"><div align="center">ÿ��
          <input name="judgemark" type="text" id="judgemark" size="5">
��</div></td>
      </tr>
  </table>
    <table width="75%" border="0" align="center" cellspacing="0">
      <tr>
        <td height="20" colspan="6"><div align="center"></div>          </td>
      </tr>
      <tr>
        <td height="22" colspan="3">&nbsp;</td>
        <td width="27%" height="22"><div align="center">
            <input name="Submit1" type="submit" id="Submit1" value="�����Ծ�">
        </div></td>
        <td width="26%" height="22"><div align="center">
            <input name="Submit2" type="reset" id="Submit2" value="����">
        </div></td>
        <td width="25%" height="22">&nbsp;</td>
      </tr>
  </table>
</form>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
