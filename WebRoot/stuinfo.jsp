<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="StuinfoBean" scope="page" class="exam.ExamBean"/>
<title>学生信息</title>
<script language="JavaScript" type="text/JavaScript">
<!-- 
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
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
	color: #0033FF;
	font-size: xx-large;
}
-->
</style></head>
<%
String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==3){
	String name="",sex="",birthday="",deptname="",profession="",num="",email="",body="",classes="",state="禁止考试";
	int tpri=0,st=0;
	String username=new String(request.getParameter("username").getBytes("GBK"));
	System.out.println(username);
	//String username=request.getParameter("username");
	String sql="select * from student where username='"+username+"'";
	ResultSet rs=StuinfoBean.executeQuery(sql);
	while(rs.next()){
	name=rs.getString("name");
	sex=rs.getString("sex");
	birthday=String.valueOf(rs.getDate("birthday"));
	deptname=rs.getString("deptname");
	profession=rs.getString("profession");
	classes=rs.getString("class");
	num=rs.getString("num");
	email=rs.getString("email");
	st=rs.getInt("state");
	if(st==1)
		state="允许考试";
	tpri=rs.getInt("tpri");
	if(tpri==1)
		body="学生";
	else body="未定义";
	}rs.close();
	StuinfoBean.closeStmt();%>
	<body onLoad="MM_preloadImages('image/logo1205.png')">
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
	<table width="80%"  border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td><span class="style1">当前位置：<a href="logout.jsp">登录页</a>&gt;&gt;<a href="admilogin.jsp">管理员主界面</a>&gt;&gt;<a href="stumanage.jsp">学生帐户管理</a>&gt;&gt;详细信息</span></td>
	  </tr>
	</table>
	<br>
	<div align="center">
	  <table width="276" border="1" cellspacing="1" bordercolor="#799AE1">
		<tr>
		  <th width="110" nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">用户名：</div></th>
		  <td width="156" nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=username%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">姓名：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=name%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">性别：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=sex%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">出生日期：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=birthday%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">院系：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=deptname%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">专业：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=profession%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">班级：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=classes%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">学号：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=num%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">E-mail：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=email%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">状态：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=state%></div></td>
		</tr>
		<tr>
		  <th nowrap bgcolor="#CCCCCC" class="trh" scope="row"><div align="right">身份：</div></th>
		  <td nowrap bgcolor="#FFCC99" class="trh1"><div align="left"><%=body%></div></td>
		</tr>
	  </table>
	  <p><a href="stuinfoupdate.jsp?username=<%=username%>"><img src="image/logo1268.gif" alt="" name="Image1" width="89" height="31" border="0" id="Image1" onMouseOver="MM_swapImage('Image1','','image/logo1205.png',1)" onMouseOut="MM_swapImgRestore()"></a></p>
	</div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
