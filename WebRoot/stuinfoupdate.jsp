<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="DeptBean" scope="page" class="exam.ExamBean"/>
<jsp:useBean id="StuBean" scope="page" class="exam.ExamBean"/>
<title>学生信息修改</title>
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
		if(st==1)state="允许考试";
		else state="禁止考试";
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
    <td><span class="style1">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="admilogin.jsp">管理员主界面</a>&gt;&gt;<a href="stumanage.jsp">学生帐户管理</a>&gt;&gt;<a href="stuinfo.jsp?username=<%=username%>">详细信息</a></span>&gt;&gt;<span class="style1">修改信息</span></td>
  </tr>
</table>
<br>
<div align="center">
  <form name="form1" method="post" action="stuupdate.jsp">
    <table width="437" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr bgcolor="#CCCCCC">
        <th width="90" bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">用户名：</div></th>
        <td width="349" bgcolor="#CCCCCC" class="trh1">
          <div align="left">
            <%=username%><input name="username" type="hidden" value="<%=username%>">
          </div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">密码：</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="password" type="password" id="password" size="21" value=<%=password%>>
          <span class="style3">        *长度必须大于6个字符</span></div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">确认密码：</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="confirmpassword" type="password" id="confirmpassword" size="21" value=<%=password%>>
          <span class="style3">*长度必须大于6个字符</span></div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">姓名：</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="name" type="text" id="name" value="<%=name%>">
          <span class="style3">*请输入你的真实姓名</span></div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">性别：</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <select name="sex" size="1" id="sex">
		  <%
		  if (sex.equals("男")){
		  %>
            <option selected>男</option>
            <option>女</option>
		   <%}else if(sex.equals("女")){%>
		    <option>男</option>
            <option selected>女</option>
			<%}%>
          </select>
</div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">出生年月：</div></th>
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
          <span class="style3">年</span>
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
          <span class="style3">月</span>
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
        日</div>          </td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">院系：</div></th>
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
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">专业：</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="profession" type="text" id="profession" value="<%=profession%>">
        </div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">班级：</div></th>
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
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">学号：</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="num" type="text" id="num" value="<%=num%>">
        </div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">E-mail：</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <input name="email" type="text" id="email" value="<%=email%>">
          <span class="style3">        *请输入正确的email地址</span></div></td>
      </tr>
      <tr bgcolor="#CCCCCC">
        <th bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">状态：</div></th>
        <td bgcolor="#CCCCCC" class="trh1"><div align="left">
          <select name="state" size="1" id="state">
		  <%if(state.equals("允许考试")){%>
            <option selected>允许考试</option>
            <option>禁止考试</option>
			<%}else{%>
			<option>允许考试</option>
            <option selected>禁止考试</option>
			<%}%>
          </select>
</div></td>
      </tr>
    </table>
    <p>
      <input type="submit" name="Submit" value="修改信息">
       <input type="reset" name="Submit2" value="重置">
    </p>
  </form>
</div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
