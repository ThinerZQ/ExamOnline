<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="classBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<jsp:useBean id="deptBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<title>班级管理</title>
<style type="text/css">
<!-- 
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.trh
{
   
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
.style3 {color: #FF0000; font-weight: bold; }
.style4 {font-size: small}
.STYLE5 {
	font-size: xx-large;
	color: #0066FF;
	font-weight: bold;
}
.STYLE7 {color: #9966FF; font-weight: bold; }
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
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="style4">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="admilogin.jsp">管理员主界面</a>&gt;&gt;班级管理</span></td>
  </tr>
</table>
<br>
<div align="center">
<table width="400" border="0" align="center">
  <tr>
    <td bgcolor="#FFFFCC"><div align="left"><span class="STYLE7">现有班级</span></div></td>
  </tr>
</table>

  <table width="400"  border="1" cellspacing="1" bordercolor="#799AE1">
    <tr class="trh">
      <th width="120" nowrap bgcolor="#3399FF" scope="col">院系</th>
      <th width="48" nowrap bgcolor="#3399FF" scope="col">编号</th>
      <th width="119" nowrap bgcolor="#3399FF" scope="col">班级</th>
      <th width="48" nowrap bgcolor="#3399FF" scope="col">人数</th>
      <th width="43" nowrap bgcolor="#3399FF" scope="col">删除</th>
    </tr>
    <%
String CSql="select * from classes";
ResultSet CRs=classBean.executeQuery(CSql);
while(CRs.next()){
	String DeptName=new String(CRs.getString("deptname").getBytes("GBK"));
	String ClassCode=CRs.getString("classcode");
	String ClassName=CRs.getString("classname");
	int Total=CRs.getInt("total");
%>
    <tr class="trh1">
      <td nowrap><div align="center"><%=DeptName%></div></td>
      <td nowrap><div align="center"><%=ClassCode%></div></td>
      <td nowrap><div align="center"><%=ClassName%></div></td>
      <td nowrap><div align="center"><%=Total%></div></td>
      <td nowrap><div align="center"><a href="delclass.jsp?classcode=<%=ClassCode%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onclick="return confirm('确定要删除吗？');"></a></div></td>
    </tr>
    <%}
		CRs.close();
		classBean.closeStmt();
	%>
  </table>
</div>
<form name="form" method="post" action="addclass.jsp">
  <div align="center">
    <table width="400" bordercolor="#CCFFCC">
      <tr bgcolor="#FFFFCC">
        <td colspan="2" nowrap><div align="left" class="STYLE7">添加班级</div></td>
      </tr>
      <tr>
        <td width="164" nowrap bgcolor="#CCFFCC"><div align="right">所属院系</div></td>
        <td width="224" nowrap bgcolor="#CCFFCC"><div align="left">
          <select name="deptname" id="deptname">
              <option selected>--请选择--</option>
              <%
String sql="select deptname from department";
ResultSet rs=deptBean.executeQuery(sql);
while(rs.next()){
String deptname=new String(rs.getString("deptname").getBytes("GBK"));
%>
              <option><%=deptname%></option>
              <%}rs.close();
  deptBean.closeStmt();
  %>
          </select>
        </div></td>
      </tr>
      <tr>
        <td nowrap bgcolor="#CCFFCC"><div align="right">班级编号</div></td>
        <td nowrap bgcolor="#CCFFCC"><div align="left">
          <input name="classcode" type="text" id="classcode" size="20">
        </div></td>
      </tr>
      <tr>
        <td nowrap bgcolor="#CCFFCC"><p align="right">班级名称</p></td>
        <td nowrap bgcolor="#CCFFCC"><div align="left">
          <input name="classname" type="text" id="classname" size="20">
        </div></td>
      </tr>
      <tr>
        <td bgcolor="#CCFFCC"><div align="right">总人数</div></td>
        <td bgcolor="#CCFFCC"><div align="left">
            <input name="total" type="text" id="total" size="5">
        人</div></td>
      </tr>
      <tr>
        <td bgcolor="#CCFFCC">
          <div align="right">
            <input type="submit" name="Submit" value="添加">
        </div></td>
        <td bgcolor="#CCFFCC"><div align="center">
            <input type="reset" name="Submit" value="重置">
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
