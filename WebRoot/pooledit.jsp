<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�༭��Ŀ</title>
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
<jsp:useBean id="queryBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="subjBean" scope="page" class="exam.ExamBean"/>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");


String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==2){
	int Sequence=Integer.parseInt(request.getParameter("Sequence"));
	String QuerySql="select * from pool where sequence='"+String.valueOf(Sequence)+"'";
	ResultSet rs=queryBean.executeQuery(QuerySql);
	String type="",question="",option1="",option2="",option3="",option4="",answer="",subject="";
	if(rs.next()){
	subject=new String(rs.getString("subj").trim().getBytes("GBK"));
	type=new String(rs.getString("type").trim().getBytes("GBK"));
	question=rs.getString("question");
	option1=rs.getString("option1");
	option2=rs.getString("option2");
	option3=rs.getString("option3");
	option4=rs.getString("option4");
	answer=rs.getString("answer");
	}
	rs.close();
	queryBean.closeStmt();
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="545" border="0" cellspacing="0">
  <tr>
    <td width="545"><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="teaclogin.jsp">��ʦ������</a>&gt;&gt;<a href="poolquery.jsp">��Ŀ����</a>&gt;&gt;�޸���Ŀ</span></td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="poolupdate.jsp">
  <div align="center">
    <table width="576" height="307" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr>
        <td class="trh"><div align="center">���&nbsp;&nbsp; </div></td>
        <td colspan="4" class="trh1"><div align="left">
          <%=Sequence%><input name="Sequence" type="hidden" id="Sequence" value="<%=Sequence%>" size="10">
        </div></td>
      </tr>
      <tr>
        <td width="76" class="trh"><div align="center">��Ŀ        </div></td>
        <td width="98" class="trh1"><select name="subject" id="subject">
          <%
	String sql="select subjname from subject";
	ResultSet rs2=subjBean.executeQuery(sql);
	while(rs2.next())
	{
	String subj=rs2.getString("subjname").trim();
	
	if(subj.equals(subject.trim())){%>
          <option selected><%=subj%></option>
          <%}else{%>
          <option><%=subj%></option>
          <%}}
	rs2.close();
	subjBean.closeStmt();
	%>
        </select></td>
        <td width="79" class="trh"><div align="center">����</div></td>
        <td width="205" class="trh1"><%if(type.equals("����ѡ����")){%>
          <select name="type" id="type">
            <option selected>����ѡ����</option>
            <option>����ѡ����</option>
            <option>�ж���</option>
          </select>
          <%}else if(type.equals("����ѡ����")){%>
          <select name="type" id="type">
            <option>����ѡ����</option>
            <option selected>����ѡ����</option>
            <option>�ж���</option>
          </select>
          <%}else if(type.equals("�ж���")){%>
          <select name="type" id="type">
            <option>����ѡ����</option>
            <option>����ѡ����</option>
            <option selected>�ж���</option>
          </select>
          <%}%></td>
        <td class="trh1">&nbsp;</td>
      </tr>
      <tr>
        <td height="104" colspan="2" class="trh"><div align="center">��Ŀ��</div></td>
        <td colspan="3" class="trh1"><textarea name="question" cols="50" rows="5" id="question"><%=question%></textarea></td>
      </tr>
      <tr>
        <td height="40" colspan="2" class="trh"><div align="center">ѡ��1</div></td>
        <td height="40" colspan="2" class="trh1"><input name="option1" type="text" id="option1" value="<%=option1%>" size="40"></td>
        <td width="84" height="40" class="trh1">
        <%if(answer.indexOf("A")!=-1)
		out.print("<input type='checkbox' name='checkbox1' value='A' checked>��ȷ��");
        	else
		out.print("<input name='checkbox1' type='checkbox' id='checkbox1' value='A'>��ȷ��");
	    %>	</td>
      </tr>
      <tr>
        <td height="40" colspan="2" class="trh"><div align="center">ѡ��2</div></td>
        <td height="40" colspan="2" class="trh1"><input name="option2" type="text" id="option2" value="<%=option2%>" size="40"></td>
        <td height="40" class="trh1"><%if(answer.indexOf("B")!=-1)
		out.print("<input type='checkbox' name='checkbox2' value='B' checked>��ȷ��");
        	else
		out.print("<input name='checkbox2' type='checkbox' id='checkbox2' value='B'>��ȷ��");
	    %>	</td>
      </tr>
      <tr>
        <td height="40" colspan="2" class="trh"><div align="center">ѡ��3</div></td>
        <td height="40" colspan="2" class="trh1"><input name="option3" type="text" id="option3" value="<%=option3%>" size="40"></td>
        <td height="40" class="trh1"><%if(answer.indexOf("C")!=-1)
		out.print("<input type='checkbox' name='checkbox3' value='C' checked>��ȷ��");
        	else
		out.print("<input name='checkbox3' type='checkbox' id='checkbox1' value='C'>��ȷ��");
	    %>	</td>
      </tr>
      <tr>
        <td height="40" colspan="2" class="trh"><div align="center">ѡ��4</div></td>
        <td height="40" colspan="2" class="trh1"><input name="option4" type="text" id="option4" value="<%=option4%>" size="40"></td>
        <td height="40" class="trh1"><%if(answer.indexOf("D")!=-1)
		out.print("<input type='checkbox' name='checkbox4' value='D' checked>��ȷ��");
        	else
		out.print("<input name='checkbox4' type='checkbox' id='checkbox4' value='D'>��ȷ��");
	    %>	</td>
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
