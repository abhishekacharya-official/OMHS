<%-- 
    Document   : userAddA4
    Created on : 18 Mar, 2017, 3:07:43 PM
    Author     : 1405299
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String hosp=request.getParameter("hosp");  
  String buffer="<select id='deptm' name='dept' class='form-control' required='required' onchange='showdocexe();'><option value='-1'>Select</option>"; 
  String dept=null;
  try {
        Connection con=connDao.getCon();
        String query="Select distinct doc_dept_id from doctor_details where doc_h_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, hosp);
            ResultSet rs=stm.executeQuery();
        while(rs.next()){
                dept=rs.getString("doc_dept_id");
                buffer=buffer+"<option value='"+dept+"'>"+dept+"</option>"; 
                
          }response.getWriter().println(buffer);
  }
  catch(Exception e){
      e.printStackTrace();
  }
%>