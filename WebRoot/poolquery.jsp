<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����ѯ</title>
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
    font-size: 13px;
    font-weight:bold
}
.trh1
{
 
    background-color: #FFFDE8;
    color: #2E60C9;
    font-size: 12px;
    
}
.style1 {font-size: small}
.STYLE2 {
	font-size: xx-large;
	color: #0033FF;
}
-->
</style></head>
<jsp:useBean id="poolquery" scope="page" class="exam.ExamBean"></jsp:useBean>
<jsp:useBean id="subjBean" scope="page" class="exam.ExamBean"></jsp:useBean>
<%
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");

String username1=(String)session.getAttribute("username");
Integer tpri1=(Integer)session.getAttribute("tpri");
if(username1!=null && tpri1.intValue()==2){
%>
<body>
<table width="100%" border="0" align="center" cellspacing="0" bgcolor="#0033FF">
  <tr>
    <td align="center"><img src="image/OnlineExam.jpg"></td>
  </tr>
</table>
<table width="363" border="0" cellspacing="0">
  <tr>
    <td width="361"><span class="style1">��ǰλ�ã�<a href="logout.jsp">��¼ҳ</a>&gt;&gt;<a href="teaclogin.jsp">��ʦ������</a>&gt;&gt;������</span></td>
  </tr>
</table>
<BR>
<div align="center">
  <form name="form2" method="post" action="poolquery.jsp">
    <table width="565" border="1" cellspacing="1" bordercolor="#799AE1">
      <tr>
        <td width="44" class="trh"><div align="center">����</div></td>
        <td width="113" class="trh1"><div align="center">
            <select name="Qtype" size="1" id="Qtype">
              <option selected>--��ѡ��--</option>
              <option>����ѡ����</option>
              <option>����ѡ����</option>
              <option>�ж���</option>
            </select>
        </div></td>
        <td width="84" class="trh"><div align="center">��Ŀ�ؼ���</div></td>
        <td width="78" class="trh1"><div align="center">
            <input name="Qkey" type="text" id="Qkey" size="10">
        </div></td>
        <td width="43" class="trh"><div align="center">��Ŀ</div></td>
        <td width="99" class="trh1"><div align="center">
            <select name="subjname" size="1" id="subjname">
              <option selected>--��ѡ��--</option>
              <%
			String sql="select subjname from subject";
			ResultSet rset=subjBean.executeQuery(sql);
			while(rset.next()){
			String subjname=rset.getString(1);
			%>
              <option><%=subjname%></option>
              <%}rset.close();subjBean.closeStmt();%>
            </select>
        </div></td>
        <td width="66" class="trh"><div align="center">
          <input type="submit" name="Submit" value="����">
        </div></td>
      </tr>
    </table>
  </form>
</div>
<form name="form1" method="post" action="poolquery.jsp">
<%
String Qtype=request.getParameter("Qtype");
String Qkey=request.getParameter("Qkey");
String subj=request.getParameter("subjname");
String countsql="",querysql="",sub1="",sub2="",sub3="";
if(Qtype!=null && !Qtype.equals("--��ѡ��--"))
	sub1="and type='"+Qtype+"'";
if(Qkey!=null)
	sub2="and question like '%"+Qkey+"%'";
if(subj!=null && !subj.equals("--��ѡ��--"))
	sub3="and subj='"+subj+"'";
if((sub1+sub2+sub3).length()!=0){
	countsql="select count(*) as cnt from pool where"+(sub1+sub2+sub3).substring(3);
	querysql="select * from pool where"+(sub1+sub2+sub3).substring(3);
}else{
	countsql="select count(*) as cnt from pool";
	querysql="select * from pool";
}
int intPage=1;
int totalRec=0;
if (request.getParameter("page")!=null)
	intPage=Integer.parseInt(request.getParameter("page"));
ResultSet rs1=null;
rs1=poolquery.executeQuery(countsql);
if(rs1.next())
	totalRec=rs1.getInt("cnt");	
rs1.close();
if(totalRec!=0){
	int pageLine=10;
	int i;
	if(pageLine>totalRec)
		pageLine=totalRec;
	int intPageCount=0;
	int Sequence=0;
	String question="";
	String option1="";
	String option2="";
	String option3="";
	String option4="";
	String answer="";
	String subject="";
	String type="";
%>
  <div align="center">
    <table width="100%" border="1" align="center" cellspacing="1" bordercolor="#799AE1" >
      <tr class="trh">
        <th width="34" nowrap scope="col"><div align="center">���</div></th>
        <th width="508" nowrap scope="col"><div align="center">��Ŀ</div></th>
        <th width="40" nowrap scope="col"><div align="center">ѡ��A</div></th>
        <th width="40" nowrap scope="col"><div align="center">ѡ��B</div></th>
        <th width="40" nowrap scope="col"><div align="center">ѡ��C</div></th>
        <th width="40" nowrap scope="col"><div align="center">ѡ��D</div></th>
        <th width="74" nowrap scope="col"><div align="center">��ȷ��</div></th>
        <th width="34" nowrap scope="col"><div align="center">��Ŀ</div></th>
        <th width="34" nowrap scope="col"><div align="center">����</div></th>
        <th width="34" nowrap scope="col"><div align="center">ɾ��</div></th>
        <th width="34" nowrap scope="col"><div align="center">�޸�</div></th>
      </tr>
      <%
intPageCount=(totalRec+pageLine-1)/pageLine;
ResultSet rs2=poolquery.executeQuery(querysql);
if(intPageCount>0){
	for(i=1;i<=(intPage-1)*pageLine;i++)
	rs2.next();
	for(i=1;i<=pageLine;i++){
		if(rs2.next()){
			Sequence=rs2.getInt("sequence");
			subject=rs2.getString("subj");
			type=new String(rs2.getString("type").getBytes("GBK"));
			question=rs2.getString("question");
			option1=rs2.getString("option1");
			option2=rs2.getString("option2");
			option3=rs2.getString("option3");
			option4=rs2.getString("option4");
			answer=rs2.getString("answer");
%>
      <tr class="trh1">
        <td scope="col"><div align="center"><%=Sequence%></div></td>
        <td scope="col"><div align="left"><%=question%></div></td>
        <td scope="col"><div align="center"><%=option1%></div></td>
        <td scope="col"><div align="center"><%=option2%></div></td>
        <td scope="col"><div align="center"><%=option3%></div></td>
        <td scope="col"><div align="center"><%=option4%></div></td>
        <td scope="col"><div align="center"><%=answer%></div></td>
        <td nowrap scope="col"><div align="center"><%=subject%></div></td>
        <td nowrap scope="col"><div align="center"><%=type%></div></td>
        <td scope="col"><div align="center"><a href="pooldel.jsp?Sequence=<%=Sequence%>"><img src="image/btn_FileDelete.gif" width="16" height="16" border="0" onclick="return confirm('ȷ��Ҫɾ����');"></a></div></td>
        <td scope="col"><div align="center"><a href="pooledit.jsp?Sequence=<%=Sequence%>"><img src="image/Edit.gif" width="18" height="13" border="0"></a></div></td>
      </tr>
      <%}
else
i=pageLine+1;
}
}rs2.close();
poolquery.closeStmt();
%>
    </table>
    <p>
      <%
if(intPageCount*pageLine<totalRec)
	intPageCount++;
if(intPage>intPageCount)
	intPage=intPageCount;
if(intPage<1)
		intPage=1;
%>
    </p>
    <table width="792" border="0" align="bottom" cellspacing="0" bordercolor="#000000">
      <tr>
        <%if(intPage<2){%>
        <td width="38" height="28"><div align="center">��ҳ</div></td>
        <td width="54"><div align="center">��һҳ</div></td>
        <%}else{%>
        <td width="38"><div align="center"><a href="poolquery.jsp?page=1">��ҳ</a></div></td>
        <td width="54"><div align="center"><a href="poolquery.jsp?page=<%=intPage-1%>">��һҳ</a></div></td>
        <%}if(intPage-intPageCount>=0){%>
        <td width="54"><div align="center">��һҳ</div></td>
        <td width="38"><div align="center">βҳ</div></td>
        <%}else{%>
        <td width="54"><div align="center"><a href="poolquery.jsp?page=<%=intPage+1%>">��һҳ</a></div></td>
        <td width="38"><div align="center"><a href="poolquery.jsp?page=<%=intPageCount%>">βҳ</a></div></td>
        <%}%>
        <td width="98"><div align="center">ҳ�Σ�<%=intPage%>/<%=intPageCount%>ҳ</div></td>
        <td width="60"><div align="center">��<%=totalRec%>��</div></td>
        <td width="68"><div align="center"><%=pageLine%>��/ҳ</div></td>
        <td width="174"><div align="center">ת����
                <input name="page" type="text" id="page" size="5">
          ҳ
          <input name="cndok" type="submit" id="cndok3" value="GO">
        </div></td>
      </tr>
    </table>
  </div>
  <%}else{ %>
  <table width="77%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="67%" align="center" valign="middle" nowrap><div align="center"><font  size="+2">û�в�ѯ����������������!</font></div></td>
    </tr>
  </table>
  <%}%>
</form>
</body>
<%}
else response.sendRedirect("index.jsp");
%>
</html>
