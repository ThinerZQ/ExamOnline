<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML><HEAD><TITLE>登录界面</TITLE>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
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
.style3 {font-size: 12px; }
body {
	background-color:#0033FF;
	margin:0px;
}
.STYLE13 {
	color: #3399FF;
	font-weight: bold;
}
.STYLE16 {color: #FFFFFF}
.STYLE17 {color: #FFFFFF; font-weight: bold; }
.STYLE18 {
	color: #FFFFFF;
	font-style: italic;
	font-weight: bold;
	font-size: xx-large;
}
-->
</style>
</HEAD>
<BODY onLoad="MM_preloadImages('image/logo1230.gif')">
<table border=0 cellpadding=0 cellspacing=0 height="90%" width="100%">
  <tbody>
    <tr>
      <td height="587"><table align=center border=0 cellpadding=0 cellspacing=0 height=469 
      width=763>
        <tbody>
          <tr>
            <td height="469" ><table border=0 cellpadding=0 cellspacing=0 height=391 width=763>
              <!--DWLayoutTable-->
              <tbody>
                
                <tr>
                  <td width="763" height="96" align="center"><img src="image/OnlineExam.jpg"></td>
                </tr>
                <tr>
                  <td height=140><div align=center>
                    <table border=0 cellpadding=4 cellspacing=0 width="52%">
                      <tbody>
                        <tr>
                          <td class=t1><div align="center" class="STYLE18">用户登录界面</div></td>
                        </tr>
                        <tr>
                          <td height=120><form action="login.jsp" method=post name=form1>
                            <div align=center>
                              <table border=0 cellpadding=3 cellspacing=0 
                          width="85%">
                                <tbody>
                                  <tr>
                                    <td width="47%"><div align="right" class="STYLE13"><span class="STYLE16">用户名:</span></div></td>
                                    <td width="53%"><div align="left">
                                      <input class=input1 id=username2 
                              name=username>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td><div align="right" class="STYLE17">密&nbsp;&nbsp;码:</div></td>
                                    <td><div align="left">
                                      <input class=input1 id=password name=password 
                              type=password>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td><div align="right" class="STYLE17">身&nbsp;&nbsp;份:</div></td>
                                    <td><div align="left">
                                      <select name="body" size="1" id="body">
                                        <option  value="stud"selected>学 生</option>
                                        <option value="teac">教 师</option>
                                        <option value="admi">管 理 员</option>
                                      </select>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td><div align="right">
                                      <input name=Submit type=submit id="Submit" value=登录>
                                    </div></td>
                                    <td><div align="left">
                                                    <input type="reset" name="Submit" value="重置">
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td colspan=2><div align="right"><a href="regist.jsp" class="STYLE16">注册</a>&nbsp;&nbsp;</div></td>
                                  </tr>
                                  <tr>
                                    <td colspan=2><div align="center"><a href="regist.jsp" onMouseOver="MM_swapImage('Image1','','image/logo1230.gif',1)" onMouseOut="MM_swapImgRestore()">R</a></div></td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </form></td>
                        </tr>
                      </tbody>
                    </table>
                  </div></td>
                </tr>
              </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
          <p>&nbsp;</p>
        <table width="100%" border="0" align="center" cellspacing="0">
            <tr>
              <td width="96%"><div align="center">Thanks my teachers and all Students who help me.</div></td>
            </tr>
            <tr>
              <td><div align="center" class="style3">
                <p>开发人员:不抽香烟 CopyRight: All Reserved. 2014. </p>
              </div></td>
          </tr>
            <tr>
              <td height="14"><div align="center" class="style3">
            </tr>
        </table></td>
    </tr>
  </tbody>
</table>
</BODY></HTML>
