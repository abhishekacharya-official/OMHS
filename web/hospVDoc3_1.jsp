<%-- 
    Document   : hospVDoc3_1
    Created on : 18 Mar, 2017, 5:49:58 PM
    Author     : 1405299
--%>

<%@page import="Classes.dEditDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String did=request.getParameter("docid");
    String dname=request.getParameter("docname");
    String dcon=request.getParameter("docno");
    String dmail=request.getParameter("mail");
    int slot=Integer.parseInt(request.getParameter("Slots"));
    int count=dEditDetails.editDetails(did, dname, dcon, dmail, slot);
    if(count>0){
        String textae1="Doctors Details saved!";
        request.setAttribute("textae1", textae1); 
        request.getRequestDispatcher("hospVDoc3.jsp").forward(request, response);
        return;
    }
    else{
        String textae1="Error in saving Doctors Details";
        request.setAttribute("textae1", textae1); 
        request.getRequestDispatcher("hospVDoc3.jsp").forward(request, response);
        return;
    }
%>