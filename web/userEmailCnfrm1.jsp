<%-- 
    Document   : userEmailCnfrm1
    Created on : 17 Mar, 2017, 11:32:24 PM
    Author     : 1405299
--%>

<%@page import="Classes.pCheckDelete"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.userEmailC"%>
<%
  String name=request.getParameter("name");
  int otp=Integer.parseInt(request.getParameter("otp"));
  boolean flag = userEmailC.register(name, otp);
  
  if(flag){
        boolean m=pCheckDelete.tokenDelete(name, otp);
        boolean s=pCheckDelete.pLoginDetails(name);
        if(s){
            String erro="Email ID confirmed";
            request.setAttribute("erro", erro);
            RequestDispatcher rs = request.getRequestDispatcher("login_patient.jsp");
            rs.include(request, response);
        }
        else{
            String erro="Wrong Input";
            request.setAttribute("erro", erro);
            RequestDispatcher rs = request.getRequestDispatcher("userEmailCnfrm.jsp?var="+name);
            rs.include(request, response);
        }
        
  }
  else if(!flag){
        String erro="Wrong Input";
        request.setAttribute("erro", erro);
        RequestDispatcher rs = request.getRequestDispatcher("userEmailCnfrm.jsp?var="+name);
        rs.include(request, response);
  }
  
%>