<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
session.removeAttribute("username");
session.removeAttribute("paperid");
session.removeAttribute("title");
session.removeAttribute("tpri");
session.removeAttribute("loaded");
response.sendRedirect("index.jsp");
%>
<title>�ޱ����ĵ�</title>
</head>

<body>

</body>
</html>
 