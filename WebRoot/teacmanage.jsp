<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="queryTchBean" scope="page" class="exam.ExamBean"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ʦ�ʻ�����</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function confirmdel()
{ 
	return confirm("��ȷ��Ҫɾ��������¼��");
}
//-->
</script>
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
	font-weight: bold;
}
-->
</style></head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
%>
<table width="80%" border="0" align="center" cellspacing="0">
  <tr>
  </tr>
</table> 
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="admilogin.jsp">����Ա������</a>&gt;&gt;��ʦ�ʻ�����</span></td>
  </tr>
</table>
<div align="center">
  <form name="form1" method="post" action="">
    <table width="48" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr>
        <td width="80" height="29" nowrap class="trh"><div align="center">�������</div></td>
        <td width="85" nowrap bgcolor="#FFFDE8">
          <div align="left">
            <select name="fields" size="1" id="fields">
              <option value="name">���� </option>
              <option value="sex">�Ա� </option>
              <option value="dept">���� </option>
              <option value="num">����֤��</option>
              <option value="all" selected>������</option>
            </select>
        </div></td>
        <td width="73" nowrap class="trh"><div align="center">�ؼ���</div></td>
        <td width="92" nowrap bgcolor="#FFFDE8">
          <div align="left">
            <input name="keyword" type="text" id="keyword" size="10">
          </div></td>
        <td width="52" nowrap bgcolor="#FFFDE8" class="trh"><div align="center">
          <input type="submit" name="Submit" value="����">
        </div></td>
      </tr>
    </table>
  </form>
  <p><a href="addteac.jsp">��ӽ�ʦ�û�</a></p>
</div>
<%
	String fields=request.getParameter("fields");
	String keyword=request.getParameter("keyword");
	if(fields==null||fields.equals("all")||keyword==null){
%>
<div align="center">
  <table width="60%" border="1" cellspacing="1" bordercolor="#799AE1">
    <tr class="trh">
      <th nowrap scope="col"><div align="center">����</div></th>
      <th nowrap scope="col"><div align="center">�Ա�</div></th>
      <th nowrap scope="col"><div align="center">����</div></th>
      <th nowrap scope="col"><div align="center">����֤��</div></th>
      <th nowrap scope="col">��ϸ��Ϣ</a></th>
	  <th nowrap scope="col">ɾ��</a></th>
    </tr>
<%
String sql="select username,name,sex,dept,num from teacher ORDER BY num";
ResultSet rs=queryTchBean.executeQuery(sql);
while(rs.next()){
String username=rs.getString("username");
String name=rs.getString("name");
String sex=rs.getString("sex");
String dept=rs.getString("dept");
String num=rs.getString("num");
%>
    <tr class="trh1">
      <td nowrap  scope="col"><div align="center"><%=name%></div></td>
      <td nowrap  scope="col"><div align="center"><%=sex%></div></td>
      <td nowrap  scope="col"><div align="center"><%=dept%></div></td>
      <td nowrap  scope="col"><div align="center"><%=num%></div></td>
      <td nowrap  scope="col"><div align="center"><a href="teacinfo.jsp?username=<%=username%>"><img src="image/Fav.gif" width="16" height="16" border="0"></a></div></td>
      <td nowrap  scope="col"><div align="center"><a href="teacdel.jsp?username=<%=username%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onclick="return confirm('ȷ��Ҫɾ����');"></a></div></td>
    </tr>
	<%}rs.close();
	queryTchBean.closeStmt();%>
  </table>
</div>
<%}
else{
%>
<div align="center">
<table width="60%" border="1" cellspacing="1" bordercolor="#799AE1">
  <tr class="trh">
    <th nowrap scope="col"><div align="center">����</div></th>
    <th nowrap scope="col"><div align="center">�Ա�</div></th>
    <th nowrap scope="col"><div align="center">����</div></th>
    <th nowrap scope="col"><div align="center">����֤��</div></th>
    <th nowrap scope="col">��ϸ��Ϣ</th>
    <th nowrap scope="col">ɾ��</th>
  </tr>
  <%
String sql="select username,name,sex,dept,num from teacher where "+fields+" Like '%"+keyword+"%' ORDER BY num";
ResultSet rs=queryTchBean.executeQuery(sql);
while(rs.next()){
String username=rs.getString("username");
String name=rs.getString("name");
String sex=rs.getString("sex");
String dept=rs.getString("dept");
String num=rs.getString("num");
%>
  <tr class="trh1">
    <td nowrap  scope="col"><div align="center"><%=name%></div></td>
    <td nowrap  scope="col"><div align="center"><%=sex%></div></td>
    <td nowrap  scope="col"><div align="center"><%=dept%></div></td>
    <td nowrap  scope="col"><div align="center"><%=num%></div></td>
    <td nowrap  scope="col"><div align="center"><a href="teacinfo.jsp?username=<%=username%>"><img src="image/Fav.gif" width="16" height="16" border="0"></a></div></td>
    <td nowrap  scope="col"><div align="center"><a href="teacdel.jsp?username=<%=username%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onclick="return confirm('ȷ��Ҫɾ����');"></a></div></td>
  </tr>
  <%}rs.close();
  queryTchBean.closeStmt();%>
</table>
<%}%>
</div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
