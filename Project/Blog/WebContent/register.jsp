<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>

<%
    String userName = (String) request.getSession().getAttribute("userName");
	String e_mail = (String) request.getSession().getAttribute("IDentity");
	String message = (String) request.getSession().getAttribute("message");
	request.getSession().removeAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
<title>SignUp</title>
<link rel="stylesheet" type="text/css" href="jobshion.css">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="exporter-version"
	content="Evernote Windows/277906; Windows/10.0.10586 (Win64);" />
<style type="text/css">

#align{
    text-align:right;
    width:450px;
    font-size:20px; 
}

.color {
	font-size: 15px;
	font-style: italic;
	color: white;
	font-family: Comic Sans MS;
}

.message {
	font-size: 15px;
	font-style: italic;
	font-family: Comic Sans MS;
	color: red;
}

.info {
	font-size: 15px;
	font-style: italic;
	font-family: Comic Sans MS;
	color: green;
}

input {
	width: 250px;
	height: 30px;
	font-size: 18px;
}
</style>
<script type="text/javascript" src="jquery.min.js"> </script>
<script type="text/javascript">
	function verifyPassword() {
		var password = document.getElementById("password");
		var passwordAgain = document.getElementById("passwordAgain");

		var insertText;
		var flag = false;
		if (password.value.length < 6 || passwordAgain.value.length < 6) {
            insertText = "<label class='message'>Password length too short to register!</label>";
            flag = false;
		} else if (password.value != passwordAgain.value) {
            insertText = "<label class='message'>Please verify password！</label>";
            flag = false;
		} else if (password.value == passwordAgain.value) {
			insertText = "<label class='info'>Password could be used!</label>";
			flag = true;
		}
		document.getElementById("insert").innerHTML = insertText;
		return flag;
	}
	
	function tryToRegister() {
	    var e_mail = document.getElementById("e_mail");
	    var userName = document.getElementById("userName");

		if(e_mail.isEmpty || userName.isEmpty || false == verifyPassword()) {
	         return false;
	    } 
	    else {
            var form=document.forms[0];
            form.action="RegisterServlet";
            form.submit();
	    }
	}
	
    $(function() {
        $(":input[name='e_mail']").change(function() {
            var val = $(this).val();
            val = $.trim(val);
            if (val != "") {
                var url = "CheckE_mailServlet";
                var args = {
                    "e_mail" : val,
                    "time" : new Date()
                };
                $.post(url, args, function(data) {
                    $("#checkE_mail").html(data);
                })
            }
        });
    })
	
	$(function() {
        $(":input[name='userName']").change(function() {
            var val = $(this).val();
            val = $.trim(val);
            if (val != "") {
                var url = "CheckUserNameServlet";
                var args = {
                    "userName": val,
                    "time" : new Date()
                };
                $.post(url, args, function(data) {
                    $("#checkUserName").html(data);
                })
            }
        });
    })
    
</script>
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
				<%
				    out.print(userName);
                %>
				</a> <a href="SignOutServlet">Exit</a>
				<%
				    }
				    ;
				%>
			</div>
		</div>
	</header>
	<div id="main_pannel">
		<form id="signUpTable" name="signUpTable" action="RegisterServlet"
			method="post">
			<div id="align">
				E-mail Address<input id="e_mail" name="e_mail" type="text"
					maxlength=40 required="required" placeholder="E-mail"></input>
				<div id="checkE_mail">
					<label class="color"> Your e-mail address is your Sign in
						account. </label>
				</div>

				<p>
					UserName <input id="uesrName" name="userName" type="text"
						required="required" placeholder="UserName"></input>
				</p>
				<div id="checkUserName">
					<label class="color"> userName is unique, length between 2
						and 16<br /> others can use @userName to refer you.
					</label>
				</div>
				Password <input id="password" name="password" type="password"
					maxlength=20 required="required" placeholder="Password"></input>
				<p class="color">
					Passwords must have numbers and characters,<br /> not match any
					part of your e-mail,<br /> and be at least 8 characters long.
				</p>
				<p>
					Re-enter password <input id="passwordAgain" name="passwordAgain"
						type="password" maxlength=20 required="required"
						placeholder="Verify password" onchange="verifyPassword()"></input>
				</p>
				<div id="insert">
					<br />
				</div>
				<input type="submit" value="Sign up" onclick="tryToRegister()"></input>
				<p>
					<label class="message"> 
					<%
						if (null != message)
						{
						    out.print(message);
						}
                    %>
					</label> <br />
				</p>
			</div>
		</form>
	</div>
</body>
</html>