   <%
            //allow access only if session exists
            String uname = null;
            if(session.getAttribute("uname") == null){
                    response.sendRedirect("login_patient.jsp");
            }
            else
                uname = (String) session.getAttribute("uname");
            
            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                    if(cookie.getName().equals("uname")) userName = cookie.getValue();
                    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
            }
            }else{
                    sessionID = session.getId();
            }
%>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>user details</title>
  <link rel="icon" type="image/png" href="assets/img/health.png"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="assets/css/register.css">
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
    <br>
<!-- multistep form -->
<form id="msform" action="reg_patient2.jsp" method="post">
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Enter Necessary Details</h2>
    <table>
        <tr>
            <input type="text" name="uname" value="<%= userName %>" readonly/>
        </tr>
    	<tr>
    		<td><input type="text" name="fname"  placeholder="First Name" required="required" pattern="/^[A-Za-z]*{3,30}\s{1}[A-Za-z]*{3,30}$/" title="only alphabets"/></td>
    		<td><input type="text" name="lname" placeholder="Last Name" required pattern="/^[A-Za-z]*{3,30}\s{1}[A-Za-z]*{3,30}$/" title="only alphabets" /></td>
    	</tr>
    </table>
    <input type="number" name="age" min="0" placeholder="Age" required/>
    <input type="text" name="contact" placeholder="Contact" required pattern="^[7-9]\d{9}$" title="Invalid number" />
    <textarea name="address" placeholder="Address" required></textarea>
    <table>
    	<tr>
    		<td>
    			<div class="form-group" style="width:175px">
                            <select class="form-control" id="Gender" name="gender" required>
            			<option value="" disabled selected>Gender</option>
            			<option value="Male">Male</option>
            			<option value="Female">Female</option>
            			<option value="Others">Others</option>
			        </select>
     			</div>
     		</td>
    		<td>
    			<div class="form-group" style="width:175px">
                            <select class="form-control" id="bloodgroup" name="bloodgroup" required>
            			<option value="" disabled selected>Blood group</option>
            			<option value="A+ve">A+ve</option>
            			<option value="A-ve">A-ve</option>
            			<option value="B+ve">B+ve</option>
            			<option value="B-ve">B-ve</option>
            			<option value="AB+ve">AB+ve</option>
            			<option value="AB-ve">AB-ve</option>
            			<option value="O+ve">O+ve</option>
            			<option value="O-ve">O-ve</option>
        			</select>
				</div>			
    		</td>
    	</tr>
    </table>
       
    <!--drop down-->
    <table>
        <tr>
            <td><input type="number" name="heightf" min="1" step="1" max="10" placeholder="Height(foot)" style="width: 175px;"/></td>
            <td><input type="number" name="heighti" min="0" step="1" max="11" placeholder="Height(inch)" style="width: 175px;"/></td>
        </tr>
    </table>
    <input type="number" name="weight" min="1" placeholder="Weight(kg)" />
     <input type="reset" name="reset" class="reset action-button" value="Reset" />
    <input type="submit" name="submit" class="submit action-button" value="Submit" />
  </fieldset>
</form>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    

</body>
</html>
