<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>

<%
    String userName = (String) request.getSession().getAttribute("userName");
    String e_mail = (String) request.getSession().getAttribute("IDentity");
%>
<!DOCTYPE html>
<html>
<head>
<title>Left a Message</title>
<link rel="stylesheet" type="text/css" href="jobshion.css">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="exporter-version"
	content="Evernote Windows/277906; Windows/10.0.10586 (Win64);" />
<style type="text/css">

#writepanel{
    background-color: rgba(5,4,0,0.5);
    text-align:right;
    width: 80%;
    padding: 20px 20px 15px 20px;
}

#writepanel .input {
    margin-top: 5px;
    padding: 0px 4px 4px 4px;
    background-color: rgba(5,4,0,0.5);
    font-size: 15px;
    font-family: Comic Sans MS;
}
#writepanel .inputE_mail {
    margin-top: 5px;
    padding: 0px 4px 4px 4px;
    font-size: 15px;
    font-family: Comic Sans MS;
}

#writepanel textarea {
    background: rgba(255,255,255,0.3);
    font-size: 15px;
    resize:none;
    height: 200px;
    width: 100%;
    font-family: Comic Sans MS;
}

.info {
    font-size: 15px;
    font-style: italic;
    font-family: Comic Sans MS;
    color:  rgba(255, 105, 180,0.7);
}

.message {
    font-size: 15px;
    font-style: italic;
    font-family: Comic Sans MS;
    color: red;
}
</style>

<script type="text/javascript" src="jquery.min.js"> </script>
<script type="text/javascript">
$(function() {
    $(":input[name='submit']").click(function() {
    	var signed = "false";
    	var e_mail = "e_mail";
    	<%
    	   if (null == e_mail || e_mail.isEmpty())
    	   {
    	%>
	        signed = "false";
	        e_mail = document.getElementById("e_mail").value;
    	<%	
    	   }else {
    	%>
	        signed = "true";
	        e_mail = '<%=(String)request.getSession().getAttribute("IDentity")%>';
    	<%
    	   };
    	%>
    	var message = document.getElementById("message");
    	if(message != null && message.value != "" && e_mail != "") {
            var url = "LeftMessageServlet";
            var args = {
                "e_mail": e_mail,
                "message": message.value,
                "signed": signed,
                "time" : new Date()
            };
            $.post(url, args, function(data) {
                $("#successOrNot").html(data);
                return true;
            })  	
    	}
    	else {
    		$("#successOrNot").html("<label class='message'> failure！</label>");
    	}
    	return true;
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
                    <% out.print(userName); %>
                </a> <a href="SignOutServlet">Exit</a>
                <%
                    }
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
        <form id="leftMessage" name="leftMessage" method="post">
            <div id="writepanel" >
                <textarea id ="message"  name="message" required="required" 
                placeholder="say what you want..."></textarea>
                <div>
                    <span id="successOrNot">                     
                    </span>
	                <%
	                    if (null == userName || userName.isEmpty())
	                    {
	                %>
		                <input id="e_mail" class="inputE_mail" name="e_mail" type="text"
		                    required="required" maxlength=40 placeholder="Your E-mail"/>
		            <%
                        }
		            %>
                        <input name="submit" type="reset" class="input" value="Left a Message"/>
                </div>
            </div>
        </form>
    </div>
</body>
</html>