<%-- 
    Document   : checkalloc.jsp
    Created on : 17 Oct, 2016, 10:00:19 AM
    Author     : Home
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
            String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");

Connection conn=null;
//Statement stmt=null;
try{
conn=new dbcon(clg).getConnection("first");
//stmt=conn.createStatement();
String batch=request.getParameter("batch");
String sem=request.getParameter("sem");
String dept=request.getParameter("dept");
String subcode=request.getParameter("subject").split("-")[0];
String sec=request.getParameter("sec");
String acyear=request.getParameter("acyear");
String sbatch=request.getParameter("sbatch");
String sql="select * from subject_allocation where batch=?and sem=? and dept=?and subcode=?and sec=?and acyear=?and sbatch=?";
PreparedStatement  st= conn.prepareStatement(sql);
st.setString(1, batch);
st.setString(2, sem);
st.setString(3, dept);
st.setString(4, subcode);
st.setString(5, sec);
st.setString(6, acyear);
st.setString(7, sbatch);
ResultSet rs=st.executeQuery();
if(rs.next())
    out.write("true");
else
    out.write("false");

}catch(Exception e){
e.printStackTrace();

}finally{
  //  if(stmt!=null)
   // stmt.close();
    if(conn!=null)
    ;//conn.close();

}

%>


