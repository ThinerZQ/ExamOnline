<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="queryBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="subjBean" scope="page" class="exam.ExamBean"/>
<title>�����Ŀ</title>
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
-->
</style></head>
<%
String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==2){
	int Sequence=0;
	String Ssql="select max(sequence) as maxid from pool";
	ResultSet rs1=queryBean.executeQuery(Ssql);
	if(rs1.next())
	Sequence=rs1.getInt("maxid");
	rs1.close();
	queryBean.closeStmt();
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="teaclogin.jsp">��ʦ������</a>&gt;&gt;�����Ŀ</span></td>
  </tr>
</table>
<BR>
<form name="form1" method="post" action="pooladd1.jsp">
  <div align="center">
    <table width="570" height="307" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr>
        <td class="trh"><div align="center">���&nbsp; </div></td>
        <td colspan="4" class="trh1"><div align="left">
         <%=Sequence+1%><input name="Sequence" type="hidden" id="Sequence" size="10" value="<%=Sequence+1%>">
        </div></td>
      </tr>
      <tr>
        <td width="76" class="trh"><div align="center">��Ŀ
        </div></td>
        <td width="98" class="trh1"><select name="subject" size="1" id="subject">
          <option selected>--��ѡ��--</option>
          <%
	String sql="select subjname from subject";
	ResultSet rs2=subjBean.executeQuery(sql);
	while(rs2.next())
	{
	String subj=rs2.getString("subjname").trim();%>
          <option><%=subj%></option>
          <%}
	rs2.close();
	subjBean.closeStmt();
	%>
        </select></td>
        <td width="79" class="trh"><div align="center">����
        </div></td>
        <td width="205" class="trh1"><select name="type" id="type">
          <option selected>--��ѡ��--</option>
          <option>����ѡ����</option>
          <option>����ѡ����</option>
          <option>�ж���</option>
        </select></td>
        <td class="trh1">&nbsp;</td>
      </tr>
      <tr>
        <td height="104" colspan="2" class="trh"><div align="center">��Ŀ��</div></td>
        <td colspan="3" class="trh1"><textarea name="question" cols="50" rows="5" id="question"></textarea></td>
      </tr>
      <tr>
        <td height="40" colspan="2" class="trh"><div align="center">ѡ��1</div></td>
        <td height="40" colspan="2" class="trh1"><input name="option1" type="text" id="option1"  size="40"></td>
        <td width="84" height="40" class="trh1">
		<input name='checkbox1' type='checkbox' id='checkbox1' value='A'>��ȷ��</td>
      </tr>
      <tr>
        <td height="40" colspan="2" class="trh"><div align="center">ѡ��2</div></td>
        <td height="40" colspan="2" class="trh1"><input name="option2" type="text" id="option2" size="40"></td>
        <td height="40" class="trh1">
		<input name='checkbox2' type='checkbox' id='checkbox2' value='B'>��ȷ��
        </td>
      </tr>
      <tr>
        <td height="40" colspan="2" class="trh"><div align="center">ѡ��3</div></td>
        <td height="40" colspan="2" class="trh1"><input name="option3" type="text" id="option3"  size="40"></td>
        <td height="40" class="trh1">
		<input name='checkbox3' type='checkbox' id='checkbox1' value='C'>��ȷ��
        </td>
      </tr>
      <tr>
        <td height="40" colspan="2" class="trh"><div align="center">ѡ��4</div></td>
        <td height="40" colspan="2" class="trh1"><input name="option4" type="text" id="option4" size="40"></td>
        <td height="40" class="trh1">
		<input name='checkbox$' type='checkbox' id='checkbox$' value='D'>��ȷ��
        </td>
      </tr>
    </table>
  </div>
  <p align="center">
    <input type="submit" name="Submit" value="�ύ">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit2" value="����">
  </p>
</form>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
