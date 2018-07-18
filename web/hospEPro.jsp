
 <%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
            //allow access only if session exists
            String uname = null;
            if(session.getAttribute("huname") == null){
                    response.sendRedirect("login_hospital.jsp");
            }else uname = (String) session.getAttribute("huname");
            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                    if(cookie.getName().equals("huname")) userName = cookie.getValue();
                    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
            }
            }else{
                    sessionID = session.getId();
            }
%>

<%
    String hid=null,hname=null,contact=null,addr=null,state=null,city=null;
    try{
        Connection con=connDao.getCon();
        Statement stm=con.createStatement();
        ResultSet rs=stm.executeQuery("select * from hospital_details where h_id ='"+userName+"'");
        while(rs.next()){
            hid=rs.getString("h_id");
            hname=rs.getString("h_name");
            contact=rs.getString("h_contact");
            addr=rs.getString("h_addr");
            state=rs.getString("h_state");
            city=rs.getString("h_city");
           }     
    }
    catch(Exception e){
        e.printStackTrace();
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
                <a class="navbar-brand" href="hospIndex.jsp"><%=userName%></a> 
            </div>
            <div id="logout" ><a href="logout_hospital.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				    <li>
                        <a  href="hospIndex.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                    <li>
                        <a    href="hospApp.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Appointments</a>
                    </li>
                    <li>
                        <a  href="hospAdDoc.jsp"><i class="fa fa-desktop fa-3x"></i> Add Doctor</a>
                    </li>
                    <li>
                        <a  href="hospVDoc.jsp"><i class="fa fa-qrcode fa-3x"></i> View Doctor</a>
                    </li>
		    <li>
			<a class="active-menu" href="hospEPro.jsp"><i class="fa fa-qrcode fa-3x"></i> Edit Profile</a>
                    </li>	 				
		    <li>
                        <a  href="hospSett.jsp"><i class="fa fa-square-o fa-3x"></i> Settings</a>
                    </li>	
                </ul>
               
            </div>
            
        </nav>  
             <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Edit Hospital Profile</h2>   
                        <h5>Here You Can Edit Your Profile</h5>
                    </div>
                </div>       <hr />         
                 <!-- /. ROW  -->
                 <form id="msform">
                <fieldset>
                  <h2 class="fs-title">Edit Hospital Details</h2>
                  <input type="text" name="uname" value="<%=hid%>" readonly="readonly" />
                  <input type="text" name="hname"  placeholder="Edit Name of Hospital" value="<%=hname%>" required="required"/> 
                  <input type="tel" name="contact" placeholder="Contact" value="<%=contact%>" required="required"/>
                  <textarea name="address" placeholder="Address"  required="required"><%=addr%>"</textarea>
                  <div class="form-group">
                    <select id="state" class="form-control" onchange='selct_district(this.value)' required="required"><%=state%></select>
                  <br/>
                    <select id="cities" class="form-control" required="required"><%=city%></select>
                  </div><!--drop down-->
                  <input type="reset" name="reset" class="reset action-button" value="Reset" />
                  <input type="submit" name="submit" class="submit action-button" value="Submit" />
                  </fieldset> 
                </form>

            
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
    <script type="text/javascript" src="assets/js/state.js"></script> 
    
   
</body>
</html>
