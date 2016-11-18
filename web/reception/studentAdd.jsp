<%-- 
    Document   : addStudent
    Created on : 18 Nov, 2016, 7:16:34 PM
    Author     : Home
--%>
<%@page import="com.action.Find"%>
<%-- 
    Document   : addEntry
    Created on : 18 Nov, 2016, 6:16:29 PM
    Author     : Home
--%>
<%-- 
    Document   : home
    Created on : 18 Nov, 2016, 5:57:23 PM
    Author     : Home
--%>
<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.action.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en-US">
    
<% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type = rsss.getString("type");
        }
        if(type.equals("reception"))
        {
    
    
    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        	     <link rel="stylesheet" href="../css/main.css">
     
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
 <script src="../js/jquery.js"></script>
         
     
 <link href="../css/simple-sidebar.css" rel="stylesheet">
    <link href="../css/sky-forms.css" rel="stylesheet">


     
	
		
		</head>
		
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">

		        
	
		
		<header id="page-header"  class="fixed-header">
		
			<div id="page-header-inner">

				<div id="header-container">
					<div class="container clearfix">
						<div id="main-logo">
							<a href="#">
								<img src="../images/sjit.png"  height="70px"></a>
						</div>
                                           

						
						

						
						

						<nav id="main-nav">
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="home.jsp">Home</a></li>

    


     
<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Add Entry</a>
    <ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffAdd.jsp">Staff</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="studentAdd.jsp">Student</a>
</ul>
</li>



<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#"> Report</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personalReport.jsp">Personal Report</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="dailyReport.jsp">Daily Report</a>
</ul></li>




   




</ul>						</nav>
					</div>
				</div>
			</div>  <style>td {
        padding: 10px;
        }
        label {
  display: inline-block;
  width: 140px;
  text-align: right;
}
</style>

<script>
    
    $(document).ready(function(){
        
        $( "input" ).prop( "disabled", true );
        $("#rollno").prop( "disabled", false );
        $(".button").prop( "disabled", false );
        $("select").prop("disabled",true);
        $(".button").click(function(){
            
            
          $("[name='entry']").val($(this).val());
         
        });
        $("#submitform").submit(function(){
            
            //console.log($(this).val());
            
            
       
     
        });
    });
    
</script>
		</header>


<center>
<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

            
              <center><h1>Student Entry</h1></center><br><br><br>
                <div id ="manual"><form method="post" action="studentAdd.jsp" >
                    <center> <label> Roll No :</label><input type="text" style="background: white" id="rollno" name="search"></center>
                    <div align="center">
                        <br><br>
                        <input type="submit" class="button" id="submit" value="Submit" />
                    <br><br></div></form>
                    <%
                        String rollno=request.getParameter("search");
                        Connection con=null;
                        Statement stmt=null;
                        ResultSet rs=null;
                        String sql="select * from student_general where rollno like '"+rollno+"'";
                    if(request.getParameter("search")!=null)
                    {
                        
                        try
                        {

                         con=new dbcon().getConnection(Find.sdept(rollno));
                         stmt=con.createStatement();


                    %>
                    <center> 
                            <center><h3>General Details</h3></center>
                           <%
                           rs=stmt.executeQuery(sql);
                           if(rs.next())
                           {
                           %>

                            <table cellspacing="10"><tr><td>

                                        <label> Roll No :</label><input type="text" style="background: white" id="rollno" name="rollno" value="<%=rollno%>" disabled></td>

                                    <td>

                                        <label>Department :</label><input type="text" style="background: white"  value="<%=Find.sdept(rollno)%>" disabled>

                                <td>
                                    <label> Date of Birth :</label><input type="date" style="background: white" id="dob" name="dob" value="<%=rs.getString("dob")%>"></td>
                                <td><label>Caste :</label><input type="text" style="background: white" id="caste" name="caste" value="<%=rs.getString("caste")%>">
                                </td></tr>
                                <tr>

                                <td><label>Community :</label>
                                    
                                    
                                 <select name="community">
                                     <option value="<%=rs.getString("community")%>"><%=rs.getString("community")%></option>
                              
                                </select>
                                
                                
                                </td>
                                    <td>
                                        <label>Parents Annual Income :</label><input type="text" style="background: white" id="pincome" name="pincome" value="<%=rs.getString("parents_annual_income")%>">
                                    </td>

                                    <td>
                                        <label>Religion :</label>
                                       <select name="religion" id="religion">
                                            <option value="<%=rs.getString("religion")%>"><%=rs.getString("religion")%></option>
                                                   
                                                    
                                        </select>
                                        
                                    </td>

                                    <td>
                                        <label> Nationality :</label><input type="text" style="background: white" id="nationality" name="nationality" value="<%=rs.getString("nationality")%>">
                                    </td>

                                </tr>
                                <tr>


                                    <td>
                                        <label> Mother Tongue :</label> <input type="text" style="background: white" id="mothertongue" name="mothertongue" value="<%=rs.getString("mother_tongue")%>">
                                    </td>
                                    <td>
                                        <label>Club Member :</label><input type="text" style="background: white" id="clubmember" name="clubmember" value="<%=rs.getString("club_member")%>">
                                    </td>
                                    <td>
                                        <label>Boarding Point :</label><input type="text" style="background: white" id="boardingpt" name="boardingpt" value="<%=rs.getString("boardingpt")%>">
                                    </td>
                                </tr></table>
                            <input type="hidden" name="formtype" value="general">
                            <input type="hidden" name="rollno" value="<%=rs.getString("rollno")%>">

                                <div align="right">
            </div>
            <br><br>
                        </center>
                           
                            <%
                            }
                               Statement stmt3=null;
                               stmt3=con.createStatement();
                            sql="select * from student_contact_details where rollno like '"+rollno+"'";
                            ResultSet rs3=stmt3.executeQuery(sql);
                            if(rs3.next())
{
                            %>
                            <center>
                            <br><center><h3>Contact Details</h3></center>
                                        <table>
                                <tr>
                                    <td>
                                        <label>Door No :</label><input type="text"  style="background: white" id="doorno" name="doorno" value="<%=rs3.getString("Doorno")%>">
                                    </td>
                                    <td>
                                        <label>Street :</label><input type="text"  style="background: white" id="street" name="street" value="<%=rs3.getString("street")%>">
                                    </td>
                                    <td>
                                        <label>Area :</label><input type="text"  style="background: white" id="area" name="area" value="<%=rs3.getString("area")%>">
                                    </td>
                                    <td>
                                        <label>City :</label><input type="text"  style="background: white" id="city" name="city" value="<%=rs3.getString("city")%>">
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <label>District :</label><input type="text"  style="background: white" id="district" name="district" value="<%=rs3.getString("district")%>">
                                    </td>
                                    <td>
                                        <label>State :</label><input type="text"  style="background: white" id="state" name="state" value="<%=rs3.getString("state")%>">
                                    </td>
                                    <td>
                                        <label>Country :</label><input type="text"  style="background: white" id="country" name="country" value="<%=rs3.getString("country")%>">
                                    </td>
                                    <td>
                                        <label>Pin Code :</label><input type="text"  style="background: white" id="pincode" name="pincode" value="<%=rs3.getString("pincode")%>">
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" name="formtype" value="contact">
                            <input type="hidden" name="rollno" value="<%=rs3.getString("rollno")%>">

                <div align="right">
            </div>
            <br><br>
                        </center>
                            <%
                            }
                               Statement stmt4=null;
                               stmt4=con.createStatement();
                            sql="select * from student_father_details where rollno like '"+rollno+"'";
                            ResultSet rs4=stmt4.executeQuery(sql);
                            if(rs4.next())
{
                            %>
                            <center> 
                            <center><h3>Father Details</h3></center>
                           <table>
                                <tr>
                                    <td>
                                        <label>Father Name :</label><input type="text"  style="background: white" id="fathername" name="fathername" value="<%=rs4.getString("fathers_name")%>">
                                    </td>
                                    <td>
                                        <label>Qualification :</label><input type="text"  style="background: white" id="qualification" name="qualification" value="<%=rs4.getString("qualification")%>">
                                    </td>
                                    <td>
                                        <label>Occupation :</label><input type="text"  style="background: white" id="occupation" name="occupation" value="<%=rs4.getString("occupation")%>">
                                    </td>
                                    <td>
                                        <label>Designation :</label><input type="text"  style="background: white" id="designation" name="designation" value="<%=rs4.getString("designation")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Address :</label><input type="text"  style="background: white" id="address" name="address" value="<%=rs4.getString("address")%>">
                                    </td>
                                    <td>
                                        <label>Landline :</label><input type="text"  style="background: white" id="landline" name="landline" value="<%=rs4.getString("landline")%>">
                                    </td>
                                    <td>
                                        <label>Mobile :</label><input type="text"  style="background: white" id="mobile" name="mobile" value="<%=rs4.getString("mobile")%>">
                                    </td>
                                    <td>
                                        <label>Mail id :</label><input type="text"  style="background: white" id="mail" name="mail" value="<%=rs4.getString("mailid")%>">
                                    </td>
                                </tr>
                                <tr>

                                </tr>

                            </table>
                            <br><br>
                            <input type="hidden" name="formtype" value="father">
                            <input type="hidden" name="rollno" value="<%=rs4.getString("rollno")%>">
 <div align="right">
            </div>
            <br><br>
                       </center>
                            <%
                            }
                               Statement stmt5=null;
                               stmt5=con.createStatement();
                            sql="select * from student_mother_details where rollno like '"+rollno+"'";
                            ResultSet rs5=stmt5.executeQuery(sql);
                            if(rs5.next())
{
                            %>
                            <center>
                            <center><h3>Mother Details</h3></center>
                                                        <table>
                                <tr>
                                    <td>
                                        <label>Mother Name :</label><input type="text"  style="background: white" id="mothername" name="mothername" value="<%=rs5.getString("mothers_name")%>">
                                    </td>
                                    <td>
                                        <label>Qualification :</label><input type="text"  style="background: white" id="qualification" name="mqualification" value="<%=rs5.getString("qualification")%>">
                                    </td>
                                    <td>
                                        <label>Occupation :</label><input type="text"  style="background: white" id="occupation" name="moccupation" value="<%=rs5.getString("occupation")%>">
                                    </td>
                                    <td>
                                        <label>Designation :</label><input type="text"  style="background: white" id="designation" name="mdesignation" value="<%=rs5.getString("designation")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Address :</label><input type="text"  style="background: white" id="address" name="maddress" value="<%=rs5.getString("address")%>">
                                    </td>
                                    <td>
                                        <label>Land Line :</label><input type="text"  style="background: white" id="landline" name="mlandline" value="<%=rs5.getString("landline")%>">
                                    </td>
                                    <td>
                                        <label>Mobile :</label><input type="text"  style="background: white" id="mobile" name="mmobile"value="<%=rs5.getString("mobileno")%>">
                                    </td>
                                    <td>
                                        <label>Mail id :</label><input type="text"  style="background: white" id="mail" name="mmail" value="<%=rs5.getString("mailid")%>">
                                    </td>
                                </tr>
                                <tr>

                                </tr>

                            </table>
                            <br><br>
<input type="hidden" name="formtype" value="mother">
<input type="hidden" name="rollno" value="<%=rs5.getString("rollno")%>">
                            <div align="right">
            </div>
            <br><br>
                        </center>
                            <%
                            }
                               Statement stmt6=null;
                               stmt6=con.createStatement();
                            sql="select * from student_local_guardian where rollno like '"+rollno+"'";
                            ResultSet rs6=stmt6.executeQuery(sql);
                            if(rs6.next())
{
                            %>
                        <center> 
                            <center><h3>Local Guardian Details</h3></center>
                                                        <table>
                                <tr>
                                    <td>
                                        <label>Name :</label><input type="text"  style="background: white" id="lgname" name="lgname" value="<%=rs6.getString("name")%>">
                                    </td>
                                    <td>
                                        <label>Phone no :</label><input type="text"  style="background: white" id="lgphno" name="lgphno" value="<%=rs6.getString("phno")%>">
                                    </td>
                                    <td>
                                        <label>Door no :</label><input type="text"  style="background: white" id="lgdoorno" name="lgdoorno" value="<%=rs6.getString("Doorno")%>">
                                    </td>
                                    <td>
                                        <label>Street :</label><input type="text"  style="background: white" id="lgstreet" name="lgstreet" value="<%=rs6.getString("streetname")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Area :</label><input type="text"  style="background: white" id="lgarea" name="lgarea" value="<%=rs6.getString("area")%>">
                                    </td>

                                    <td>
                                        <label>City :</label><input type="text"  style="background: white" id="lgcity" name="lgcity" value="<%=rs6.getString("city")%>">
                                    </td>
                                    <td>
                                        <label>Pin Code :</label><input type="text"  style="background: white" id="lgpincode" name="lgpincode" value="<%=rs6.getString("pincode")%>">
                                    </td>

                                </tr>


                            </table>
                            <br><br>
 <input type="hidden" name="formtype" value="local">
 <input type="hidden" name="rollno" value="<%=rs6.getString("rollno")%>">
   <div align="right">
            </div>
            <br><br>
                        </center>
                            <%
                            }
                             
                               Statement stmt10=null;
                               stmt10=con.createStatement();
                               String batch=null;
                            sql="select * from student_personal where rollno like '"+rollno+"'";
                            ResultSet rs10=stmt10.executeQuery(sql);
                            if(rs10.next())
                            {
                                    batch=rs10.getString("batch");
                            %>
                            <center> 
                            <center><h3>Personal Details</h3></center>
                                                      <table>
                                <tr>
                                     <td>
                                         <label>Regno :</label><input type="text"  style="background: white" id="regno" name="regno" value="<%=rs10.getString("regno")%>">
                                    </td>
                                    <td>
                                        <label>Name :</label><input type="text"  style="background: white" id="stuname" name="stuname" value="<%=rs10.getString("name")%>">
                                    </td>

                                    <td>
                                        <label>Gender :</label><select name="gender" >
                                            <option value="<%=rs10.getString("gender")%>"><%=rs10.getString("gender")%></option>
                                           
                                        </select></td>
                                    <td>
                                        <label>Blood Group :</label><input type="text"  style="background: white" id="bloodgroup" name="bloodgroup" value="<%=rs10.getString("bloodgrp")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Batch :</label><input type="text"  style="background: white" id="batch" name="batch" value="<%=rs10.getString("batch")%>">
                                    </td>
                                     <td>
                                        <label>Course :</label><select name="course" >
                                            <option value="<%=rs10.getString("course")%>"><%=rs10.getString("course")%></option>
                                           
                                        </select>
                                    </td>
                                    <td>
                                        <label>Section :</label><input type="text"  style="background: white" id="sec" name="sec" value="<%=rs10.getString("sec")%>">
                                    </td>
                                    <td>
                                        <label>Mobile no. :</label><input type="text"  style="background: white" id="stumobile" name="stumobile"value="<%=rs10.getString("mobileno")%>">
                                    </td></tr><tr>
                                    <td>
                                        <label>Mail id :</label><input type="text"  style="background: white" id="stumail" name="stumail" value="<%=rs10.getString("mailid")%>">
                                    </td>

                                    <td>
                                        <label>Food :</label><select name="food">
                                            <option  value="<%=rs10.getString("food")%>"><%=rs10.getString("food")%></option>
                                          

                                        </select></td>

                                    <td>
                                        <label>Accommodation :</label><select name="acc" >
                                            <option value="<%=rs10.getString("accomodation")%>"><%=rs10.getString("accomodation")%></option>
                                           
                                        </select></td></tr><tr>
                                    <td>
                                        <label>Initial :</label><input type="text"  style="background: white" id="initial" name="initial" value="<%=rs10.getString("initial")%>">
                                    </td>
                                    <td>



                                        </select></td>
                                </tr>
                                <tr>

                                </tr>
                                <tr>
                                    <td><center><h2>Student</h2>
                                          <img src="../../StudentPhotos/Batch<%=batch%>/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                  </center>
                                    </td>
                                    <td><center><h2>Father</h2>
                                          <img src="../../Father/Batch<%=batch%>/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                                    </center>
                                    </td>
                                    <td><center><h2>Mother</h2>
                                          <img src="../../Mother/Batch<%=batch%>/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                                    </center>
                                    </td>
                                    <td><center><h2>Local Guardian</h2>
                                          <img src="../../LocalGuardian/Batch<%=batch%>/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                                    </center>
                                    </td>
                                </tr>
                            </table>
                            <br><br>
                           
                            <input type="hidden" name="formtype" value="personal">
             <div align="right">
            </div>
            <br><br>
            <form id="submitform" action="../addEntry" method="post">
                  
            <input type="hidden" class="button" name="rollno" value="<%=rs10.getString("rollno")%>">
            <input type="hidden" class="button" value=""  name="entry" >
            
               <input type="submit" value="IN" class="button" id="submit">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="OUT" class="button" id="submit">
          
           
            </form>
                        </center>

                     <%
                     }

if(stmt!=null)
stmt.close();
if(stmt3!=null)
stmt3.close();
if(stmt4!=null)
stmt4.close();
if(stmt5!=null)
stmt5.close();
if(stmt6!=null)
stmt6.close();

if(stmt10!=null)
stmt10.close();
if(con!=null)
con.close();
}
                     catch(Exception e)
                        {
                            e.printStackTrace();
                        }
finally
{
try
{
if(con!=null)
con.close();
if(stmt!=null)
stmt.close();
}
catch(Exception e)
{
e.printStackTrace();
}
}
}
                  %>

                </div>



</div></div></section>

            

</div></div>

<br><br></section></center>		


						<footer id="footer-widgets">
			<div class="container clearfix">
								Powered by St.Joseph's
							</div>
		</footer>
			<!-- #page-container -->
			</div>
			</div>

	<footer id="page-footer">
		<div class="container clearfix">
			<div class="copy"></div>
			<nav id="footer-nav">
                            			<ul id="menu-footer-menu" class="menu">
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
</ul>
				
    			</nav>
		</div>
	</footer>






    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>
<%
    }
        else
    {
        response.sendRedirect("../index.jsp");
    }
    }

                            if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                connn.close();
    else
    {
        response.sendRedirect("../index.jsp");
    }
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>