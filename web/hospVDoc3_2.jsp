<%-- 
    Document   : hospVDoc3_2
    Created on : 18 Mar, 2017, 6:16:46 PM
    Author     : 1405299
--%>

<%@page import="Classes.dEditDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String did=request.getParameter("docid");
    String dpass=request.getParameter("pass");
    int count=dEditDetails.checkUser(did, dpass);
    if(count>0){
        String textae2="Doctors Password Saved!";
        request.setAttribute("textae2", textae2); 
        request.getRequestDispatcher("hospVDoc3.jsp").forward(request, response);
        return;
    }
    else{
        String textae2="Some Error Occured";
        request.setAttribute("textae2", textae2); 
        request.getRequestDispatcher("hospVDoc3.jsp").forward(request, response);
        return;
    }
%>