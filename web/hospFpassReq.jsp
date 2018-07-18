<%-- 
    Document   : hospFpassReq
    Created on : 21 Mar, 2017, 7:48:05 PM
    Author     : 1405299
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String var=request.getParameter("var");
%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Reset Password</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="assets/css/login.css">

    <!--FOR NAV BAR]-->
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="assets/css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    
 <!--END OF NAV BAR-->
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script> 
    <style type="text/css">
   html {
    background-image: url("assets/img/forgot.jpg");
    background-repeat: no-repeat;
    background-size: cover;
}
  </style>
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" >
	
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" rel="home" href="#"><img src="assets/css/health.png" style="max-width:30px; margin-top: -9px;margin-bottom: -10px;"></a>
	</div>
	
	<div class="collapse navbar-collapse" style="margin-left: 40%;">
		
		<ul class="nav navbar-nav" >
			<li><a href="index.jsp#Home" style="margin-right: 25px;">Home</a></li>
			<li><a href="index.jsp#About" style="margin-right: 25px;">About us</a></li>
			<li><a href="index.jsp#Contact_us" >Contact</a></li>
		</ul>

		
	</div>
</div>
    <form id="msform" action="hospFpassReq2.jsp" onsubmit="return ValidateForm();" method="post" >
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Forgot Password</h2>
    <%
        String s=(String) request.getAttribute("errf");
        if(s!=null){
    %>
        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= s %></div>
    <% } %>
    <%
        String sr=(String) request.getAttribute("errf1");
        if(sr!=null){
    %>
        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= sr %></div>
    <% } %>
    <input type="hidden" name="uname" value="<%=var%>" />
    <input type="number" name="token" placeholder="Code" required="required" />
    <input type="password" id="pass1" name="pass" placeholder="New Password" required="required" />
    <input type="password" id="pass2" name="pass1" placeholder="Confirm New Password" required="required" />
    <input type="submit" name="submit" class="submit action-button" value="Change Password" style="width:10em;" /> <br>
  </fieldset>
  
</form>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="assets/js/login.js"></script>
   <script type="text/javascript">
    function ValidateForm() {
        var password = document.getElementById("pass1").value;
        var confirmPassword = document.getElementById("pass2").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
    
</body>
</html>
