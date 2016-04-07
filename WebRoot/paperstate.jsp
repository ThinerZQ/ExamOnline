<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="paperBean" scope="page" class="exam.ExamBean"/>
<title>发布试卷</title>
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
.style8 {font-size: 13px}
.STYLE11 {
	font-size: x-large;
	color: #0033FF;
}
.STYLE13 {color: #9966FF; font-weight: bold; font-size: 18px; }
.STYLE14 {color: #000000}
-->
</style></head>
<%
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
    <td width="361"><span class="style8">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="teaclogin.jsp">教师主界面</a>&gt;&gt;发布试卷</span></td>
  </tr>
</table>
<br>
<div align="center">
  <p class="STYLE13">未发布试卷</p>
  <table width="65%" border="1" cellspacing="1" bordercolor="#799AE1">
    <tr class="trh"> 
      <th width="11%" nowrap><div align="center">试卷编号</div></th>
      <th width="14%" nowrap>考试类型</th>
      <th width="25%" nowrap>部门</th>
      <th width="9%" nowrap><div align="center">科目</div></th>
      <th width="11%" nowrap><div align="center">考试时间</div></th>
      <th width="11%" nowrap>试卷预览</th>
      <th width="13%" nowrap><div align="center">更改状态</div></th>
	  <th width="6%" nowrap><div align="center">删除</div></th>
    </tr>
	<%
	String sql="SELECT * FROM paper where paperstate=0";
	ResultSet rs=paperBean.executeQuery(sql);
	while(rs.next()){
	int paperid=rs.getInt("paperid");
	String paperhead=new String(rs.getString("paperhead").getBytes("GBK"));
	String subjname=new String (rs.getString("subjname").getBytes("GBK"));
	String deptname=new String (rs.getString("deptname").getBytes("GBK"));
	int time=rs.getInt("time");
	String creatby=new String (rs.getString("creatby").getBytes("GBK"));
	%>
	<tr class="trh1"> 
      <td nowrap><div align="center"><%=paperid%></div></td>
      <td nowrap><div align="center"><%=paperhead%></div></td>
      <td nowrap><div align="center"><%=deptname%></div></td>
      <td nowrap><div align="center"><%=subjname%></div></td>
      <td nowrap><div align="center"><%=time%><span class="STYLE14">分钟</span></div></td>
      <td nowrap><div align="center"><a href="prview.jsp?paperid=<%=paperid%>">预览</a></div></td>
      <td nowrap><div align="center"><a href="pubpaper.jsp?paperid=<%=paperid%>"><img src="image/1.jpg" width="70" height="24" border="0"></a></div></td>
	  <td nowrap><div align="center"><a href="delpaper.jsp?paperid=<%=paperid%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onClick="return confirm('确定要删除吗？');"></a></div></td>
    </tr>
	<%}rs.close();%>
  </table>
  <p class="STYLE13">已发布试卷</p>
  <table width="65%" border="1" cellspacing="1" bordercolor="#799AE1">
    <tr class="trh"> 
      <th width="11%" nowrap><div align="center">试卷编号</div></th>
      <th width="14%" nowrap>考试类型</th>
      <th width="25%" nowrap>部门</th>
      <th width="10%" nowrap><div align="center">科目</div></th>
      <th width="11%" nowrap><div align="center">考试时间</div></th>
      <th width="11%" nowrap>试卷预览</th>
      <th width="12%" nowrap><div align="center">更改状态</div></th>
	  <th width="6%" nowrap><div align="center">删除</div></th>
    </tr>
    <%
	String sql2="SELECT * FROM paper where paperstate=1";
	ResultSet rs2=paperBean.executeQuery(sql2);
	while(rs2.next()){
	int paperid=rs2.getInt("paperid");
	String paperhead=new String(rs2.getString("paperhead").getBytes("GBK"));
	String subjname=new String (rs2.getString("subjname").getBytes("GBK"));
	String deptname=new String (rs2.getString("deptname").getBytes("GBK"));
	int time=rs2.getInt("time");
	String creatby=new String (rs2.getString("creatby").getBytes("GBK"));
	%>
    <tr class="trh1"> 
      <td nowrap><div align="center"><%=paperid%></div></td>
      <td nowrap><div align="center"><%=paperhead%></div></td>
      <td nowrap><div align="center"><%=deptname%></div></td>
      <td nowrap><div align="center"><%=subjname%></div></td>
      <td nowrap><div align="center"><%=time%><span class="STYLE14">分钟</span></div></td>
      <td nowrap><div align="center"><a href="prview.jsp?paperid=<%=paperid%>">预览</a></div></td>
      <td nowrap><div align="center"><a href="dispub.jsp?paperid=<%=paperid%>"><img src="image/2.jpg" width="69" height="24" border="0" onClick="return confirm('点击“确定”后将会清除所有参加过此试卷考试的记录。\n确定要取消发布吗？');"></a></div></td>
      <td nowrap><div align="center"><a href="delpaper.jsp?paperid=<%=paperid%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onClick="return confirm('确定要删除吗？');"></a></div></td>
	</tr>
    <%}rs2.close();
	paperBean.closeStmt();
	%>
  </table>
</div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
