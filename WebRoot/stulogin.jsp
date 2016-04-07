<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="ChoosePaperBean" scope="page" class="exam.ExamBean"/>
<script language="JavaScript" type="text/javascript">
<!--
function checkform(){
	var f=document.forms[0];
	if(f.paperid.value=='0')
	{
		alert("请选择试卷!");
		return false;
	} 
	else{
	alert("点击“确定”后，进入考试，并开始计时。");
	return true;
	}
}
//-->
</script>
<title>学生登录界面</title>
<script language="JavaScript" type="text/javascript">
<!--



var timerID = null;
var timerRunning = false;

function stopclock (){
        if(timerRunning)
                clearTimeout(timerID);
        timerRunning = false;
}
function showtime () {
        var now = new Date();
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var seconds = now.getSeconds();
        var timeValue = "" + ((hours >12) ? hours -12 :hours);
        timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
        timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
        timeValue += (hours >= 12) ? " P.M." : " A.M.";
        document.forms[0].tt.value=timeValue;
        timerID = setTimeout("showtime()",1000);
        timerRunning = true;
}
function startclock () {
        stopclock();
        showtime();
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
</script>
<style type="text/css">
<!--
body {
	background-image: url(image/lvbgcolor.gif);
	margin:0px;
}
.style1 {
	color: #FF0000;
	font-weight: bold;
}
.style2 {color: #FF6600}
.style5 {font-size: medium; }
.STYLE6 {
	font-size: xx-large;
	color: #0033FF;
}
-->
</style></head>
<%
String username=(String)session.getAttribute("username");
Integer tpri=(Integer)session.getAttribute("tpri");
if(username!=null && tpri.intValue()==1){
%>
<body onLoad="startclock();MM_callJS('javascript:window.history.forward(1);')">
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<div align="center">
  <form name="form1" method="post" action="stuexam.jsp" onSubmit="return checkform();">
    <table width="756" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="21" valign="top" nowrap><p align="left">您好！<strong><%=session.getAttribute("username")%></strong></p></td>
        <td height="21" colspan="4" valign="top"><div align="center">
            <p>考生须知</p>
            </div></td>
        <td width="80" colspan="2" rowspan="8" valign="top" nowrap><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="13" valign="top" nowrap><div align="left">今天是：</div></td>
        <td height="13" colspan="4" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="15" valign="top" nowrap><div align="left">
          <script language="JavaScript" type="text/javascript"> var version = 1.0;</script>
          <script language=JavaScript1.1 type="text/javascript"> var version = 1.1;</script>
          <script language=JavaScript1.2 type="text/javascript"> var version = 1.2;</script>
          <script language=JavaScript1.3 type="text/javascript"> var version = 1.3;</script>
          <script language="JavaScript" type="text/javascript">
<!--
var y=new Date();  
var gy=y.getYear();  
var dName=new Array("星期天","星期一","星期二","星期三","星期四","星期五","星期六");  
var mName=new Array("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月");  
if (version < 1.3)  
{  
if (gy<2000)  
{  
	document.write("<FONT COLOR=\"black\" class=\"p1\">"+"19"+y.getYear()+"年" + mName[y.getMonth()] + y.getDate() + "日" + dName[y.getDay()] + "" + "</FONT>");  
}  
else  
	document.write("<FONT COLOR=\"black\" class=\"p1\">"+y.getYear()+"年" + mName[y.getMonth()] + y.getDate() + "日" + dName[y.getDay()] + "" + "</FONT>");  
}  
else  
{  
	document.write("<FONT COLOR=\"black\" class=\"p1\">"+y.getFullYear() +"年"+ mName[y.getMonth()] + y.getDate() + "日" + dName[y.getDay()] + "</FONT>");  
}  
//-->
        </script>
        </div></td>
        <td height="15" valign="top"><!--DWLayoutEmptyCell-->&nbsp; </td>
        <td height="18" colspan="3" valign="top">
        <div align="left" class="style5"> &nbsp;&nbsp;1.本考试系统出题由计算机<span class="style2">随机出题</span>，所有试卷均不相同。</div></td>
      </tr>
      <tr>
        <td height="16" valign="top" nowrap><div align="left">现在时间:
            <input type="text" name="tt" size="11">
        </div></td>
        <td height="16" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        <td height="36" colspan="3" valign="top">
        <div align="left" class="style5">&nbsp;&nbsp;2.每份试卷<span class="style2">只允许考一次</span>，中途退出或提交以后，则将不能再次考试。</div></td>
      </tr>
      <tr>
        <td height="100" rowspan="4" valign="top" nowrap><!--DWLayoutEmptyCell-->&nbsp;</td>
        <td height="13" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        <td height="18" colspan="3" valign="top">
        <div align="left" class="style5">&nbsp;&nbsp;3.考试题型均为客观题，考试完成交卷后即可看到你的考试成绩。</div></td>
      </tr>
      <tr>
        <td height="13" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        <td height="18" colspan="3" valign="top">
        <div align="left" class="style5">&nbsp;&nbsp;4.请在下面试卷列表中选择一份试卷，点击右边按钮<span class="style2">进入考试</span>。</div></td>
      </tr>
      <tr>
        <td height="13" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        <td height="18" colspan="3" valign="top">
        <div align="left" class="style5">&nbsp;&nbsp;5.若要退出本系统请点击“<a href="logout.jsp"><span class="style1">安全退出</span></a>”，防止他人冒用您的帐号。</div></td>
      </tr>
      <tr>
        <td height="13" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        <td height="13" colspan="3" valign="top"><div align="left"></div></td>
      </tr>
      <tr>
        <td width="144" height="74" rowspan="2" valign="top" nowrap>&nbsp;</td>
        <td width="19" height="21" valign="top" nowrap><div align="center">
</div></td>
        <td width="105" valign="top" nowrap><div align="center"><a href="queryscore.jsp">成绩查询</a></div></td>
        <td width="244" valign="top" nowrap><div align="center">
          <select name="paperid" size="1" id="paperid">
              <option selected value="0">--请选择试卷--</option>
              <%
	  String sql1="select paperid,paperhead,subjname,deptname from paper where paperstate=1";
	  ResultSet rs1=ChoosePaperBean.executeQuery(sql1);
	  while (rs1.next()){
		  int paperid=rs1.getInt("paperid");
		  String paperhead=new String(rs1.getString("paperhead").getBytes("GBK"));
		  String subjname=new String(rs1.getString("subjname").getBytes("GBK"));
		  String deptname=new String(rs1.getString("deptname").getBytes("GBK"));
		  String title=deptname+subjname+paperhead;
	  %>
              <option value="<%=paperid%>"><%=title%></option>
              <%}ChoosePaperBean.closeStmt();%>
          </select>
        </div></td>
        <td width="164" valign="top" nowrap><div align="center">
          <input type="submit" name="Submit" value="--&gt;进入考试">
        </div></td>
        <td colspan="2" rowspan="2" valign="top" nowrap><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="27" colspan="4" valign="top" nowrap><div align="center"></div></td>
      </tr>
    </table>
  </form>
</div>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
