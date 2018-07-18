<%-- 
    Document   : userFpassReq2
    Created on : 20 Mar, 2017, 9:40:17 PM
    Author     : 1405299
--%>

<%@page import="Classes.userFmailCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int count=0; boolean flag; String msg2=null,errf=null,errf1=null;
    String uname = request.getParameter("uname");
    int token = Integer.parseInt(request.getParameter("token"));
    String pass=request.getParameter("pass");
    boolean status = userFmailCheck.fChecktoken(uname,token);
    if(status){
        count=userFmailCheck.fSavePass(uname, pass);
        if(count>0){
            flag=userFmailCheck.tokenDelete(uname, token);
            if(flag){
                msg2="Password updated";
                request.setAttribute("msg2", msg2);
                request.getRequestDispatcher("login_patient.jsp").forward(request, response);
                return;
            }
        }
        else{
            errf="Some error occured";
                request.setAttribute("errf", errf);
                request.getRequestDispatcher("userFpassReq.jsp?var="+uname).forward(request, response);
                return;
        }
    }
    else{
        errf1="Password updated";
                request.setAttribute("errf1", errf1);
                request.getRequestDispatcher("userFpassReq.jsp?var="+uname).forward(request, response);
                return;
    }
%>
