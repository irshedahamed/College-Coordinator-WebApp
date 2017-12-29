<%-- 
    Document   : verificationReportDisplay
    Created on : 13 Oct, 2016, 7:48:15 PM
    Author     : Home
--%>


<%@page import="java.util.List"%>
<%@page import="Actor.Student.General"%>
<%@page import="Actor.Student"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style rel="stylesheet">
            /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
            */
            /* 
                Created on : 26 May, 2015, 3:36:50 PM
                Author     : aravind
            */



            table {
                *border-collapse: collapse; /* IE7 and lower */
                border-spacing: 0;

                overflow-x : auto; 
            }


            .bordered {
                border: solid #ccc 1px;
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
                border-radius: 6px;
                -webkit-box-shadow: 0 1px 1px #ccc; 
                -moz-box-shadow: 0 1px 1px #ccc; 
                box-shadow: 0 1px 1px #ccc;         
            }

            .bordered tr:hover {
                background: #fbf8e9;
                -o-transition: all 0.1s ease-in-out;
                -webkit-transition: all 0.1s ease-in-out;
                -moz-transition: all 0.1s ease-in-out;
                -ms-transition: all 0.1s ease-in-out;
                transition: all 0.1s ease-in-out;     
            }    

            .bordered td, .bordered th {
                border-left: 1px solid #ccc;
                border-top: 1px solid #ccc;
                padding: 4px;
                text-align: left;    
            }

            .bordered th {
                background-color: #dce9f9;
                background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
                background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
                -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
                -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
                box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
                border-top: none;
                text-shadow: 0 1px 0 rgba(255,255,255,.5); 
            }

            .bordered td:first-child, .bordered th:first-child {
                border-left: none;
            }

            .bordered th:first-child {
                -moz-border-radius: 6px 0 0 0;
                -webkit-border-radius: 6px 0 0 0;
                border-radius: 6px 0 0 0;
            }

            .bordered th:last-child {
                -moz-border-radius: 0 6px 0 0;
                -webkit-border-radius: 0 6px 0 0;
                border-radius: 0 6px 0 0;
            }

            .bordered th:only-child{
                -moz-border-radius: 6px 6px 0 0;
                -webkit-border-radius: 6px 6px 0 0;
                border-radius: 6px 6px 0 0;
            }

            .bordered tr:last-child td:first-child {
                -moz-border-radius: 0 0 0 6px;
                -webkit-border-radius: 0 0 0 6px;
                border-radius: 0 0 0 6px;
            }

            .bordered tr:last-child td:last-child {
                -moz-border-radius: 0 0 6px 0;
                -webkit-border-radius: 0 0 6px 0;
                border-radius: 0 0 6px 0;
            }

            h2{
                font-size: 18px;
                margin: 0px;
                padding: 0px;
            }
            thead {display: table-header-group;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>

    <body>
        <%
            String dept = request.getParameter("dept");
    String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");
       
            String batch = request.getParameter("batch");
%>
    <center><h2>St. Joseph's Institute of Technology, Chennai-119</h2></center>
    <center><h2>Department Of <%=dept.toUpperCase()%></h2></center>

    <center>
        <h2>Batch :<%=batch%> </h2>
    </center>

    <center>  <table class="bordered">
            <thead>

                <tr>

                    <th> Sno</th>
                    <th name="cc">Roll No</th>
                    <th>Name</th>
                    <th>Boarding point</th>
                    <th>Father's Name<br>
                        (Mobile number)</th>


                </tr>
            </thead>
            <%

                int sno = 0;

                List<Student> list = Student.getAll(dept, batch, "%",clg);

                for (Student s : list) {

                    String rollno = s.getId();

                    String name = s.getName();
                    String father = s.getFatherDetails().getFathername();
                    String mobile = s.getFatherDetails().getMobile();
                    String Boarding = s.getGeneral().getBoarding();

            %>


            <tr>
                <td><%=++sno%></td>
                <td><%=rollno.toUpperCase()%></td>

                <td><%=name.toUpperCase()%></td>

                <td><%=Boarding%></td>
                <td><%=father%><br><%=mobile%></td>

            </tr>      

            <%
                }
            %>


        </table></center>

</body>
</html>
