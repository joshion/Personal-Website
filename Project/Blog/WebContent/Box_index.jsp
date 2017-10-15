<%@page import="Operator.Essay"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>

<% 
	String userName = (String)request.getSession().getAttribute("userName");
	String e_mail = (String)request.getSession().getAttribute("IDentity");
	String series = (String)request.getAttribute("series");
	ArrayList<Essay> essayList = (ArrayList<Essay>) request.getAttribute("essayList");    
%>
<!DOCTYPE html>
<html>
<head>
<title>
	<%
	   if (series == null)
	       out.print("default");
	   else
	       out.print(series);
	%>
</title>
<link rel="stylesheet" type="text/css" href="jobshion.css">
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="exporter-version"
	content="Evernote Windows/277906; Windows/10.0.10586 (Win64);" />
<style type="text/css">

#series{
    background-color: rgba(5,4,0,0.7);
    font-size: 20px;
    text-align: left;
    min-height: 30px;
    color:  rgba(255, 105, 180,0.7);
    padding:0px 2px 2px 2px;
}

/*目录文件中的布局*/
div#catalog {
    background-color: rgba(5,4,0,0.5);
    text-align:left;
    min-height:400px;
    min-width:800px;
    height: 100%;
    padding: 10px, 10px, 10px, 10px;
}
div#catalog li {
    margin-left: 20px;
    color: blue;
    list-style-type: none;
    overflow: hidden;
}

div#catalog li a:link { 
    color: #48D1CC; 
    text-decoration:none; 
}  

div#catalog li a:visited { 
	color: #FFF0F5; 
	text-decoration:none; 
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
        <div id="series" >
        <%
            if(series != null)
                out.print(series);
        %>
        </div>
        <div id="catalog">
        <%
         if (null != essayList)
         {
             for(int i = 0; i < essayList.size(); ++i)
             {
                 String title = essayList.get(i).getTitle();
                 /*if (title.length() > 60)
                 {
                     title = title.substring(0, 60)+ "...";
                 }*/
                 out.print("<li><a href='ShowEssayServlet?number=" +
                 essayList.get(i).getNumber() + "'>" + (i+1) + "."+  title + "</a></li>");
             }   
         }
        %>
        </div>
	</div>
</body>
</html>