<%-- 
    Document   : hospFpassReq2
    Created on : 21 Mar, 2017, 7:50:51 PM
    Author     : 1405299
--%>

<%@page import="Classes.hospFmailCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int count=0; boolean flag; String msg2=null,errf=null,errf1=null;
    String uname = request.getParameter("uname");
    int token = Integer.parseInt(request.getParameter("token"));
    String pass=request.getParameter("pass");
    boolean status = hospFmailCheck.fChecktoken(uname,token);
    if(status){
        count=hospFmailCheck.fSavePass(uname, pass);
        if(count>0){
            flag=hospFmailCheck.tokenDelete(uname, token);
            if(flag){
                msg2="Password updated";
                request.setAttribute("msg2", msg2);
                request.getRequestDispatcher("login_hospital.jsp").forward(request, response);
                return;
            }
        }
        else{
            errf="Some error occured";
                request.setAttribute("errf", errf);
                request.getRequestDispatcher("hospFpassReq.jsp?var="+uname).forward(request, response);
                return;
        }
    }
    else{
        errf1="Wrong code";
                request.setAttribute("errf1", errf1);
                request.getRequestDispatcher("hospFpassReq.jsp?var="+uname).forward(request, response);
                return;
    }
%>
