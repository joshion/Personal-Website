<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>

<% 
   String userName = (String)request.getSession().getAttribute("userName");
   String e_mail = (String)request.getSession().getAttribute("e_mail");
   String message = (String)request.getSession().getAttribute("message");
   request.getSession().removeAttribute("message");
%>


<!DOCTYPE html>
<html>
<head>
<title>SignIn</title>
<link rel="stylesheet" type="text/css" href="jobshion.css">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="exporter-version"
	content="Evernote Windows/277906; Windows/10.0.10586 (Win64);" />
<style type="text/css">

#main_pannel{
    padding-left: 100px;
    overflow: hidden;
    margin: 100px auto;
    width: 900px;
}

#align{
    text-align:right;
    width:450px;
    font-size:20px; 
}

.message {
    font-size: 15px;
    color: red;
}

input {
    width: 250px;
    height: 30px;
    font-size: 18px; 
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
	<div id="main_pannel">
		<form id="formId" action="SignInServlet" method="post">
		    <div id="align">
				<p>
					<label>IDentity</label> <input id="IDentity" name="IDentity" type="text"
						maxlength=40 required="required" placeholder="UserName/e-mail"></input> 
				</p>
				<p>
				    <br/>
				</p>
				<p>
					<label>password</label> <input id="password" name="password"
						type="password" maxlength=40 required="required" placeholder="Password"></input>
				</p>
				<p>
					<br />
				</p>
				<input type="submit" value="Sign in" /></input>
				<p>
				<label class="message">
				<%
                    if (null != message)
                    {
                        out.print(message);
                    }
                %>
                </label>
                    <br />
                </p>
			</div>
		</form>
	</div>
</body>
</html>