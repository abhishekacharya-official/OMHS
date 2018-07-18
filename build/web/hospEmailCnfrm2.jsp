<%-- 
    Document   : userEmailCnfrm1
    Created on : 17 Mar, 2017, 11:32:24 PM
    Author     : 1405299
--%>


<%@page import="java.util.UUID"%>
<%@page import="Classes.hEmailC"%>
<%@page import="Classes.hCheckDelete"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.userEmailC"%>
<%
  String name=request.getParameter("name");
  int otp=Integer.parseInt(request.getParameter("otp"));
  boolean flag = hEmailC.register(name, otp);
  
  if(flag){
        boolean m=hCheckDelete.tokenDelete(name, otp);
        boolean s=hCheckDelete.hLoginDetails(name);
        String erro="Email ID confirmed";
        request.setAttribute("erro", erro);
        RequestDispatcher rs = request.getRequestDispatcher("login_hospital.jsp");
        rs.include(request, response);
  }
  else if(!flag){
      String uuidi = UUID.randomUUID().toString();
        String erro="Wrong Input";
        request.setAttribute("erro", erro);
        RequestDispatcher rs = request.getRequestDispatcher("hospEmailCnfrm.jsp?var="+name);
        rs.include(request, response);
  }
  
%>