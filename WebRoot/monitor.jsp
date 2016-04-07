<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="QueryBean" scope="page" class="exam.ExamBean"/>
<title>考试监控</title>
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
.style1 {
	color: #FF0000;
	font-weight: bold;
}
.style2 {font-size: small}
.STYLE3 {font-size: xx-large}
.STYLE4 {color: #0033FF}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
<script language="JavaScript" type="text/JavaScript">
function getfields(){
	var f=document.forms[0];
	return f.fields.value;
}
function getkeyword(){
	var f=document.forms[0];
	return f.keyword.value;
}
</script>
</head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==3){
%>
<body>
<meta http-equiv="refresh" content="20;url=monitor.jsp"> 
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="601" border="0" cellspacing="0">
  <tr>
    <td width="591" class="style2">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="admilogin.jsp">管理员主界面</a>&gt;&gt;考试监控</td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="monitor.jsp">
  <table width="58"  border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#799AE1">
    <tr>
      <td width="31%" height="30" nowrap class="trh"><div align="center">分类查找</div></td>
      <td width="14%" nowrap bgcolor="#FFFDE8">
        <div align="center">
          <select name="fields" size="1" id="fields">
            <option value="num">学号</option>
            <option value="name">姓名</option>
            <option value="papertitle">试卷标题</option>
            <option value="state">状态</option>
            <option value="all" selected>所有人</option>
          </select>
        </div></td>
      <td width="6%" nowrap class="trh"><div align="center">关键字</div></td>
      <td width="22%" nowrap bgcolor="#FFFDE8"><div align="center">
        <input name="keyword" type="text" id="keyword" size="20">
      </div></td>
      <td width="26%" nowrap class="trh"><div align="center">
        <input type="submit" name="Submit" value="查找" >
      </div></td>
    </tr>
  </table>
</form>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <%
  	int Scnt=0;
	int Dcnt=0;
  	String SCntSql="select count(num) as Scnt from monitor where state=2";
	String DCntSql="Select count(num) as Dcnt from monitor where state=1";
	ResultSet ScntRs=QueryBean.executeQuery(SCntSql);
	ResultSet DcntRs=QueryBean.executeQuery(DCntSql);
	if(ScntRs.next()) Scnt=ScntRs.getInt("Scnt");
	if(DcntRs.next()) Dcnt=DcntRs.getInt("Dcnt");
	ScntRs.close();
	DcntRs.close();
  %>
    <td width="45%" height="28" nowrap><div align="right">|正在考试的人数|</div></td>
    <td width="5%" nowrap><span class="style1"><%=Dcnt%>人</span></td>
    <td width="17%" nowrap>|已经交卷的人数|</td>
    <td width="33%" nowrap><span class="style1"><%=Scnt%>人</span></td>
  </tr>
</table>
<%
String fields=request.getParameter("fields");
String keyword=request.getParameter("keyword");
if(fields==null||fields.equals("all")||keyword==null){
%>
<table width="50%" height="27"  border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#799AE1">

  <tr class="trh">
    <th width="15%" height="16" nowrap><div align="center">学号</div></th>
    <th width="11%" nowrap><div align="center">姓名</div></th>
    <th width="55%" nowrap><div align="center">试卷标题</div></th>
    <th width="10%" nowrap><div align="center">状态</div></th>
    <th width="9%" nowrap>删除</th>
  </tr>
  <tr>
    <td height="3" colspan="5" nowrap><img src="image/bar.gif" width="622" height="3"></td>
  </tr>
<%
String QuerySql="Select * from monitor ORDER BY state,num";
ResultSet QueryRs=QueryBean.executeQuery(QuerySql);
while (QueryRs.next()){
	String state="未交卷";
	String num=QueryRs.getString("num");
	String username1=QueryRs.getString("username");
	String name=new String(QueryRs.getString("name").getBytes("GBK"));
	String title=new String(QueryRs.getString("papertitle").getBytes("GBK"));
	int st=QueryRs.getInt("state");
	if(st==2) state="已交卷";
%>
  <tr class="trh1">
    <td height="18" nowrap><div align="center"><%=num%></div></td>
    <td nowrap><div align="center"><%=name%></div></td>
    <td nowrap><div align="center"><%=title%></div></td>
    <td nowrap><div align="center"><%=state%></div></td>
    <td nowrap><div align="center"><a href="monitordel.jsp?username=<%=username1%>"><img src="image/btn_FileDelete.gif" width="15" height="16" border="0"></a></div></td>
  </tr>
  <%}QueryRs.close();%>
</table>
<%}
else{
%>
<table width="50%" height="27"  border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#799AE1">
  <tr class="trh">
    <th width="15%" height="21" nowrap><div align="center">学号</div></th>
    <th width="11%" nowrap><div align="center">姓名</div></th>
    <th width="55%" nowrap><div align="center">试卷标题</div></th>
    <th width="10%" nowrap>状态</th>
    <th width="9%" nowrap><div align="center">删除</div></th>
  </tr>
  <tr>
    <td height="8" colspan="5" nowrap><img src="image/bar.gif" width="622" height="3"></td>
  </tr>
 <%
 	String sql="select * from monitor where "+fields+" Like '%"+keyword+"%' ORDER BY state,num";
	ResultSet rs=QueryBean.executeQuery(sql);
	while (rs.next()){
	String state="未交卷";
	String num=rs.getString("num");
	String name=new String (rs.getString("name").getBytes("GBK"));
	String title=new String (rs.getString("papertitle").getBytes("GBK"));
	int st=rs.getInt("state");
	if(st==2) state="已交卷";
 %>
  <tr class="trh1">
    <td height="18" nowrap><div align="center"><%=num%></div></td>
    <td nowrap><div align="center"><%=name%></div></td>
    <td nowrap><div align="center"><%=title%></div></td>
    <td nowrap><div align="center"><%=state%></div></td>
    <td nowrap><div align="center"><a href="monitordel.jsp?num=<%=num%>"><img src="image/btn_FileDelete.gif" width="15" height="16" border="0"></a></div></td>
  </tr>
  <%}rs.close();
  QueryBean.closeStmt();%>
</table>
<%}%>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
