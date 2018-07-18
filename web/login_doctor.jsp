<%-- 
    Document   : login_doctor
    Created on : 10 Mar, 2017, 12:04:41 PM
    Author     : 1405299
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Signup</title>
  
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
    background-image: url("assets/img/doctor_image.jpg");
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
    
    <div class="collapse navbar-collapse"style="margin-left: 40%;">
        
                
        <ul class="nav navbar-nav" >
            <li><a href="index.jsp#Home" style="margin-right: 25px;">Home</a></li>
            <li><a href="index.jsp#About" style="margin-right: 25px;">About us</a></li>
            <li><a href="index.jsp#Contact_us" >Contact</a></li>
        </ul>
        
    </div>
</div>
<form id="msform" action="log_doctor.jsp" method="post">
         <%
        String s=(String) request.getAttribute("erru");
        if(s!=null){
    %>
        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= s %></div>
    <% } %>
    
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Sign in</h2>
    <input type="email" name="email" placeholder="Email" />
    <input type="password" name="pass" placeholder="Password" />
    <a href="#" name="Forgotpassword" style="text-align:right; color:cyan;"><p>Forgot password</p></a>
    <input type="reset" name="reset" class="reset action-button" value="Reset" />
    <input type="submit" name="submit" class="submit action-button" value="Submit" /> <br>
   </fieldset>
  
</form>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="js/login.js"></script>
   
</body>
</html>