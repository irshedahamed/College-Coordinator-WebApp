<%-- 
    Document   : deletesubject
    Created on : 28 Mar, 2017, 11:11:18 PM
    Author     : L_Yagami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
        <!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
</head>
    <body>
        <%

String Array[] = request.getParameterValues("check");
String subcode="";
String reg = "";
String hh="";
try{
    Connection con=new dbcon().getConnection(request.getParameter("dept"));
    Statement st = con.createStatement();
if (Array != null) {
for (int i = 0; i < Array.length; i++) {
 String sep[]= Array[i].split("\\s") ; 
 subcode=sep[0];
 reg=sep[1];  

String sqlDelete = "delete  from subject_sem_table where subcode = '" +subcode+" ' and regulation = '" +reg+" ' ";
System.err.println(sqlDelete);
st.executeUpdate(sqlDelete);
}
st.close();
con.close();

out.println("deleted successfully");

} else {
out.println ("<p> You have not select anything to delete");
}}
catch(Exception ex){
    
        out.println(ex.getMessage());
        ex.printStackTrace();
        }%> 
          
    </body>
</html>
