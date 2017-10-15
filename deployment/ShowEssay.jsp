<%@page import="Operator.Essay"%>
<%@ page language="java" import="java.util.*"
    contentType="text/html;charset=utf-8"%>

<%
    String userName = (String) request.getSession().getAttribute("userName");
    String e_mail = (String) request.getSession().getAttribute("IDentity");
    Essay essay = (Essay) request.getAttribute("essay");    
%>
<!DOCTYPE html>
<html>
<head>
<title>
<%
	if (null != essay)
	    out.print(essay.getTitle());  
%>
</title>
<link rel="stylesheet" type="text/css" href="jobshion.css">
<style type="text/css">
/**{
        margin: 0;
        padding: 0;
    }*/
</style>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="exporter-version"
    content="Evernote Windows/277906; Windows/10.0.10586 (Win64);" />
<style type="text/css">
#title {
    background-color: rgba(5,4,0,0.6);
    padding:0px 2px 2px 2px;
    min-height: 30px;
    font-size: 20px;
    text-align: center;
    color: #AFEEEE;
}

#showpanel{
    background-color: rgba(5,4,0,0.3);
    padding:10px 10px 10px 30px;
    white-space:normal; 
    word-wrap : break-word;
}
</style>
</head>
<body>
    <header>
        <div class="headCenter">
            <a href="index.jsp"> Joshion's Website </a>
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
    <nav id="sidebar">
        <ul>
            <li><a href="Message.jsp">Message</a></li>
            <li><a href="BoxServlet?series=Diary"> Diary </a></li>
            <li><a href="BoxServlet?series=By-Gone">By-Gone</a></li>
            <li><a href="BoxServlet?series=CPlusPlus">C++</a></li>
            <li><a href="BoxServlet?series=Java">Java</a></li>
            <li><a href="BoxServlet?series=Python">Python</a></li>
            <li><a href="BoxServlet?series=Linux">Linux</a></li>
            <li><a href="BoxServlet?series=Windows">Windows</a></li>
        </ul>
    </nav>
    <div id="main_pannel">
        <div id =title>
        <%
            if (null != essay)
            {
                if (essay.getTitle().isEmpty())
                    out.print("Title");
                else
                    out.print(essay.getTitle());     
            }
        %>  
        </div>
		<div id="showpanel" >
		<%
		    if (null != essay)
		        out.print(essay.getText());  
		%>
		</div>
    </div>
</body>
</html>