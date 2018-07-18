<%-- 
    Document   : login_patient
    Created on : 10 Mar, 2017, 12:09:04 PM
    Author     : 1405299
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Patient Login</title>
  <link rel="icon" type="image/png" href="assets/img/health.png"/>
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
    background-image: url("assets/img/patient_image.jpg");
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
    <form id="msform" action="log_patient.jsp" method="post" autocomplete="on">
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Sign in</h2>
    <%
        String s=(String) request.getAttribute("erru");
        if(s!=null){
    %>
        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= s %></div>
    <% } %>
    <%
        String sr=(String) request.getAttribute("erro");
        if(sr!=null){
    %>
        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= sr %></div>
    <% } %>
    <%
        String s1=(String) request.getAttribute("msg");
        if(s1!=null){
    %>
        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= s1 %></div>
    <% } %>
    
    <%
        String sm=(String) request.getAttribute("msg2");
        if(sm!=null){
    %>
        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= sm %></div>
    <% } %>
    <input type="text" name="email" placeholder="Email or username" required pattern="(^[A-Za-z0-9_@]{5,15}$)|((?!(^[.-].*|[^@]*[.-]@|.*\.{2,}.*)|^.{254}.)([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@)(?!-.*|.*-\.)([a-zA-Z0-9-]{1,63}\.)+[a-zA-Z]{2,15})" title="Enter a valid one" />
    <input type="password" name="pass" placeholder="Password" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="invalid password (UpperCase, LowerCase, Number/SpecialChar and min 8 Chars)" />
    <a href="userForgotPass.jsp" name="fpass" style="text-align:right; color:cyan; "><p>Forgot password</p></a>
    <input type="submit" name="submit" class="submit action-button" value="Submit" /> <br>
    <input type="button" name="register" class="register action-button" value="Register" onclick="location.href='register_patient.jsp';"/>
  </fieldset>
  
</form>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="assets/js/login.js"></script>
   
</body>
</html>
