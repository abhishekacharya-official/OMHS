<%-- 
    Document   : reg_hospital
    Created on : 10 Mar, 2017, 5:37:50 PM
    Author     : 1405299
--%>

<%@page import="Classes.hRegMail"%>
<%@page import="Classes.hospSignup3"%>
<%@page import="java.util.Random"%>
<%@page import="Classes.hospSignup2"%>
<%@page import="Classes.hospSignup"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.UUID"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String huname=request.getParameter("hid");
    String hemail=request.getParameter("email");
    String hpass=request.getParameter("pass");
    String regno=request.getParameter("hregno");
    String hid=null,hmail=null,err=null,err1=null,err2=null, err3=null,err4=null,msg=null;
    int status=hospSignup.register(huname, hemail, hpass, regno);
    if(status==1){
        err="Username already exists";
        request.setAttribute("err", err);
        request.getRequestDispatcher("register_hospital.jsp").forward(request, response);
        return;
    }
    else if (status==2){
        err1="Email already exists";
        request.setAttribute("err1", err1);
        request.getRequestDispatcher("register_hospital.jsp").forward(request, response);
        return;
    }
    else if (status==3){
        err4="Registration number already exists";
        request.setAttribute("err4", err4);
        request.getRequestDispatcher("register_hospital.jsp").forward(request, response);
        return;
    }
    else if (status==4){
        err3="Some data already exists";
        request.setAttribute("err3", err3);
        request.getRequestDispatcher("register_hospital.jsp").forward(request, response);
        return;
    }
    else if(status==0){
        int status1=hospSignup2.register(huname, hemail, hpass, regno);
        if(status1>0){
            Random randomGenerator = new Random();
            int randomInt = randomGenerator.nextInt(999999);
            hospSignup3 user1=new hospSignup3();
            int stat=user1.registertoken(huname,randomInt);
            if(stat>0){
                hRegMail javaEmail=new hRegMail();
                try {
                    javaEmail.setMailServerProperties();
                    javaEmail.createEmailMessage(hemail,huname,randomInt);
                    javaEmail.sendEmail();
                    request.getRequestDispatcher("preg1.html").forward(request, response);
                    return;
                } 
                catch (Exception me) {
                    me.printStackTrace();
                }
            }
        }
        else{
            err2="Some error occured";
            request.setAttribute("err2", err2);
            request.getRequestDispatcher("register_hospital.jsp").forward(request, response);
        }
    }
%>
