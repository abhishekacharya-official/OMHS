<%-- 
    Document   : userAddA7
    Created on : 19 Mar, 2017, 1:44:56 AM
    Author     : 1405299
--%>
<%@page import="Classes.userAddA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int status=0;
    String puname=null,pfname=null,plname=null,contact=null,addr=null,gender=null,bldgrp=null;
    int age=0,hfoot=0,hinch=0,weight=0,count=0;
    String uname=request.getParameter("puname");
    pfname=request.getParameter("fname");  
    plname=request.getParameter("lname");
    age=Integer.parseInt(request.getParameter("age"));
    contact=request.getParameter("contact");
    addr=request.getParameter("address");
    gender=request.getParameter("gender");
    bldgrp=request.getParameter("bloodgroup");
    hfoot=Integer.parseInt(request.getParameter("heightf"));
    hinch=Integer.parseInt(request.getParameter("heighti"));
    weight=Integer.parseInt(request.getParameter("weight"));
    String hosp=request.getParameter("hosp");
    String dept=request.getParameter("dept");
    String doctor=request.getParameter("doctor");
    String date1b=request.getParameter("date1a"); 
    count=userAddA.checkSlot(doctor,date1b);
    if(count==0)
    {
        String erru="Sorry! Slots are filled";
        request.setAttribute("erru", erru);
        RequestDispatcher rs = request.getRequestDispatcher("userAddA.jsp");
        rs.include(request, response);
    }
    else {
        status=userAddA.detailsSave(uname, pfname, plname, age, contact, addr, gender, bldgrp, hfoot, hinch, weight, hosp, dept, doctor, date1b);
        if(status>=1){
        String msg="Booking Confirmed!";
        request.setAttribute("msg", msg);
        RequestDispatcher rs = request.getRequestDispatcher("userAddA.jsp");
        rs.include(request, response);
    }
    else{
        String erra="Sorry for the inconvenince";
        request.setAttribute("erra", erra);
        RequestDispatcher rs = request.getRequestDispatcher("userAddA.jsp");
        rs.include(request, response);
    }
    }
    
    
    
%>