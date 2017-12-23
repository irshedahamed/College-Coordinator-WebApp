<%-- 
    Document   : checkalloc.jsp
    Created on : 17 Oct, 2016, 10:00:19 AM
    Author     : Home
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

Connection conn=null;
Statement stmt=null;
try{
conn=new dbcon().getConnection("first");
stmt=conn.createStatement();

String sql="select * from subject_allocation where batch='"+request.getParameter("batch")+
        "'and sem='"+request.getParameter("sem")+
        "'and dept='"+request.getParameter("dept")+
        "'and subcode='"+request.getParameter("subject").split("-")[0] +
        "'and sec='"+request.getParameter("sec")+
        "'and acyear='"+request.getParameter("acyear")+
        "'and sbatch='"+request.getParameter("sbatch")+"'";
ResultSet rs=stmt.executeQuery(sql);
if(rs.next())
    out.write("true");
else
    out.write("false");

}catch(Exception e){
e.printStackTrace();

}finally{
    if(stmt!=null)
    stmt.close();
    if(conn!=null)
    ;//conn.close();

}

%>


