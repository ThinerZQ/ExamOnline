<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="stuBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ѧ���ʻ�</title>
<script language="JavaScript" type="text/JavaScript">
<!-- 
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
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
}
.STYLE3 {color: #9933FF}
-->
</style></head>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
%> 
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="admilogin.jsp">����Ա������</a>&gt;&gt;ѧ���ʻ�����</span></td>
  </tr>
</table>
<div align="center"><br>
</div>
<form name="form1" method="post" action="stumanage.jsp">
  <div align="center">
    <table width="55" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr>
        <td width="81" height="27" nowrap class="trh"><div align="center">�������
              </div>
        <div align="center"></div></td>
        <td width="78" nowrap class="trh1">
          <div align="center">
              <select name="fields" size="1" id="fields">
                <option value="name">���� </option>
                <option value="sex">�Ա� </option>
                <option value="deptname">Ժϵ </option>
                <option value="profession">רҵ </option>
                <option value="class">�༶ </option>
                <option value="num">ѧ�� </option>
                <option value="all" selected>������</option>
            </select>
          </div></td>
        <td width="53" nowrap class="trh"><div align="center">�ؼ���
              </div>
        <div align="center"></div></td>
        <td width="117" nowrap class="trh1"><div align="center">
            <input name="keyword" type="text" id="keyword" size="15">
        </div></td>
        <td width="73" nowrap class="trh">
          <div align="center">
            <input type="submit" name="Submit" value="����"> 
          </div></td></tr>
    </table>
  </div>
</form>
<p align="center"><a href="addstu.jsp" class="STYLE3">���ѧ���û�</a></p>
<div align="center">
  <%
	String fields=request.getParameter("fields");
	String keyword=request.getParameter("keyword");
	if(fields==null||fields.equals("all")||keyword==null){
%>
    <table width="80%" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr class="trh">
        <th nowrap scope="col">���</th>
        <th nowrap scope="col">����</th>
        <th nowrap scope="col">�Ա�</th>
        <th nowrap scope="col">Ժϵ</th>
        <th nowrap scope="col">רҵ</th>
        <th nowrap scope="col">�༶</th>
        <th nowrap scope="col">ѧ��</th>
        <th nowrap scope="col">״̬</th>
        <th nowrap scope="col">��ϸ��Ϣ</th>
        <th nowrap scope="col">ɾ��</th>
      </tr>
    <%
	int i=0;
	String state="";
	String sql="select * from student ORDER BY num";
	ResultSet rs=stuBean.executeQuery(sql);
	while(rs.next()){
	i++;
	String username=rs.getString("username");
	String name=rs.getString("name");
	String sex=rs.getString("sex");
	String birthday=String.valueOf(rs.getDate("birthday"));
	String deptname=rs.getString("deptname");
	String profession=rs.getString("profession");
	String classes=rs.getString("class");
	String num=rs.getString("num");
	String email=rs.getString("email");
	int st=rs.getInt("state");
	if(st==0)
		state="��ֹ����";
	else
		state="������";
  %>
      <tr class="trh1">
        <td nowrap scope="col"><div align="center"><%=i%></div></td>
        <td nowrap scope="col"><div align="center"><%=name%></div></td>
        <td nowrap scope="col"><div align="center"><%=sex%></div></td>
        <td nowrap scope="col"><div align="center"><%=deptname%></div></td>
        <td nowrap scope="col"><div align="center"><%=profession%></div></td>
        <td nowrap scope="col"><div align="center"><%=classes%></div></td>
        <td nowrap scope="col"><div align="center"><%=num%></div></td>
        <td nowrap scope="col"><div align="center"><%=state%></div></td>
        <td nowrap scope="col"><div align="center"><a href="stuinfo.jsp?username=<%=username%>"><img src="image/Fav.gif" width="16" height="16" border="0"></a></div></td>
        <td nowrap scope="col"><div align="center"><a href="studel.jsp?username=<%=username%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onclick="return confirm('ȷ��Ҫɾ����');"></a></div></td>
      </tr><%}rs.close();
	  stuBean.closeStmt();%>
    </table>
</div>
    <%}
else{
%>
<div align="center">
    <table width="80%" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr class="trh">
        <th nowrap scope="col">���</th>
        <th nowrap scope="col">����</th>
        <th nowrap scope="col">�Ա�</th>
        <th nowrap scope="col">Ժϵ</th>
        <th nowrap scope="col">רҵ</th>
        <th nowrap scope="col">�༶</th>
        <th nowrap scope="col">ѧ��</th>
        <th nowrap scope="col">״̬</th>
        <th nowrap scope="col">��ϸ��Ϣ</th>
        <th nowrap scope="col">ɾ��</th>
      </tr>
      <%
		int i=0;
		String state="";
		String sql="select * from student where "+fields+" Like '%"+keyword+"%' ORDER BY num";
		ResultSet rs=stuBean.executeQuery(sql);
		while(rs.next()){
		i++;
		String username=rs.getString("username");
		String name=rs.getString("name");
		String sex=rs.getString("sex");
		String birthday=String.valueOf(rs.getDate("birthday"));
		String deptname=rs.getString("deptname");
		String profession=rs.getString("profession");
		String classes=rs.getString("class");
		String num=rs.getString("num");
		String email=rs.getString("email");
		int st=rs.getInt("state");
		if(st==0)
			state="��ֹ����";
		else
			state="������";
    %>
      <tr class="trh1">
        <td nowrap scope="col"><div align="center"><%=i%></div></td>
        <td nowrap scope="col"><div align="center"><%=name%></div></td>
        <td nowrap scope="col"><div align="center"><%=sex%></div></td>
        <td nowrap scope="col"><div align="center"><%=deptname%></div></td>
        <td nowrap scope="col"><div align="center"><%=profession%></div></td>
        <td nowrap scope="col"><div align="center"><%=classes%></div></td>
        <td nowrap scope="col"><div align="center"><%=num%></div></td>
        <td nowrap scope="col"><div align="center"><%=state%></div></td>
        <td nowrap scope="col"><div align="center"><a href="stuinfo.jsp?username=<%=username%>"><img src="image/Fav.gif" width="16" height="16" border="0"></a></div></td>
        <td nowrap scope="col"><div align="center"><a href="studel.jsp?username=<%=username%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onclick="return confirm('ȷ��Ҫɾ����');"></a></div></td>
      </tr>
      <%}rs.close();
	  stuBean.closeStmt();
	  %>
  </table>
</div>
    <%}%>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
