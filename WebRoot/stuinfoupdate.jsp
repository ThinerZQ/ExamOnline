<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="DeptBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="StuBean" scope="page" class="exam.ExamBean"/>
<title>ѧ����Ϣ�޸�</title>
<style type="text/css">
<!--
.style2 {color: #FF6600}
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.style3 {color: #000000}
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
.STYLE4 {
	font-size: xx-large;
	color: #0033FF;
}
-->
</style>
</head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri.intValue()==3){
	String password="";
	String name="";
	String sex="";
	String year="";
	String month="";
	String day="";
	String deptname="";
	String profession="";
	String classname="";
	String num="";
	String email="";
	String state="";
	String username=request.getParameter("username");
	String InfoSql="select * from student where username='"+username+"'";
	ResultSet InfoRs=StuBean.executeQuery(InfoSql);
	while (InfoRs.next()){
		password=InfoRs.getString("password");
		name=InfoRs.getString("name");
		sex=InfoRs.getString("sex");
		String birthday=String.valueOf(InfoRs.getString("birthday"));
		deptname=InfoRs.getString("deptname");
		profession=InfoRs.getString("profession");
		classname=InfoRs.getString("class");
		num=InfoRs.getString("num");
		email=InfoRs.getString("email");
		int st=InfoRs.getInt("state");
		if(st==1)state="������";
		else state="��ֹ����";
		year=birthday.substring(0,4);
		month=birthday.substring(5,7);
		day=birthday.substring(8,10);
		}InfoRs.close();
		StuBean.closeStmt();
%> 
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="admilogin.jsp">����Ա������</a>&gt;&gt;<a href="stumanage.jsp">ѧ���ʻ�����</a>&gt;&gt;<a href="stuinfo.jsp?username=<%=username%>">��ϸ��Ϣ</a></span>&gt;&gt;<span class="style1">�޸���Ϣ</span></td>
  </tr>
</table>
<br>
<div align="center">
  <form name="form1" method="post" action="stuupdate.jsp">
    <table width="437" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr bgcolor="#CCCCCC">
        <th width="90" bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">�û�����</div></th>
        <td width="349" bgcolor="#CCCCCC" class="trh1">
          <div align="left">
            <%=username%><input name="username" type="hidden" value="<%=username%>">
          </div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">���룺</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="password" type="password" id="password" size="21" value=<%=password%>>
          <span class="style3">        *���ȱ������6���ַ�</span></div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">ȷ�����룺</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="confirmpassword" type="password" id="confirmpassword" size="21" value=<%=password%>>
          <span class="style3">*���ȱ������6���ַ�</span></div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">������</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="name" type="text" id="name" value="<%=name%>">
          <span class="style3">*�����������ʵ����</span></div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">�Ա�</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <select name="sex" size="1" id="sex">
		  <%
		  if (sex.equals("��")){
		  %>
            <option selected>��</option>
            <option>Ů</option>
		   <%}else if(sex.equals("Ů")){%>
		    <option>��</option>
            <option selected>Ů</option>
			<%}%>
          </select>
</div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">�������£�</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <select name="year" id="year">
              <option selected><%=year%></option>
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
          <span class="style3">��</span>
          <select name="month" id="month">
              <option selected><%=month%></option>
			  <option>01</option>
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
          <span class="style3">��</span>
          <select name="day" id="day">
              <option selected><%=day%></option>
			  <option>01</option>
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
        ��</div>          </td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">Ժϵ��</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
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
			<%}}DeptRs.close();%>
          </select>
</div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">רҵ��</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="profession" type="text" id="profession" value="<%=profession%>">
        </div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">�༶��</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <select name="classes" size="1" id="classes">
		  <%
		  String ClassSql="select classname from classes";
		  ResultSet ClassRs=DeptBean.executeQuery(ClassSql);
		  while(ClassRs.next()){
		  	String classes=new String(ClassRs.getString("classname").getBytes("GBK"));
			if (classname.equals(classes)){
		  %>
		  <option selected><%=classes%></option>
		  <%}else{%>
            <option><%=classes%></option>
			<%}}ClassRs.close();
			DeptBean.closeStmt();%>
          </select>
</div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">ѧ�ţ�</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="num" type="text" id="num" value="<%=num%>">
        </div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">E-mail��</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="email" type="text" id="email" value="<%=email%>">
          <span class="style3">        *��������ȷ��email��ַ</span></div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">״̬��</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <select name="state" size="1" id="state">
		  <%if(state.equals("������")){%>
            <option selected>������</option>
            <option>��ֹ����</option>
			<%}else{%>
			<option>������</option>
            <option selected>��ֹ����</option>
			<%}%>
          </select>
</div></td>
      </tr>
    </table>
    <p>
      <input type="submit" name="Submit" value="�޸���Ϣ">
       <input type="reset" name="Submit2" value="����">
    </p>
  </form>
</div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
