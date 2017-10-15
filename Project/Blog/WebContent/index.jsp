<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>

<% 
   String userName = (String)request.getSession().getAttribute("userName");
   String e_mail = (String)request.getSession().getAttribute("IDentity");
 %>

<!DOCTYPE html>
<html>
<head>
<title>Joshion's Website</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="jobshion.css">
<style type="text/css">
#main_pannel{
    padding-left: 20px;
    overflow: hidden;
    margin: 100px auto;
    width: 900px;
}
</style>

</head>
<body>
	<header>
		<div class="headCenter">
			<a href="index.jsp"> Joshion's Website </a>
			<span>           <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=0 height=0
    src="http://music.163.com/outchain/player?type=2&id=28481066&auto=1&height=66"></iframe></span>
			<div class="login">
				<%
				    if (null == userName || userName.isEmpty())
				    {
				%>
				<a href="login.jsp">SignIn</a> <a href="register.jsp">SignUp</a>
				<%
				    }
				    else
				    {
				%>
				<a href="#">
					<% out.print(userName); %>
				</a> <a href="SignOutServlet">Exit</a>
				<%
				    }
				    ;
				%>
			</div>
		</div>
	</header>
	<div id="main_pannel">
		<article id="grid">
			<ul>
			    <li><a href="BoxServlet?series=Diary"> Diary </a></li>
				<li><a href="Message.jsp"> Message </a></li>
				<li><a href="BoxServlet?series=By-Gone"> By-Gone </a></li>
			</ul>
		    <ul>
                <li><a href="BoxServlet?series=Linux">Linux</a></li>
                <li><a href="#"></a></li>
                <li><a href="BoxServlet?series=Windows">Windows</a></li>
            </ul>
			<ul>				               
                <li><a href="BoxServlet?series=CPlusPlus"> C++ </a></li>
                <li><a href="BoxServlet?series=Java">Java</a></li>
				<li><a href="BoxServlet?series=Python"> Python </a></li>
			</ul>
		</article>
	</div>
	<footer>
		<p>Copyright&nbsp;&copy;&nbsp;2015-2016&nbsp;Joshion</p>
		<a href="http://www.miitbeian.gov.cn" target="_blank">粤ICP备16038087</a>
	</footer>
</body>
</html>