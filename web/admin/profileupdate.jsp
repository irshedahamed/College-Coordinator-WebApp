<%@page import="Transport.BoardingPoint"%>
<%@page import="com.action.Find"%>
<%@page import="General.Batch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
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
    String type ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type = rsss.getString("type");
        }
        if(type.equals("admin")||type.equals("dataentry"))
        {
    
    
    %>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
    <link href="../css/sky-forms.css" rel="stylesheet">
  

        <script type="text/javascript" src="../js/jquery.js"></script>
	 <script src="../js/select2.js"></script>	
 <script>
        function pageshow()
        {

            var showvalue = document.getElementById("pagetype").value;

            if (showvalue === "Manual Entry")
            {
                document.getElementById("excel").style.display = 'none';
                document.getElementById("print").style.display = 'none';
                document.getElementById("manual").style.display = 'block';
            }
            if (showvalue === "Excell Upload")
            {
                console.log("excel");
                document.getElementById("manual").style.display = 'none';
                document.getElementById("print").style.display = 'none';
                document.getElementById("excel").style.display = 'block';
            }
            if(showvalue === "Print Form"){
                document.getElementById("manual").style.display = 'none';
                document.getElementById("excel").style.display = 'none';
                document.getElementById("print").style.display = 'block';
            }
        }
        
                
                
        $(document).ready(function(){
             $(document).on('change keyup','#religion',function(){
               if($("#religion option:selected").val()==="others"){
                   $("#religion").after('<input type="text" style="background: white" name="religion">');
                   $("#religion").remove();
               }
            });
            $(document).on('change keyup','#counormn',function(){
                
                $("#adminalot option").remove();
                console.log($("#counormn option:selected").val());
                if($("#counormn option:selected").val()==="Counseling"){
                    $("#adminalot").append(' <option value="OC">OPEN</option>'+
                                            ' <option value="BC">BC</option>'+
                                            ' <option value="MBC">MBC</option>'+
                                            ' <option value="BCM">BCM</option>'+
                                            ' <option value="SC">SC</option>'+
                                            ' <option value="SCA">SCA</option>'+
                                            ' <option value="ST">ST</option>'+
                                           ' <option value="SPORTS">SPORTS</option>'+
                                           ' <option value="VOCATIONAL">VOCATIONAL</option>   '+                                       
                                           ' <option value="EX-SERVICEMAN">EX-SERVICEMAN</option>'+
                                            '<option value="PHYSICALLY HANDICAPPED">PHYSICALLY HANDICAPPED</option>'+
                                        '');
                }
                else if($("#counormn option:selected").val()==="Management"){
                    $("#adminalot").append(' <option value="GENERAL">GENERAL</option>'+
                                           ' <option value="SPORTS">SPORTS</option>'+
                                           ' <option value="CHRISTIAN MINORITY">CHRISTIAN MINORITY</option>   '+                                       
                                           ' <option value="NRICGC">NRICGC</option>'+
                                            ' <option value="FOREIGN">FOREIGN</option>'+
                                            '<option value="LAPS">LAPS</option>'+
                                        '');
                    
                }
            });
             $('select.boarding').select2();
            document.getElementById("excel").style.display = 'none';
             document.getElementById("print").style.display = 'none';
             document.getElementById("manual").style.display = 'block';
                $("form#manual").submit(function(){
                    
                    console.log($(this).attr('class'));
                    if($(this).attr('class')!== undefined)
                        return true;
                
                flag=0;
                    $(".check").each(function(index){
                        if($(this).val()=== '')
                        {
                            $(this).focus();
                            $(this).css({"border-color": "#9ecaed",
    "box-shadow":" 0 0 10px #9ecaed"});
                            flag=1;
                        }else{
                             $(this).css({"border-color": "",
    "box-shadow":""});
                        }
                            
                      //  console.log(index + ": " + $( this ).val());
                    });
                    if(flag===1)
                    {   alert("Please Fill all Mandatory Fields");
                        return false;}
                });
                
    });
    </script>
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Academics</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Batch</a>
            <ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="batch.jsp">Update Batch</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="deletebatch.jsp">Delete Batch</a>
            </ul>
        </li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Academic Year</a>
            <ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="InsertYear.jsp">Insert Academic Year</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="CurrentUpd.jsp">Update Current</a>
            </ul>
        </li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="">Subjects</a>
        <ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectAdd.jsp">Subject Add</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Subject View</a>
                        <ul class="sub-menu">
          <% for(String dept:Find.Depts){%>
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=<%=dept%>"><%=dept.toUpperCase() %></a>
                    <%}%> </ul></li>
            </ul></li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="feedetails.jsp">Fee Details</a></li>
    </ul>
</li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Students</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="studentprofiles.jsp">Profile</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profileupdate.jsp">Add Profile</a>
                    
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profileedit.jsp">Update Profile</a>
                    
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profiledelete.jsp">Delete Profile</a>
        </ul></li>	
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="studentpasswords.jsp">Passwords</a>
	
</li>
</ul>
</li>

<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Staff</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Profile</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofileupdate.jsp">Add Profile</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofiledelete.jsp">Delete Profile</a>
        </ul></li>	

	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffpasswords.jsp">Passwords</a></li>

    </ul>
</li>

<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">SMS</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="generalsms.jsp">General</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="absentieessms.jsp">Absentiees</a></li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksms.jsp">Mark</a></li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffsms.jsp">Staff</a></li>

    </ul>
</li>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Email</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="sendemail.jsp">Send Email</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="emailstatus.jsp">View Email Status</a>
	
</li>
</ul>

<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circularupload.jsp">Circular Uploads</a>
<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Forms</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="formupload.jsp">Form Upload</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="formmanage.jsp">Manage</a></li>
     
    </ul>
</li>

                                               
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Reports</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="PasswordReport.jsp">Password</a></li>
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="AddressReport.jsp">Address</a>
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="verificationReport.jsp">Verification</a>
		 <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="BoardingptReport.jsp">Boarding Point</a>

	
</li>
</ul>
    
</ul>					
 
                                                
                                                </nav>
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
<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
            <select id="pagetype" onchange="pageshow();">
                    <option value="Manual Entry">Manual Entry</option>
                    <option value="Excell Upload">Excel Upload</option>
                    <option value="Print Form">Print Form</option>
                    
                </select>
           
                <div id="manual">
                    <center> <form id="manual" method="post" action="${pageContext.request.contextPath}/StudentAdd">
                            <center><h3>General Details</h3></center>
                            <table cellspacing="10"><tr><td>
                                        
                                        <label> Roll No :</label><input type="text" class="check" style="background: white" id="rollno" name="rollno"></td>
                                
                                   <td> 
                                    <label> Date of Birth :</label><input type="date" placeholder="yyyy-mm-dd" style="background: white" id="dob" name="dob"></td>
                                
                                   <td>
                                        <label> Nationality :</label><input type="text" class="check" style="background: white" id="nationality" name="nationality">
                                    </td>
                                    <td>
                                        <label>Religion :</label>
                                        
                                    <select name="religion" id="religion">
                                            <option value="">Select</option>
                                                    <option value="Hindu">Hindu</option>
                                                    <option value="Muslim">Muslim</option>
                                                    <option value="Christian">Christian</option>
                                                    <option value="others">Others</option>
                                    </td>
                                 </tr>
                                <tr>
                                       
                                    
                                <td><label>Caste :</label><input type="text" class="check" style="background: white" id="caste" name="caste">
                                </td>
                                <td><label>Community :</label>
                                    
                                    
                                   
                                <select name="community">
                                <option value="OC">OC</option>
                                                    <option value="BC">BC</option>
                                                    <option value="MBC">MBC</option>
                                                    <option value="DC">DC</option>
                                                    <option value="SC">SC</option>
                                                    <option value="ST">ST</option>
                                </select>
                                </td>
                                    
                                 <td>
                                        <label> Mother Tongue :</label> <input type="text" class="check" style="background: white" id="mothertongue" name="mothertongue">
                                    </td>
                                
                                      <td>
                                        <label>Parents Annual Income :</label><input type="text" class="check" style="background: white" id="pincome" name="pincome">
                                    </td>
                                    
                                        
                                 
                                        
                                </tr>
                                <tr>
                                    
                                  
                                   
                                    <td>
                                        <label>Club Member (NCC/NSS/SPORTS etc.) :</label><input type="text" class="check" style="background: white" id="clubmember" name="clubmember">
                                    </td>
                                    <td>
                                        <label>Boarding Point :</label>  <select class="boarding"  id="boarding" name="boarding"  >
                                                    <option >Select</option>
                                                     <%
                                                        List<String> blist= BoardingPoint.getAll();
                                                   for(String s:blist){
                                                   %>
                                                   <option value="<%=s %>"><%=s%></option>
                                                   <%
                                                   }
                                                   %>
                                                </select>
                                    </td>
                                </tr></table>
                            <br><br>
                            <center><h3>Personal Details</h3></center>
                            <table>
                                <tr>
                                     <td>
                                        <label>Reg. No.:</label><input type="text" class="check"  style="background: white" id="regno" name="regno">
                                    </td>
                                    <td>
                                        <label>Name :</label><input type="text" class="check"  style="background: white" id="stuname" name="stuname">
                                    </td>
                                   
                                    <td>
                                        <label>Gender :</label><select name="gender">
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select></td>
                                    <td>
                                        <label>Blood Group :</label>
                                        
                                        <select style="background: white"  name="bloodgroup">
                                            <option value="">Select</option>
                                            <option value="O +ve">O +ve</option>
                                            <option value="O -ve">O -ve</option>
                                            <option value="B +ve">B +ve</option>
                                            <option value="B -ve">B -ve</option>
                                            <option value="A +ve">A +ve</option>
                                            <option value="A -">A -ve</option>
                                            <option value="B1 +ve">B1 +ve</option>
                                            <option value="A2B +ve">A2B +ve</option>
                                            <option value="A2B -ve">A2B -ve</option>
                                            <option value="A2 +ve">A2 +ve</option>
                                            <option value="A2 -ve">A2 -ve</option>
                                            <option value="A1B +ve">A1B +ve</option>
                                            <option value="A1B -ve">A1B -ve</option>
                                            <option value="A1 +ve">A1 +ve</option>
                                            <option value="A1 -ve">A1 -ve</option>
                                            <option value="AB -ve">AB -ve</option>
                                            <option value="AB +ve">AB +ve</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Batch :</label>
                                        <select name="batch">
                                            <option value="">Select</option>
                                             <%= Batch.getHTMLContent() %>
                                        </select>
                                    </td>
                                     <td>
                                        <label>Course :</label><select name="course">
                                            <option value="be">B.E</option>
                                            <option value="btech">B.Tech</option>
                                        </select>
                                    </td>
                                    <td>
                                        <label>Section :</label><input type="text" class="check"  style="background: white" id="sec" name="sec">
                                    </td>
                                    <td>
                                        <label>Mobile no. :</label><input type="text" class="check"  style="background: white" id="stumobile" name="stumobile">
                                    </td></tr><tr>
                                    <td>
                                        <label>Mail id :</label><input type="text" class="check"  style="background: white" id="stumail" name="stumail">
                                    </td>
                                
                                    <td>
                                        <label>Food :</label><select name="food">
                                            <option value="v">Veg</option>
                                            <option value="nv">Non Veg</option>
                                            
                                        </select></td>
                                    
                                    <td>
                                        <label>Accommodation :</label><select name="acc">
                                            <option value="day">Day Scholar</option>
                                            <option value="hostel">Hosteler</option>
                                            
                                        </select></td></tr><tr>
                                    <td style="display: none">
                                        <label>Initial :</label><input type="text" class=""  style="background: white" id="initial" name="initial">
                                    </td>
                                    <td>
                                       

                                        <label style="display: none">Model Type :</label><select name="modeltype" style="display: none">
                                            <option value="gen">General</option>
                                            <option value="spl">Special</option>
                                            
                                        </select></td>
                                </tr>
                                <tr>
                                    
                                </tr>
                                    
                            </table>
                            
                                <br><center><h3>Contact Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Door/Flat No/Apartement Name (Max 30 chars):</label><input type="text" class="check" maxlength="30"  style="background: white" id="doorno" name="doorno">
                                    </td>
                                    <td>
                                        <label>Street (Max 30 chars):</label><input type="text" class="check" maxlength="30"  style="background: white" id="street" name="street">
                                    </td>
                                    <td>
                                        <label>Area (Max 30 chars):</label><input type="text" class="check" maxlength="30"   style="background: white" id="area" name="area">
                                    </td>
                                    <td>
                                        <label>City (Max 30 chars):</label><input type="text" class="check" maxlength="30"  style="background: white" id="city" name="city">
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <label>District :</label><input type="text" class="check"  style="background: white" id="district" name="district">
                                    </td>
                                    <td>
                                        <label>State :</label><input type="text" class="check"  style="background: white" id="state" name="state">
                                    </td>
                                    <td>
                                        <label>Country :</label><input type="text" class="check"  style="background: white" id="country" name="country">
                                    </td>
                                    <td>
                                        <label>Pincode :</label><input type="text" class="check"  style="background: white" id="pincode" name="pincode">
                                    </td>
                                </tr>
                            </table>
                            <center><h3>Father Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Father Name :</label><input type="text" class="check"  style="background: white" id="fathername" name="fathername">
                                    </td>
                                    <td>
                                        <label>Qualification :</label><input type="text" class="check"  style="background: white" id="qualification" name="qualification">
                                    </td>
                                    <td>
                                        <label>Occupation :</label><input type="text" class="check"  style="background: white" id="occupation" name="occupation">
                                    </td>
                                    <td>
                                        <label>Designation :</label><input type="text" class="check"  style="background: white" id="designation" name="designation">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Address :</label><input type="text" class="check"  style="background: white" id="address" name="address">
                                    </td>
                                    <td>
                                        <label>Landline :</label><input type="text" class="check"  style="background: white" id="landline" name="landline">
                                    </td>
                                    <td>
                                        <label>Mobile :</label><input type="text" class="check"  style="background: white" id="mobile" name="mobile">
                                    </td>
                                    <td>
                                        <label>Mail id :</label><input type="text" class="check"  style="background: white" id="mail" name="mail">
                                    </td>
                                </tr>
                                <tr>
                                    
                                </tr>
                                    
                            </table>
                            <br><br> 
                            
                            <center><h3>Mother Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Mother Name :</label><input type="text" class="check"  style="background: white" id="mothername" name="mothername">
                                    </td>
                                    <td>
                                        <label>Qualification :</label><input type="text" class="check"  style="background: white" id="qualification" name="mqualification">
                                    </td>
                                    <td>
                                        <label>Occupation :</label><input type="text" class="check"  style="background: white" id="occupation" name="moccupation">
                                    </td>
                                    <td>
                                        <label>Designation :</label><input type="text" class="check"  style="background: white" id="designation" name="mdesignation">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Address :</label><input type="text" class="check"  style="background: white" id="address" name="maddress">
                                    </td>
                                    <td>
                                        <label>Landline :</label><input type="text" class="check"  style="background: white" id="landline" name="mlandline">
                                    </td>
                                    <td>
                                        <label>Mobile :</label><input type="text" class="check"  style="background: white" id="mobile" name="mmobile">
                                    </td>
                                    <td>
                                        <label>Mail id :</label><input type="text" class="check"  style="background: white" id="mail" name="mmail">
                                    </td>
                                </tr>
                                <tr>
                                    
                                </tr>
                                    
                            </table>
                            <br><br> 
                            
                            <center><h3>Local Guardian Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Name :</label><input type="text" class="check"  style="background: white" id="lgname" name="lgname">
                                    </td>
                                    <td>
                                        <label>Phone no :</label><input type="text" class="check"  style="background: white" id="lgphno" name="lgphno">
                                    </td>
                                    <td>
                                        <label>Door no :</label><input type="text" class="check"  style="background: white" id="lgdoorno" name="lgdoorno">
                                    </td>
                                    <td>
                                        <label>Street :</label><input type="text" class="check"  style="background: white" id="lgstreet" name="lgstreet">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Area :</label><input type="text" class="check"  style="background: white" id="lgarea" name="lgarea">
                                    </td>
                                    
                                    <td>
                                        <label>City :</label><input type="text" class="check"  style="background: white" id="lgcity" name="lgcity">
                                    </td>
                                    <td>
                                        <label>Pin Code :</label><input type="text" class="check"  style="background: white" id="lgpincode" name="lgpincode">
                                    </td>
                                    
                                </tr>
                                
                                    
                            </table>
         
                            
                                               <center><h3>Local Guardian2 Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Name :</label><input type="text" class="check"  style="background: white" id="lgname2" name="lgname2">
                                    </td>
                                    <td>
                                        <label>Phone no :</label><input type="text" class="check"  style="background: white" id="lgphno2" name="lgphno2">
                                    </td>
                                    <td>
                                        <label>Door no :</label><input type="text" class="check"  style="background: white" id="lgdoorno2" name="lgdoorno2">
                                    </td>
                                    <td>
                                        <label>Street :</label><input type="text" class="check"  style="background: white" id="lgstreet2" name="lgstreet2">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Area :</label><input type="text" class="check"  style="background: white" id="lgarea2" name="lgarea2">
                                    </td>
                                    
                                    <td>
                                        <label>City :</label><input type="text" class="check"  style="background: white" id="lgcity2" name="lgcity2">
                                    </td>
                                    <td>
                                        <label>Pin Code :</label><input type="text" class="check"  style="background: white" id="lgpincode2" name="lgpincode2">
                                    </td>
                                    
                                </tr>
                                
                                    
                            </table>
         
                            
                            
                            
                            
                            <br><center><h3>Academic Details</h3></center>
                           
                            <table><br><center><h5>10th Details</h5></center>
                                
                                <tr>
                                    <td>
                                <label>Name of School :</label><input type="text" class="check" style="background: white" id="10school" name="10school">
                                    </td>
                                    <td>
                                <label>Marks Obtained:</label><input type="text" class="check" style="background: white" id="10marks" name="10marks">
                                    </td>
                                        <td>
                                <label>Board of Study:</label>
                                
                                <select name="10board">
                                    <option value="STATE BOARD">STATE BOARD</option>
                                    <option value="CBSE">CBSE</option>
                                    <option value="MATRICULATION">MATRICULATION</option>
                                    <option value="ANGLO INDIAN">ANGLO INDIAN</option>
                                    <option value="OTHERS">OTHERS</option>
                                    <option value="NA">NA</option>
                                    
                                </select>
                                
                                    </td>
                                </tr>
                                <tr>
                                        <td>
                                <label>Medium of Instruction :</label>
                                 <select name="10med">
                                    <option value="English">ENGLISH</option>
                                    <option value="Tamil">Tamil</option>
                                    <option value="Others">OTHERS</option>
                                    <option value="NA">NA</option>
                                    
                                </select>
                                        </td>
                                    <td>
                                <label>Year of Passing :</label><input type="text" class="check" style="background: white" id="10yop" name="10yop">
                                    </td></tr></table>
                     
                            <table><br><center><h5>12th Details</h5></center>
                                <tr>
                                    <td>
                                <label>Name of School :</label><input type="text" class="check" style="background: white" id="12school" name="12school">
                                    </td>
                                    <td>
                                <label>Marks Obtained:</label><input type="text" class="check" style="background: white" id="12marks" name="12marks">
                                    </td>
                                        <td>
                                <label>Board of Study:</label>  
                                <select name="12board">
                                    <option value="STATE BOARD">STATE BOARD</option>
                                    <option value="CBSE">CBSE</option>
                                    <option value="MATRICULATION">MATRICULATION</option>
                                    <option value="ANGLO INDIAN">ANGLO INDIAN</option>
                                    <option value="OTHERS">OTHERS</option>
                                    <option value="NA">NA</option>
                                    
                                </select>
                                    </td>
                                </tr>
                                <tr>
                                        <td>
                                <label>Medium of Instruction :</label>
                                <select name="12med">
                                    <option value="English">ENGLISH</option>
                                    <option value="Tamil">Tamil</option>
                                    <option value="Others">OTHERS</option>
                                    <option value="NA">NA</option>
                                    
                                </select>
                                    </td>
                                        <td>
                                <label>Year of Passing :</label><input type="text" class="check" style="background: white" id="12yop" name="12yop">
                                        </td></tr></table>
                            <table><br><center><h5>Diploma Details</h5></center>
                                <tr>
                                    <td>
                                <label>Name of College:</label><input type="text" class="check" style="background: white" id="dipcoll" name="dipcoll">
                                    </td>
                                    <td>
                                <label>Marks Obtained:</label><input type="text" class="check" style="background: white" id="dipmark" name="dipmark">
                                    </td>
                                    <td>
                                <label>Board of Study :</label>
                                  <select name="dipboard">
                                    <option value="DOTE">DOTE</option>
                                    <option value="OTHERS">OTHERS</option>
                                    <option value="NA">NA</option>
                                    
                                </select>
                                    </td></tr>
                                <tr>
                                    <td>
                                <label> Medium of Instruction :</label>
                                <select name="dipmed">
                                    <option value="English">ENGLISH</option>
                                    <option value="Tamil">Tamil</option>
                                    <option value="Others">OTHERS</option>
                                    <option value="NA">NA</option>
                                    
                                </select>
                                    </td>
                                    <td>
                                <label> Year of Passing :</label><input type="text" class="check" style="background: white" id="dipyop" name="dipyop">
                                    </td>
                                </tr>
                                
                                   
                            </table>
                            
                            <br><center><h3>Admission Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Date of Admission :</label><input type="date" class="check" placeholder="yyyy-mm-dd" style="background: white" id="doa" name="doa">
                                    </td>
                                    
                                       <td>
                                        <label>Counseling or Management :</label><select style="background: white" id="counormn" name="counormn">
                                            <option value="">Select</option>
                                            <option value="Counseling">Counseling</option>
                                            <option value="Management">Management</option></select>
                                    </td>
                                    
                                    <td>
                                        <label>Category :</label>
                                    
                                        <select id="adminalot" name="adminalot">
                                            <option value="">Select</option>
                                           
                                        </select>
                                    
                                    </td>
                                 
                                    <td>
                                        <label>Overall Rank :</label><input type="text" class="check"  style="background: white" id="orank" name="orank">
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <label>Community Rank :</label><input type="text" class="check"  style="background: white" id="crank" name="crank">
                                    </td>
                                    <td>
                                        <label>Sports Admission :</label><select style="background: white" id="sadmission" name="sadmission"><option value="Yes">Yes</option>
                                            <option value="No">No</option></select>
                                    </td>
                                    <td>
                                        <label>Game Name :</label><input type="text" class="check"  style="background: white" id="gname" name="gname">
                                    </td>
                                    <td>
                                        <label>Medium of Instruction :</label><input type="text" class="check"  style="background: white" id="moi" name="moi">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                          <label>Scholarship :</label>
                                       <select name="scholarship" id="scholarship">
                                           <option value="NA">NA</option>
                                                    <option value="First Graduate">First Graduate</option>
                                                    <option value="Fee Waiver">Fee Waiver</option>
                                                    <option value="SC/ST Scholarship">SC/ST Scholarship</option>
                                                    
                                                    
                                        </select>
                               
                                    </td>
                                </tr>
                            </table>
                        
                            <br><br>
                             
                            
                            <center><h3>Other Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Previous Course :</label>
                                        
                                         <select style="background: white" id="odtf" name="odtf">
                                           <option value="">Select</option>
                                                    <option value="12">Twelfth</option>
                                                    <option value="Diploma">Diploma</option>
                                                    <option value="UG">UG</option>
                                                    <option value="PG">PG</option>
                                                    
                                                    
                                        </select>
                                    </td>
                                    <td>
                                        <label>Previous Institution Name:</label><input type="text" class="check"  style="background: white" id="odin" name="odin">
                                    </td>
                                    <td>
                                        <label>Previous Institution Address:</label><input type="text" class="check"  style="background: white" id="odprevinst" name="odprevinst">
                                    </td>
                                    <td>
                                        <label>Group/Department :</label><input type="text" class="check"  style="background: white" id="odgrp" name="odgrp">
                                    </td>
                                </tr><tr>
                                    <td> 
                                        <label>Year of Re-admission :</label><input type="text" class="check"  style="background: white" id="odyoa" name="odyoa">
                                    </td>
                                    <td> 
                                        <label>Year of Relieve :</label><input type="text" class="check"  style="background: white" id="odyor" name="odyor">
                                    </td>
                                    <td>
                                        <label>Course Completed in Time(Y/N) :</label><input type="text" class="check"  style="background: white" id="odct" name="odct">
                                    </td>
                                    <td>
                                        <label>Board/University :</label><input type="text" class="check"  style="background: white" id="odboard" name="odboard">
                                    </td>
                                    
                                </tr>
                                <tr>
                                   
                                    <td>
                                        <label>Medium of Instruction :</label><input type="text" class="check"  style="background: white" id="odmoi" name="odmoi">
                                    </td>
                                    <td>
                                        <label>Reason For Discontinuation :</label><input type="text" class="check"  style="background: white" id="odrfd" name="odrfd" value="Transfer">
                                    </td>
                                    
                                </tr>
                                    
                            </table>
                            <br><br>
                            
                            
                            <center><h3>Passport Details</h3></center>
                            <table>
                                <tr>
                                     <td>
                                        <label>Date of Expiry :</label><input type="date"  style="background: white" id="pddoe" name="pddoe">
                                    </td>
                                    <td>
                                        <label>Foreign Student :</label><input type="text"  style="background: white" id="pdfs" name="pdfs">
                                    </td>
                                    <td>
                                        <label>Passport Number :</label><input type="text"   style="background: white" id="pdpn" name="pdpn">
                                    </td>
                                   
                                </tr>
                                                                <tr>
                                    
                                </tr>
                                    
                            </table>
                            <br><br>
                            
                            
                            <center><h3>Visa Details</h3></center>
                            <table>
                                <tr>
                                    <td>
                                        <label>Date of Expiry :</label><input type="date"  style="background: white" id="vddoe" name="vddoe">
                                    </td>
                                    <td>
                                        <label>Visa Number :</label><input type="text"  style="background: white" id="vdvn" name="vdvn">
                                    </td>
                                    <td>
                                        <label>Type of Visa :</label><input type="text"   style="background: white" id="vdtype" name="vdtype">
                                    </td>
                                    
                                </tr>
                                                                <tr>
                                    
                                </tr>
                                    
                            </table>
                            <br><br>
                            
                             
                 <div align="centre">
            <input type="submit" id="submit" value="Submit" /></div>
            <br><br>
                        </form></center>
                        
                        
                  
                </div>
                                         <div id ="print">
                 <center> <form  method="post" action="studentSuccessForm.jsp">
                                        
                                        <label> Roll No :</label><input type="text" class="" style="background: white" id="rollno" name="rollno">  
                                        <input type="submit" id="submit" value="Submit">
                                
                     </form>
                 </center>
            </div>
            <div id="excel">
                <center>
                   <form action="${pageContext.request.contextPath}/ExcelStudentUpload" class="sky-form batchupdate" method="post" enctype="multipart/form-data">
                <header>BATCH UPDATE</header>
    <fieldset>					
					<section>
            
                 
                 <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Regulation: </b></div>
                <label class="input">
                    
                    <input type="file" id="formfile" name="formfile">
           
                <i></i>
                    </label>
            </label>
                 
                 <br><br> 
                 <div align="right">
            <input type="submit"  id="submit" value="Submit" /></div>
                                        </section>
    </fieldset>
                
            
                </form> 
                    
                </center>
            </div>


</div></div></section>

</section>
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
			<div class="copy">© All rights reserved, IncredibleBytes, 2014</div>
			<button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="index.html">Home</a></li>
<li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="courses/index.html">Courses</a></li>
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="blog/index.html">Blog</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="contact-2/index.html">Contact</a></li>
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
        response.sendRedirect("../index.jsp");
    }
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }

                            if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                connn.close();
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>