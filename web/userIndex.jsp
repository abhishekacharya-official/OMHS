
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>OMHS-<%= userName %></title>
    <link rel="icon" type="image/png" href="assets/img/health.png"/>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="userIndex.jsp"><%= userName %></a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="logout_patient.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a class="active-menu"  href="userIndex.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a  href="userAddA.jsp"><i class="fa fa-desktop fa-3x"></i> Add Appointment</a>
                    </li>
                    <li>
                        <a  href="userMyA.jsp"><i class="fa fa-qrcode fa-3x"></i> My Appointments</a>
                    </li>
						   <li  >
                        <a   href="userPres.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Prescriptions</a>
                    </li>
                    <li>
                        <a href="userEditPro.jsp"><i class="fa fa-dashboard fa-3x"></i> Edit Profile</a>
                    </li>				
					
					                   
                    
                  <li>
                        <a  href="userSett.jsp"><i class="fa fa-square-o fa-3x"></i> Settings</a>
                    </li>	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>My Profile</h2>   
                        <h5>Welcome to Online Multipurpose Healthcare System. </h5>
                    </div>
                </div>       <hr />         
                 <!-- /. ROW  -->
                <h4>This is the dashboard. Here you can-</h4>
                <ul>
                    <li><h4>Make new appointments.</h4></li>
                    <li><h4>View the appointments.</h4></li>
                    <li><h4>View your prescriptions.</h4></li>
                    <li><h4>Edit your profile.</h4></li>
                </ul>	
            
                 <!-- /. ROW  -->           
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
