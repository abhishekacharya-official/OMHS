<%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.css" />
   <script language="javascript" type="text/javascript">  
        var xmlHttp ; 
        var xmlHttp;
        function showCity(str){
                if (typeof XMLHttpRequest !== "undefined"){
                xmlHttp= new XMLHttpRequest();
            }
            else if (window.ActiveXObject){
                xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (xmlHttp===null){
                alert("Browser does not support XMLHTTP Request");
                return;
            } 
            var url="userAddA2.jsp";
            url +="?state=" +str;
            xmlHttp.onreadystatechange = cityChange;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }

        function cityChange(){   
            if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
            document.getElementById("city").innerHTML=xmlHttp.responseText;   
        }   
        }
        function showhosp(str){
            if (typeof XMLHttpRequest !== "undefined"){
              xmlHttp= new XMLHttpRequest();
            }
            else if (window.ActiveXObject){
              xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
              }
                if (xmlHttp===null){
                alert("Browser does not support XMLHTTP Request");
                return;
                } 
            var url="userAddA3.jsp";
            url +="?city=" +str;
            xmlHttp.onreadystatechange = hospChange;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }
      function hospChange(){   
        if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
        document.getElementById("hospz").innerHTML=xmlHttp.responseText ;  
        }   
      }
      function showdept(str){
            if (typeof XMLHttpRequest !== "undefined"){
              xmlHttp= new XMLHttpRequest();
            }
            else if (window.ActiveXObject){
              xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
              }
                if (xmlHttp===null){
                alert("Browser does not support XMLHTTP Request");
                return;
                } 
            var url="userAddA4.jsp";
            url +="?hosp=" +str;
            xmlHttp.onreadystatechange = deptChange;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }
      function deptChange(){   
        if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
        document.getElementById("dept").innerHTML=xmlHttp.responseText ;  
        }   
      }
      
      function showdoc(str,str1){
          
            if (typeof XMLHttpRequest !== "undefined"){
              xmlHttp= new XMLHttpRequest();
            }
            else if (window.ActiveXObject){
              xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
              }
                if (xmlHttp===null){
                alert("Browser does not support XMLHTTP Request");
                return;
                } 
            var url="userAddA5.jsp";
            url +="?dept1="+str+"&hosp="+str1;
            xmlHttp.onreadystatechange = docChange;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }
      function docChange(){   
        if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
        document.getElementById("doca").innerHTML=xmlHttp.responseText ;  
        }   
      }
      
      function showdocexe()
      {
          showdoc(document.getElementById('deptm').value,document.getElementById('hosp').value);
      }
    </script>
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="fa fa-bar"></span>
                    <span class="fa fa-bar"></span>
                    <span class="fa fa-bar"></span>
                </button>
                <a class="navbar-brand" href="userIndex.jsp"><%=userName%></a> 
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
                        <a   href="userIndex.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a class="active-menu" href="userAddA.jsp"><i class="fa fa-desktop fa-3x"></i> Add Appointment</a>
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
                     <h2>Add Appointment</h2>   
                        <h5>Welcome to the add appointment page. </h5>
                        <hr/>
            <form id="msform" action="userAddA6.jsp" method="post">
  <!-- fieldsets -->
                <fieldset>
                  <h2 class="fs-title">Make an Appointment</h2>
                    <%
                        String s=(String) request.getAttribute("erru");
                        if(s!=null){
                    %>
                        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= s %></div>
                    <% } %>
                    <%
                        String s1=(String) request.getAttribute("msg");
                        if(s1!=null){
                    %>
                        <div class="alert alert-success col-md-4 col-md-offset-4 "><%= s1 %></div>
                    <% } %>
                    <%
                        String s2=(String) request.getAttribute("erra");
                        if(s2!=null){
                    %>
                        <div class="alert alert-danger col-md-4 col-md-offset-4 "><%= s2 %></div>
                    <% } %>
                  <div class="form-group">
                      <select id="state" class="form-control" onchange="showCity(this.value)" required="required">
                           <option value="" disabled="disabled" selected="selected">Select State</option>
                           <%
                                      String statename;
                                      try{
                                          Connection con=connDao.getCon();
                                          String query="select distinct h_state from hospital_details";
                                          PreparedStatement stm=con.prepareStatement(query);
                                          ResultSet rs=stm.executeQuery();
                                          while(rs.next()){
                                              statename=rs.getString("h_state");%>
                                              <option value="<%=statename%>"><%=statename%></option>
                                  <%}

                                  }
                                  catch(Exception e){
                                      e.printStackTrace();

                                  }
                                  %>
                          </select>
                          <br/>
                          <div id="city">
                              <select id='cities1' name="cities" class="form-control" required="required">
                                  <option  disabled="disabled" selected="selected">Select City</option>
                              </select>
                          </div>
                          <br/>
                          <div id="hospz">
                          <select id='hospital' class="form-control" required="required">
                              <option value="" disabled="disabled" selected="selected">Select Hospital</option>
                          </select>
                          </div>
                              <br/>
                              <div id="dept">
                          <select id='department' class="form-control" required="required">
                              <option value="" disabled="disabled" selected="selected">Select Department</option>
                          </select>
                              </div>
                          <br/>

                          <div id="doca">
                              <select id='doctor' class="form-control" required="required">
                                  <option value="" disabled="disabled" selected="selected">Select Doctor</option>
                              </select>
                          </div>
                          <br/>
                          <div id="dateapp">
                              <input type="text" name="datea" id="datepicker"  class="form-control" placeholder="Select date(dd/mm/yyyy)" readonly="required" style="cursor:auto; background-color:white;"/>
                          </div>
                </div><!--drop down-->

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
    
	
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
 <script>
      $( function() {
        $( "#datepicker" ).datepicker({ minDate: 0, maxDate: 4, dateFormat:"dd-mm-yy" });
      } );
  </script>

</body>
</html>
