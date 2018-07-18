<%-- 
    Document   : doc_pres
    Created on : 29 Mar, 2017, 3:55:16 PM
    Author     : 1405283
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String pres_h_id=request.getParameter("HId");
    String pres_p_id=request.getParameter("PaId");
    String pres_doc_id=request.getParameter("DId");
    String pres_d_id=request.getParameter("DeptId");
    String Diag=request.getParameter("Diagnosis");
    int count=Integer.parseInt(request.getParameter("no_field"));
   int pid=0;
    int i=0;String med; int dose,days;
    
    String pres_app_id=request.getParameter("AppId");int status;System.out.println(pres_d_id+"\n "+pres_doc_id+"\n "+Diag);
    int pres=Integer.parseInt(pres_app_id);
    try{
    Connection con=connDao.getCon();
    PreparedStatement pstmt=con.prepareStatement("insert into prescription (pres_p_id, pres_h_id, pres_d_id, pres_doc_id,pres_app_id,pres_diagnosis) values (?,?,?,?,?,?)");
            pstmt.setString(1,pres_p_id);
            pstmt.setString(2,pres_h_id);
            pstmt.setString(3,pres_d_id);
            pstmt.setString(4,pres_doc_id);
            pstmt.setInt(5,pres);
            pstmt.setString(6,Diag);
            pstmt.executeUpdate(); 
    PreparedStatement stmt=con.prepareStatement("select pres_id from prescription where pres_p_id=? and pres_h_id=? and pres_d_id=? and pres_doc_id=? and pres_app_id=?");
            stmt.setString(1,pres_p_id);
            stmt.setString(2,pres_h_id);
            stmt.setString(3,pres_d_id);
            stmt.setString(4,pres_doc_id);
            stmt.setInt(5,pres);
             
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
                pid=rs.getInt("pres_id"); 
                out.println(pid);
                
            }
    for(i=1;i<=count;i++){
        med=request.getParameter("Medicinename"+i);
        dose=Integer.parseInt(request.getParameter("dose"+i));
        days=Integer.parseInt(request.getParameter("days"+i));
            PreparedStatement stm=con.prepareStatement("insert into prescription_table (pres_id, pres_medicine, pres_med_dose, pres_med_days) values (?,?,?,?)");
            stm.setInt(1,pid);
            stm.setString(2,med);
            stm.setInt(3,dose);
            stm.setInt(4,days);
            stm.executeUpdate(); 
            request.getRequestDispatcher("docTodApp.jsp").forward(request, response);
            return;
    }
            
    }
    catch(Exception e){
        e.printStackTrace();
    }
    
%>
