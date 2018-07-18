 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.connDao"%>
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
           String aid=request.getParameter("var");
           String pid=request.getParameter("var2");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="logout_doctor.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
                        <a class="active-menu" href="docTodApp.jsp"><i class="fa fa-desktop fa-3x"></i> Today's Appointment</a>
                    </li>
                    <li>
                        <a  href="docUpApp.jsp"><i class="fa fa-qrcode fa-3x"></i> Upcoming Appointments</a>
                    </li>
        
                     
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12" >
                     <h2 style="display:inline-block;">Write Prescription</h2>   
                            <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;display:inline-block;"><a href="docTodApp_Pres2.jsp?var=<%=pid%>" class="btn btn-success square-btn-adjust" name="Patient_History" target="_blank" />Patient History</a> </div>      
                    </div>
                </div>       <hr />         
                 <!-- /. ROW  -->
                 <form id="msform" action="doc_pres.jsp" method="post">
                    <!-- fieldsets -->
                    <fieldset>
                      <h2 class="fs-title">Write Prescription for Appointment ID: <%=aid%></h2>
                      <% 
                            try {
                    Connection con=connDao.getCon();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
                    Date today = dateFormat.parse(dateFormat.format(new Date()));     
                    java.sql.Date sqlDate = new java.sql.Date(today.getTime());
                    String query1="select v_app_id,v_h_id,v_p_id,v_doc_id,v_d_id,v_name,v_age,v_blood_group,v_h_ft,v_h_in,v_weight from visiting where v_app_id=?;";
                    PreparedStatement stm1=con.prepareStatement(query1);
                    int abc=Integer.parseInt(aid);
                    stm1.setInt(1,abc);
                    ResultSet rs=stm1.executeQuery();
                    
                    while(rs.next())
                    {
                      %>
                      <input type="hidden" name="AppId"  value=<%=aid%> readonly="readonly" /> 
                      <input type="hidden" name="HId"  value=<%=rs.getString("v_h_id")%> readonly="readonly" /> 
                      <input type="hidden" name="PaId"  value=<%=rs.getString("v_p_id")%> readonly="readonly" /> 
                      <input type="text" name="DId"  value=<%=rs.getString(4)%> readonly="readonly" /> 
                      <input type="hidden" name="DeptId" id="DeptId"  value=<%=rs.getString("v_d_id")%> readonly="readonly" /> 
                      <input type="text" name="Patient Name"  value=<%=rs.getString("v_name") %> readonly="readonly" /> 
                      <input type="number" name="age" min="0" value=<%=rs.getString("v_age") %> readonly="readonly" />
                      <table>
                      <tr>
                        <td><input type="text" name="Blood Group"  placeholder=<%=rs.getString("v_blood_group") %> readonly="readonly" style="width:300%"/></td>
                        <td><input type="number" name="height" min="1" step="1" max="10" placeholder=<%=rs.getString("v_h_ft") %> id="height" style="width:75%;margin-left:30%"/></td>
                        <td><input type="number" name="height" min="1" step="0" max="11" placeholder=<%=rs.getString("v_h_in") %> id="height" style="width:75%;" /></td>
                        <td> <input type="number" name="weight" min="1" placeholder=<%=rs.getString("v_weight") %> style="width:375%;margin-left:-300%;"/></td>
                      </tr>
                      </table><%}}catch(Exception e){e.printStackTrace();}%>
                      <textarea name="Diagnosis" placeholder="Diagnosis" id="Diagnosis" required></textarea>
                        <%int n=1; %>
                              <div class="col-sm-3 nopadding">
                                <div class="form-group">
                                  <input type="text" class="form-control" id="Medicinename1" name="Medicinename<%=n%>" value="" placeholder="Medicine name" required="required">
                                </div>
                              </div>
                            <div class="col-sm-3 nopadding">
                                <div class="form-group">
                                    <input type="number" class="form-control" id="dose" name="dose<%=n%>"  placeholder="Dosage(mg)" required="required" min="1">
                                </div>
                              </div>
                            <div class="col-sm-3 nopadding">
                                <div class="form-group">
                                  <input type="number" class="form-control" id="days" name="days<%=n%>"  placeholder="Days" required="required" min="0">
                                </div>
                              </div>
                            <div class="col-sm-3 nopadding">
                                <div class="form-group">
                                 <div class="input-group-btn">
                                      <button class="btn btn-success" type="button"  onclick="fields();"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> </button>
                                  </div>
                                 </div> 
                            </div>
                             <div id="medicine">
          
                              </div>
                      <input type="hidden" name="no_field"  placeholder="Nmber of Medicines" id="no_field" readonly /> 
                      <input type="reset" name="reset" class="reset action-button" value="Reset" onclick ="rlo()"/>
                      <input type="submit" name="submit" class="submit action-button" value="Submit" onclick ="alo();" />
                    </fieldset>
                  </form>
                           
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
      <script src="assets/js/dyForm.js"></script>   
</body>
</html>
                                