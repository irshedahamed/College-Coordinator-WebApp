<%@page import="Actor.Councillor"%>
<%@page import="Actor.Student"%>
<%@page import="Actor.Staff"%>
<%@page import="General.AcademicYear"%>
<%@page import="Downloads.Department"%>
<%@page import="Downloads.Exam"%>
<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">
  <% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type1 ="";
    ResultSet rsss = sttt.executeQuery("select * from staff_login_details where staffid='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        
    session.setAttribute("deptname", Find.sdept(username));
    
    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		     <link rel="stylesheet" href="../../css/main.css">
     
        <link type="text/css" media="all" href="../../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	
    <!-- Custom CSS -->
    <link href="../../css/simple-sidebar.css" rel="stylesheet">
	    
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
	 <script src="../../js/jquery.js"></script>
         
      
<link rel="stylesheet" href="../../css/angular-material.css">

<link rel="stylesheet" href="https://material.angularjs.org/1.1.1/docs.css">
<link href="../../css/tabledesign.css" rel="stylesheet">

<link rel="stylesheet" href="../../css/angulartab.css">

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"> </script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
<script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.js"></script>

<script src="../../js/angulartab.js"></script>
		</head>
			
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">
<div id="sidebar-wrapper">
    
    <% 
    Connection con=new dbcon().getConnection(Find.sdept(username));
    Statement stmtd=con.createStatement();
    ResultSet rsd=stmtd.executeQuery("select * from staff_general where staffid='"+username+"'");
    if(rsd.next())
    {
    %>
    <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#menu-toggle1" id="menu-toggle1">
                       
                    </a>
                </li>
                <center>
                    <img src="../../images/face.jpg" height="95px">
                    
                               
                           
                        
                   
                </center>
                <br>
                <br>
                
                <li >
                
                    <center>
                    <a href="#"><b><%=rsd.getString("tittle")+rsd.getString("name")%></b></a>
                    </center>
                    </li>
                <li>
                    <center>
                    <a href="#"><b><%=username%></b></a>
                    </center>
                    </li>
                <li >
                <center>
                    <a href="#"><b><%=rsd.getString("desg")%></b></a>
                </center>
                </li>
                <li >
                <center>
                    <a href="#"><b><%=Find.sdept(username).toUpperCase()%></b></a>
                </center>
                </li>
            </ul>
        </div>
		        
	<%}
        if(stmtd!=null)
            stmtd.close();
        if(con!=null)
            con.close();
        %>
		
		<header id="page-header"  class="fixed-header">
		
			<div id="page-header-inner">

				<div id="header-container">
					<div class="container clearfix">
						<div id="main-logo">
							<a href="#">
								<img src="../../images/sjit.png"  height="70px"></a>
						</div>
                                            <ul id="auth-nav">
							<li>
								<div class="auth-nav-register">
									<a class="button" href="#menu-toggle" id="menu-toggle">My Details</a>
								</div>
							</li>
						</ul>

						
						

						
						

						<nav id="main-nav">
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="home.jsp">Home</a></li>

   <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="StudentDisplay.jsp">Student Details</a>
   <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Update Attendance</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="attendance.jsp">Mark Absentees</a></li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="editattendance.jsp">Edit</a></li>
	

    </ul>
</li>
<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Attendance Report</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="DailyReport.jsp">Daily Report</a></li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SemReport.jsp">Semester Report</a></li>
	
        

    </ul>
    
</li>


</ul>						</nav>
					</div>
				</div>
			</div>
		</header>
<style>td {
        padding: 10px;
        }
        label {
  display: inline-block;
  width: 140px;
  text-align: right;
}
</style>

<center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                <br><br><br><br>
               <section class="landing">
                    <div id ="manual"><form method="post" action="StudentDisplay.jsp" >
                    <center> <label> Roll No :</label><input type="text" style="background: white" id="rollno" name="search"></center>
                    <div align="center">
                        <br><br>
                        <input type="submit" id="submit" value="Submit" />
                    <br><br></div></form>
                    <%
                        String rollno=request.getParameter("search");
                        Connection con1=null;
                        Statement stmt=null;
                        ResultSet rs=null;
                        String sql="select * from student_general where rollno like '"+rollno+"'";
                    if(request.getParameter("search")!=null)
                    {
                        try
                        {

                         con1=new dbcon().getConnection(Find.sdept(rollno));
                         stmt=con1.createStatement();


                    %>
                    <center> <form method="post" name="general" action="${pageContext.request.contextPath}/updateStudent">
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
                                <option value="OC">OC</option>
                                                    <option value="BC">BC</option>
                                                    <option value="MBC">MBC</option>
                                                    <option value="DC">DC</option>
                                                    <option value="SC">SC</option>
                                                    <option value="ST">ST</option>
                                </select>
                                
                                
                                </td>
                                    <td>
                                        <label>Parents Annual Income :</label><input type="text" style="background: white" id="pincome" name="pincome" value="<%=rs.getString("parents_annual_income")%>">
                                    </td>

                                    <td>
                                        <label>Religion :</label>
                                       <select name="religion" id="religion">
                                            <option value="<%=rs.getString("religion")%>"><%=rs.getString("religion")%></option>
                                                    <option value="Hindu">Hindu</option>
                                                    <option value="Muslim">Muslim</option>
                                                    <option value="Christian">Christian</option>
                                                    <option value="others">Others</option>
                                                    
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

                                <br><br>
                        </form></center>
                           <%
                               }
                               Statement stmt1=null;
                               stmt1=con1.createStatement();
                            sql="select * from student_academic_details where rollno like '"+rollno+"'";
                            ResultSet rs1=stmt1.executeQuery(sql);
                            if(rs1.next())
{
                           %>
                          <center> <form method="post" name="academic" action="${pageContext.request.contextPath}/updateStudent">
                            <br><center><h3>Academic Details</h3></center>

                            <table><br><center><h5>10th Details</h5></center>

                                <tr>
                                    <td>
                                <label>Name of School :</label><input type="text" style="background: white" id="10school" name="10school" value="<%=rs1.getString("tenscl")%>">
                                    </td>
                                    <td>
                                <label>Marks Obtained:</label><input type="text" style="background: white" id="10marks" name="10marks" value="<%=rs1.getString("tenmrks")%>">
                                    </td>
                                        <td>
                                <label>Board of Study:</label><input type="text" style="background: white" id="10board" name="10board" value="<%=rs1.getString("tenboard")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                <label>Medium of Instruction :</label><input type="text" style="background: white" id="10med" name="10med" value="<%=rs1.getString("tenmed")%>">
                                    </td>
                                    <td>
                                <label>Year of Passing :</label><input type="text" style="background: white" id="10yop" name="10yop" value="<%=rs1.getString("tenyop")%>">
                                    </td></tr></table>

                            <table><br><center><h5>12th Details</h5></center>
                                <tr>
                                    <td>
                                <label>Name of School :</label><input type="text" style="background: white" id="12school" name="12school" value="<%=rs1.getString("twlscl")%>">
                                    </td>
                                    <td>
                                <label>Marks Obtained:</label><input type="text" style="background: white" id="12marks" name="12marks" value="<%=rs1.getString("twlmrks")%>">
                                    </td>
                                        <td>
                                <label>Board of Study:</label><input type="text" style="background: white" id="12board" name="12board" value="<%=rs1.getString("twlboard")%>">
                                    </td>
                                </tr>
                                <tr>
                                        <td>
                                <label>Medium of Instruction :</label><input type="text" style="background: white" id="12med" name="12med" value="<%=rs1.getString("twlmed")%>">
                                    </td>
                                        <td>
                                <label>Year of Passing :</label><input type="text" style="background: white" id="12yop" name="12yop" value="<%=rs1.getString("twlyop")%>">
                                        </td></tr></table>
                            <table><br><center><h5>Diploma Details</h5></center>
                                <tr>
                                    <td>
                                <label>Name of College:</label><input type="text" style="background: white" id="dipcoll" name="dipcoll" value="<%=rs1.getString("dipcoll")%>">
                                    </td>
                                    <td>
                                <label>Marks Obtained:</label><input type="text" style="background: white" id="dipmark" name="dipmark" value="<%=rs1.getString("dipmrks")%>">
                                    </td>
                                    <td>
                                <label>Board of Study :</label><input type="text" style="background: white" id="dipboard" name="dipboard" value="<%=rs1.getString("dipboard")%>">
                                    </td></tr>
                                <tr>
                                    <td>
                                <label> Medium of Instruction :</label><input type="text" style="background: white" id="dipmed" name="dipmed" value="<%=rs1.getString("dipmed")%>">
                                    </td>
                                    <td>
                                <label> Year of Passing :</label><input type="text" style="background: white" id="dipyop" name="dipyop" value="<%=rs1.getString("dipyop")%>">
                                    </td>
                                </tr>


                            </table>

<input type="hidden" name="formtype" value="academic"><input type="hidden" name="rollno" value="<%=rs1.getString("rollno")%>">

            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt2=null;
                               stmt2=con1.createStatement();
                            sql="select * from student_admission_details where rollno like '"+rollno+"'";
                            ResultSet rs2=stmt2.executeQuery(sql);
                            if(rs2.next())
{

                            %>
                            <center> <form method="post" name="admission" action="${pageContext.request.contextPath}/updateStudent">
                            <br><center><h3>Admission Details</h3></center>
                                                        <table>
                                <tr>
                                    <td>
                                        <label>Date of Admission :</label><input type="date"  style="background: white" id="doa" name="doa" value="<%=rs2.getString("doa")%>">
                                    </td>
                                     <td>
                                        <label>Counseling or Management :</label><select style="background: white" id="counormn" name="counormn" value="<%=rs2.getString("govt_mang")%>"><option value="Counseling">Counseling</option>
                                            <option value="Management">Management</option></select>
                                    </td>
                                    <td>
                                        <label>Admin Allotment :</label>
                                        <select name="adminalot" style="background: white" id="adminalot" >
                                            <option value="<%=rs2.getString("adminallotment")%>"><%=rs2.getString("adminallotment")%></option>
                                        </select>
                                   </td>
                                   
                                    <td>
                                        <label>Overall Rank :</label><input type="text"  style="background: white" id="orank" name="orank" value="<%=rs2.getString("overallrank")%>">
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <label>Community Rank :</label><input type="text"  style="background: white" id="crank" name="crank" value="<%=rs2.getString("community_rank")%>">
                                    </td>
                                    <td>
                                        <label>Sports Admission :</label><select style="background: white" id="sadmission" name="sadmission" value="<%=rs2.getString("sports_admin")%>"><option value="Yes">Yes</option>
                                            <option value="No">No</option></select>
                                    </td>
                                    <td>
                                        <label>Game Name :</label><input type="text"  style="background: white" id="gname" name="gname" value="<%=rs2.getString("gamename")%>">
                                    </td>
                                    <td>
                                        <label>Medium of Instruction :</label><input type="text"  style="background: white" id="moi" name="moi" value="<%=rs2.getString("MOI")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                          <label>Scholarship :</label>
                                       <select name="scholarship" id="religion">
                                            <option value="<%=rs2.getString("scholarship")%>" > <%=rs2.getString("scholarship")%></option>
                                            <option value="NA">NA</option>
                                                    <option value="First Graduate">First Graduate</option>
                                                    <option value="Fee Waiver">Fee Waiver</option>
                                                    <option value="SC/ST Scholarship">SC/ST Scholarship</option>
                                                    
                                                    
                                        </select>
                               
                                    </td>
                                </tr>
                            </table>
<input type="hidden" name="formtype" value="admission">
<input type="hidden" name="rollno" value="<%=rs2.getString("rollno")%>">
                            
            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt3=null;
                               stmt3=con1.createStatement();
                            sql="select * from student_contact_details where rollno like '"+rollno+"'";
                            ResultSet rs3=stmt3.executeQuery(sql);
                            if(rs3.next())
{
                            %>
                            <center> <form method="post" name="contact" action="${pageContext.request.contextPath}/updateStudent">
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


            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt4=null;
                               stmt4=con1.createStatement();
                            sql="select * from student_father_details where rollno like '"+rollno+"'";
                            ResultSet rs4=stmt4.executeQuery(sql);
                            if(rs4.next())
{
                            %>
                            <center> <form method="post" name="father" action="${pageContext.request.contextPath}/updateStudent">
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
 
            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt5=null;
                               stmt5=con1.createStatement();
                            sql="select * from student_mother_details where rollno like '"+rollno+"'";
                            ResultSet rs5=stmt5.executeQuery(sql);
                            if(rs5.next())
{
                            %>
                            <center> <form method="post" name="mother" action="${pageContext.request.contextPath}/updateStudent">
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
                            
            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt6=null;
                               stmt6=con1.createStatement();
                            sql="select * from student_local_guardian where rollno like '"+rollno+"'";
                            ResultSet rs6=stmt6.executeQuery(sql);
                            if(rs6.next())
{
                            %>
                        <center> <form method="post" name="localGuardian" action="${pageContext.request.contextPath}/updateStudent">
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
   
            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt7=null;
                               stmt7=con1.createStatement();
                            sql="select * from student_other_details where rollno like '"+rollno+"'";
                            ResultSet rs7=stmt7.executeQuery(sql);
                            if(rs7.next())
{
                            %>
                            <center> <form method="post" name="other" action="${pageContext.request.contextPath}/updateStudent">
                            <center><h3>Other Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Transfer From :</label><input type="text"  style="background: white" id="odtf" name="odtf"  value="<%=rs7.getString("transfer_from_other_inst")%>">
                                    </td>
                                    <td>
                                        <label>Institution Name:</label><input type="text"  style="background: white" id="odin" name="odin" value="<%=rs7.getString("instname")%>">
                                    </td>
                                    <td>
                                        <label>Previous Institution Address:</label><input type="text"  style="background: white" id="odprevinst" name="odprevinst" value="<%=rs7.getString("prev_addr")%>">
                                    </td>
                                    <td>
                                        <label>Group :</label><input type="text"  style="background: white" id="odgrp" name="odgrp" value="<%=rs7.getString("group")%>">
                                    </td>
                                </tr><tr>
                                    <td>
                                        <label>Year of Re-admission :</label><input type="text"  style="background: white" id="odyoa" name="odyoa" value="<%=rs7.getString("yearadm")%>">
                                    </td>
                                    <td>
                                        <label>Year of Relieve :</label><input type="text"  style="background: white" id="odyor" name="odyor" value="<%=rs7.getString("yearrelif")%>">
                                    </td>
                                    <td>
                                        <label>Course Completed in Time(Y/N) :</label><input type="text"  style="background: white" id="odct" name="odct" value="<%=rs7.getString("course_completed_in_time")%>">
                                    </td>
                                    <td>
                                        <label>Board of Study:</label> <input type="text"  style="background: white" id="odboard" name="odboard" value="<%=rs7.getString("boardofstudy")%>">
                                    </td>

                                </tr>
                                <tr>

                                    <td>
                                        <label>Medium of Instruction :</label><input type="text"  style="background: white" id="odmoi" name="odmoi" value="<%=rs7.getString("medium")%>">
                                    </td>
                                    <td>
                                        <label>Reason For Discontinuation :</label><input type="text"  style="background: white" id="odrfd" name="odrfd" value="<%=rs7.getString("reason_for_discontinuation")%>">
                                    </td>

                                </tr>

                            </table>
                            <br><br>
                            <input type="hidden" name="formtype" value="other">
                            <input type="hidden" name="rollno" value="<%=rs7.getString("rollno")%>">
                            
            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt8=null;
                               stmt8=con1.createStatement();
                            sql="select * from student_passport_details where rollno like '"+rollno+"'";
                            ResultSet rs8=stmt8.executeQuery(sql);
                            if(rs8.next())
{
                            %>
                            <center> <form method="post" name="passport" action="${pageContext.request.contextPath}/updateStudent">
                            <center><h3>Passport Details</h3></center>
                            <table>
                                <tr>
                                     <td>
                                        <label>Date of Expiry :</label><input type="date"  style="background: white" id="pddoe" name="pddoe" value="<%=rs8.getString("doe")%>">
                                    </td>
                                    <td>
                                        <label>Foreign Student :</label><input type="text"  style="background: white" id="pdfs" name="pdfs"  value="<%=rs8.getString("forgn")%>">
                                    </td>
                                    <td>
                                        <label>Passport Number :</label><input type="text"  style="background: white" id="pdpn" name="pdpn" value="<%=rs8.getString("passno")%>">
                                    </td>

                                </tr>
                                                                <tr>

                                </tr>

                            </table>
                            <input type="hidden" name="formtype" value="passport">
                            <input type="hidden" name="rollno" value="<%=rs8.getString("rollno")%>">
                            
            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt9=null;
                               stmt9=con1.createStatement();
                            sql="select * from student_visa_details where rollno like '"+rollno+"'";
                            ResultSet rs9=stmt9.executeQuery(sql);
                            if(rs9.next())
{
                            %>
                            <center> <form method="post" name="visa" action="${pageContext.request.contextPath}/updateStudent">
                            <center><h3>Visa Details</h3></center>
                                                        <table>
                                <tr>
                                    <td>
                                        <label>Date of Expiry :</label><input type="date"  style="background: white" id="vddoe" name="vddoe" value="<%=rs9.getString("doe")%>">
                                    </td>
                                    <td>
                                        <label>Visa Number :</label><input type="text"  style="background: white" id="vdvn" name="vdvn" value="<%=rs9.getString("visano")%>">
                                    </td>
                                    <td>
                                        <label>Type of Visa :</label><input type="text"  style="background: white" id="vdtype" name="vdtype" value="<%=rs9.getString("typeofvisa")%>">
                                    </td>

                                </tr>
                                                                <tr>

                                </tr>

                            </table>
                            <br><br>
<input type="hidden" name="formtype" value="visa">
<input type="hidden" name="rollno" value="<%=rs9.getString("rollno")%>">
                            
            <br><br>
                        </form></center>
                            <%
                            }
                               Statement stmt10=null;
                               stmt10=con1.createStatement();
                            sql="select * from student_personal where rollno like '"+rollno+"'";
                            ResultSet rs10=stmt10.executeQuery(sql);
                            if(rs10.next())
{
                            %>
                            <center> <form method="post" name="personal" action="${pageContext.request.contextPath}/updateStudent">
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
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
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
                                            <option value="be">B.E</option>
                                            <option value="btech">B.Tech</option>
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
                                            <option value="v">Veg</option>
                                            <option value="nv">Non Veg</option>1

                                        </select></td>

                                    <td>
                                        <label>Accommodation :</label><select name="acc" >
                                            <option value="<%=rs10.getString("accomodation")%>"><%=rs10.getString("accomodation")%></option>
                                            <option value="day">Day Scholar</option>
                                            <option value="hostel">Hosteler</option>

                                        </select></td></tr><tr>
                                    <td>
                                        <label>Initial :</label><input type="text"  style="background: white" id="initial" name="initial" value="<%=rs10.getString("initial")%>">
                                    </td>
                                    <td>



                                        </select></td>
                                </tr>
                                <tr>

                                </tr>

                            </table>
                            <br><br>
                            <input type="hidden" name="rollno" value="<%=rs10.getString("rollno")%>">
                            <input type="hidden" name="formtype" value="personal">
             
            <br><br>
                        </form></center>

                     <%
                     }

if(stmt!=null)
stmt.close();
if(stmt1!=null)
stmt1.close();
if(stmt2!=null)
stmt2.close();
if(stmt3!=null)
stmt3.close();
if(stmt4!=null)
stmt4.close();
if(stmt5!=null)
stmt5.close();
if(stmt6!=null)
stmt6.close();

if(stmt7!=null)
stmt7.close();
if(stmt8!=null)
stmt8.close();
if(stmt9!=null)
stmt9.close();
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
if(con1!=null)
con1.close();
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
               </section>

            

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
			<!--<button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>-->
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu">
<li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="../credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-770"><a href="../index.jsp">Logout</a></li>

                                </ul>			</nav>
		</div>
	</footer>





    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
     $("#menu-toggle1").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
<%
          
    }
    else
    {
        response.sendRedirect("../../index.jsp");
    }
                    if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                connn.close();
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../../index.jsp");
    }
    
          
          %>
</html>