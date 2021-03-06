<%-- 
    Document   : userAddA6
    Created on : 18 Mar, 2017, 8:55:27 PM
    Author     : 1405299
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

<%
    String pid=null,fname=null,lname=null,gender=null,contact=null,addr=null,bldgrp=null;
    int age=0,hft=0,hin=0,wi=0;        
    try{
        Connection con=connDao.getCon();
        String query="select * from patient_details where p_id =?";
        
PreparedStatement stm=con.prepareStatement(query);
stm.setString(1,userName);
        //Statement stm=con.createStatement();
        ResultSet rs=stm.executeQuery();
        while(rs.next()){
            pid=rs.getString("p_id");
            fname=rs.getString("p_f_name");
            lname=rs.getString("p_l_name");
            age=rs.getInt("p_age");
            gender=rs.getString("p_gender");
            contact=rs.getString("p_contact");
            addr=rs.getString("p_addr");
            bldgrp=rs.getString("p_blood_group");
            hft=rs.getInt("p_h_ft");
            hin=rs.getInt("p_h_in");
            wi=rs.getInt("p_weight");
            
            
        }     
    }
    catch(Exception e){
        e.printStackTrace();
    }
            
%>

<%
    String state=request.getParameter("state");
    String city=request.getParameter("city");
    String hosp=request.getParameter("hosp");
    String dept=request.getParameter("dept");
    String doctor=request.getParameter("doctor");
    String date1d=request.getParameter("datea"); 
    
%>
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
        </nav><!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                    </li>
                
                    
                     <li>
                        <a   href="userIndex.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
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
                        <a class="active-menu" href="userEditPro.jsp"><i class="fa fa-dashboard fa-3x"></i> Edit Profile</a>
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
                     <h2>Add Appointment</h2>   
                        <h5>Edit Details if booking is done for another person otherwise click on Submit</h5>
                        <hr/>
                        
                        
                <form id="msform" action="userAddA7.jsp" method="post">
                  <!-- fieldsets -->
                  <fieldset>
                  <h2 class="fs-title">Edit Necessary Details</h2>
                  <input type="hidden" name="puname" value="<%=userName%>"  />
                  <table>
                  <tr>
                      <td><input type="text" name="fname" value="<%=fname%>" placeholder="First Name" required="required" style="margin-right:7em"  /></td>
                    <td><input type="text" name="lname" value="<%=lname%>" placeholder="Last Name" required="required" style="margin-right:7em"/></td>
                  </tr>
                  </table>
                  <input type="number" name="age" value="<%=age%>" min="0" placeholder="Age" required="required"/>
                  <input type="tel" name="contact" value="<%=contact%>" placeholder="Contact" required="required"/>
                  <textarea name="address" placeholder="Address" required="required"><%=addr%></textarea>
                  <table>
                  <tr>
                    <td>
                      <div class="form-group" >
                      <select class="form-control" id="Gender" name="gender" required="required">
                          <option value="<%=gender%>" selected="selected"><%=gender%></option>
                      <option value="Male">Male</option>
                      <option value="Female">Female</option>
                      <option value="Others">Others</option>
                      </select>
                      </div>
                    </td>
                  <td>
                    <div class="form-group" >
                      <select class="form-control" id="bloodgroup" name="bloodgroup"  required="required">
                          <option value="<%=bldgrp%>"  selected="selected"><%=bldgrp%></option>
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
                  <td><input type="number" value="<%=hft%>" name="heightf" min="1" step="1" max="10" required="required" placeholder="Height(foot)" id="height" /></td>
                  <td><input type="number" name="heighti" value="<%=hin%>" min="0" step="0" max="11" required="required" placeholder="Height(inch)" id="height"/></td>
                </tr>
                </table>
                <input type="number" name="weight" min="1" value="<%=wi%>" placeholder="Weight(kg)" />
                
                <input type="hidden" name="state" value="<%=state%>"  />
                <input type="hidden" name="city" value="<%=city%>" />
                <input type="hidden" name="hosp" value="<%=hosp%>" />
                <input type="hidden" name="dept" value="<%=dept%>" />
                <input type="hidden" name="doctor" value="<%=doctor%>" />
                <input type="hidden" name="date1a" value="<%=date1d%>" />
                
                <input type="reset" name="reset" class="reset action-button" value="Reset" />
                <input type="submit" name="submit" class="submit action-button" value="Submit" />
            </fieldset>
          </form>


                       
                    </div>
                </div>
                  <hr />
                </div>
                <!-- /. ROW  -->
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/date.js"></script>
	<script type="text/JavaScript" src='assets/js/state.js'></script> 
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
  <script>
      $( function() {
        $( "#datepicker" ).datepicker({ minDate: 0, maxDate: 4, dateFormat:"dd/mm/yy" });
      } );
  </script>
</body>
</html>
