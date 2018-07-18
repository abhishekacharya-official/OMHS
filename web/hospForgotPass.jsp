<%-- 
    Document   : userForgotPass
    Created on : 20 Mar, 2017, 8:53:54 PM
    Author     : 1405299
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Forgot Password</title>
  
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
			<li><a href="index.jspsss#Contact_us" >Contact</a></li>
		</ul>

		
	</div>
</div>
    <form id="msform" action="hospForgotPass1.jsp" method="post">
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Forgot Password</h2>
    <%
            String s=(String) request.getAttribute("err1");
            if (s!=null){
        %>
        <div class="alert alert-danger  " style="padding: 0px;border-radius: 3px;margin-bottom: 10px;width: 100%;box-sizing: border-box;font-size: 13px;"><h3 class="fs-subtitle"><%= s %></h3></div>
        <%}%>
        <%
            String s1=(String) request.getAttribute("err2");
            if (s1!=null){
        %>
        <div class="alert alert-danger " style="padding: 0px;border-radius: 3px;margin-bottom: 10px;width: 100%;box-sizing: border-box;font-size: 13px;"><h3 class="fs-subtitle"><%= s1 %></h3></div>
        <%}%>
    <input type="email" name="mail" placeholder="Hospital Email" required="required" />
    <input type="submit" name="submit" class="submit action-button" value="Send Mail" /> <br>
  </fieldset>
  
</form>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="assets/js/login.js"></script>
   
</body>
</html>
