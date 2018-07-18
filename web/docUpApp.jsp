<%-- 
    Document   : docUpApp
    Created on : 19 Mar, 2017, 3:30:31 PM
    Author     : 1405283
--%>
    <%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%
            //allow access only if session exists
            String uname = null;
            if(session.getAttribute("uname") == null){
                    response.sendRedirect("login_doctor.jsp");
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
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OMHS</title>
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
                <a class="navbar-brand" href="userIndex.html"><%= userName %></a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="index.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                    </li>
                
                    
                    <li>
                        <a   href="docIndex.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a  href="docTodApp.jsp"><i class="fa fa-desktop fa-3x"></i> Today's Appointment</a>
                    </li>
                    <li>
                        <a class="active-menu" href="docUpApp.jsp"><i class="fa fa-qrcode fa-3x"></i> Upcoming Appointments</a>
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
                        <h5><h4>View Upcoming Appointments</h4> </h5>
                    </div>
                </div>       <hr />         
                 <!-- /. ROW  -->
                
                 <!-- /. ROW  -->           
                 <table class="table table-hover table-responsive" >
                
                <thead style="background-color:grey;color:white;">
                  <tr>
                    <th>Appointment Id</th>
                    <th hidden>Doctor Id</th><!-- use style="display:none" if hidden is not working -->
                    <th hidden>Prescription Id</th>
                    <th hidden>Hospital Id</th>
                    <th hidden>Patient Id</th>
                    <th>Date</th>
                    <th>Patient Name</th>
                  </tr>
                </thead>
                <%
                    try {
                     Connection con=connDao.getCon();
                     SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
                    Date today = dateFormat.parse(dateFormat.format(new Date()));     
                    java.sql.Date sqlDate = new java.sql.Date(today.getTime());
                    String query1="select v_app_id, v_app_date,v_name from visiting where v_app_date>? and v_doc_id=?;";
                    PreparedStatement stm1=con.prepareStatement(query1);
                                        stm1.setDate(1,sqlDate);
                    stm1.setString(2,userName);
                    ResultSet rs=stm1.executeQuery();
                    System.out.println(sqlDate);
                    System.out.println(userName);
                    
                
                    while(rs.next())
                    {
                 %>
                    
                <tbody>
                  <tr>
                    <td hidden>did</td>
                    <td hidden>pid</td>
                    <td hidden>hid</td>
                    <td hidden>pid</td>
                   <td><%=rs.getString("v_app_id") %></td>
                   <td><%=rs.getDate("v_app_date")%></td>
                  <td><%=rs.getString("v_name") %></td>
                  </tr>
                                    <%
                }
                }
                catch(Exception e){
                    e.printStackTrace();}
                
%>
              
                </tbody>
                </table>
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
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>