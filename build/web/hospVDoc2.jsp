<%-- 
    Document   : hospVDoc2
    Created on : 15 Mar, 2017, 3:03:21 PM
    Author     : 1405299
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String dept=request.getParameter("count");  
  String hosp=request.getParameter("cnt");
  String buffer="<select name='state' onchange='showCity(this.value);'><option value='-1'>Select</option>"; 
  String did=null,dname=null,dcon=null,demail=null;int davail=0;
  try {
        Connection con=connDao.getCon();
        String query="Select doc_id,doc_name,doc_contact,doc_email,doc_avail from doctor_details where doc_dept_id=? and doc_h_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, dept);
            stm.setString(2, hosp);
            ResultSet rs=stm.executeQuery();
        while(rs.next()){
                did=rs.getString("doc_id");
                dname=rs.getString("doc_name");
                demail=rs.getString("doc_email");
                dcon=rs.getString("doc_contact");
                davail=rs.getInt("doc_avail");
                if(davail==1){
                    buffer="<tr onclick=\"window.location=\'hospVDoc3.jsp?var="+did+"\'\" style=\"cursor:pointer;\">";
                    buffer+="<td>"+did+"</td>";
                    buffer+="<td>"+dname+"</td>";
                    buffer+="<td>"+demail+"</td>";
                    buffer+="<td>"+dcon+"</td>";
                    buffer+="</tr>";
                    response.getWriter().println(buffer);
                    
                }
                else if(davail==0){
                    buffer="<tr style=\"background-color: #ffcccc; cursor:pointer;\" onclick=\"window.location=\'hospVDoc3\'\" class=\"rowa\">";
                    buffer+="<td>"+did+"</td>";
                    buffer+="<td>"+dname+"</td>";
                    buffer+="<td>"+dcon+"</td>";
                    buffer+="<td>"+demail+"</td>";
                    response.getWriter().println(buffer); 
                }
          }
  }
  catch(Exception e){
      e.printStackTrace();
  }
%>