<%-- 
    Document   : userAddA2
    Created on : 18 Mar, 2017, 2:55:44 PM
    Author     : 1405299
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String state=request.getParameter("state");  
  String buffer="<select id='cities' name='city' class='form-control' required='required' onchange='showhosp(this.value);'><option disabled=\"disabled\" selected=\"selected\">Select City</option>"; 
  String city=null;
  try {
        Connection con=connDao.getCon();
        String query="Select distinct h_city from hospital_details where h_state=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, state);
            ResultSet rs=stm.executeQuery();
        while(rs.next()){
                city=rs.getString("h_city");//System.out.println(city);
                buffer=buffer+"<option value=\""+city+"\">"+city+"</option>"; 
                
          }
        response.getWriter().println(buffer);
  }
  catch(Exception e){
      e.printStackTrace();
  }
%>