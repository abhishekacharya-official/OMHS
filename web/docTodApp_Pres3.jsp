<%-- 
    Document   : docTodApp_Pres3
    Created on : 3 Apr, 2017, 10:49:02 PM
    Author     : 1405299
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
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
            }String presid=request.getParameter("var");
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
   <link href="assets/css/dynamicForm.css" rel="stylesheet" />
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
                <a class="navbar-brand" href="docIndex.jsp"><%= userName %></a> 
            </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                    </li>
                                     
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Prescription History</h2>   
                        <h5></h5>
                    </div>
                </div>       <hr />         
                 <!-- /. ROW  -->
                  <form id="msform">
                    <%
                    
                 
                 try {
                    Connection con=connDao.getCon();
                    String query="select pres_diagnosis from prescription where pres_id=?";
                    PreparedStatement stm=con.prepareStatement(query);
                    
                    stm.setString(1,presid);
                    ResultSet rs1=stm.executeQuery();
                    //System.out.println(sqlDate);
                    //System.out.println(userName);
                    
                
                    while(rs1.next())
                    {
                       %>
                     <textarea name="Diagnosis" placeholder="Diagnosis" class="form-control" id="Diagnosis" required="required" readonly style="cursor:default;width: calc(100% - 60px); "><%=rs1.getString(1)%>
                     </textarea>  
                     <%}}catch(Exception e){e.printStackTrace();}%>
                  </form>
                    <div class="tableC">
                    <table class="table table-hover table-responsive" >
                    
                    <thead style="background-color:grey;color:white;">
                      <tr>
                        <th hidden>Doctor Id</th><!-- use style="display:none" if hidden is not working -->
                        <th hidden>Prescription Id</th>
                        <th hidden>Hospital Id</th>
                        <th hidden>Patient Id</th>
                        <th hidden>Appointment Id</th>
                        <th>Medicine</th>
                        <th>Dosage</th>
                        <th>Days</th>
                      </tr>
                    </thead><%
                    
                 
                 try {
                     Connection con=connDao.getCon();
                    String query1="select pres_medicine,pres_med_dose,pres_med_days from prescription_table where pres_id=?";
                    PreparedStatement stm1=con.prepareStatement(query1);
                    
                    stm1.setString(1,presid);
                    ResultSet rs=stm1.executeQuery();
                    //System.out.println(sqlDate);
                    //System.out.println(userName);
                    
                
                    while(rs.next())
                    {
                       %>
                    <tbody>
                      <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                      </tr><%}%>
                    </tbody>
                      
                    </table>
                           <%}catch(Exception e){e.printStackTrace();}%>
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
     <script src="assets/js/dyForm.js"></script>
    
   
</body>
</html>