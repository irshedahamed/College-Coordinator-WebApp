<%@page import="com.action.Find"%>
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
        if(type.equals("admin"))
        {
    
    
    %>

    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">
        <script type="text/javascript" src="../js/jquery.js"></script>
        


    </head>
    
        <script type="text/javascript" lang="javascript">
            $(document).ready(function(){
                alert("Note:- \n\
            Please Enter Only Original Details\n\
            These Details Will be used for all furthur AICTE purposes   \n\
            You are responsible for all the details you enter");
                 var counter =0;
                 var ecounter=0;
          document.getElementById("excel").style.display = 'none';
                
                $(document).on("change",".category",function(e){
                    
                    var value=$(this).data("newsel");
                    if(value === "yup")
                    {
                        return;            
                    }
         $(this).data("newsel","yup");
        
    var newTextBoxDiv = $(document.createElement('div'));
              if($(this).val()==="10" || $(this).val()==="12")
              {
                
	newTextBoxDiv.after().html('<tr><td><label class="select"> Name Of Degree :</label><input type="text" class="check" style="background: white"  name="nod'+counter+'"></td>'+
            '<td><label class="select"> Specilization :</label><input type="text" value="NA" style="background: white" class="check"  name="spl'+counter+'"></td>'+
            '<td><label class="select"> Year of Passing :</label><input type="text" style="background: white" class="check" name="yop'+counter+'"></td>'+
            '<td><label class="select"> College/School :</label><input type="text" style="background: white" class="check" name="college'+counter+'"></td></tr>'+
             '<tr><td><label class="select"> University/Board :</label><input type="text" class="check" style="background: white"  name="university'+counter+'"></td>'+
            '<td><label class="select"> CGPA/Percentage :</label><input type="text" class="check" style="background: white"  name="gpa'+counter+'"></td>'+
            '<td><label class="select"> Class :</label><input type="text" class="check" style="background: white"  name="class'+counter+'"></td>'+
            '<td><label class="select"> Marksheet/Degree Certificate :</label><input type="file" class="check" style="background: white"  name="marksc'+counter+'"></td></tr>'+
            '<tr><td>'+
                                        '<label>Category :</label><select style="background: white" class="category" name="category'+(++counter)+'">'+
                                                        
                                                    '<option value="#">Select</option>'+
                                                    '<option value="10">10th</option>'+
                                                    '<option value="12">12th</option>'+
                                                    '<option value="dip">Diploma</option>'+
                                                    '<option value="ug">Under Graduate</option>'+
                                                    '<option value="pg">Post Graduate</option>'+
                                                    '<option value="phd">Doctor Of Philosophy</option>'+
                                    '</select>'+    
                                    '</td>'+
                                           
                                       '</tr>'
            );
              }
              else if($(this).val()==="phd")
              {
                
	newTextBoxDiv.after().html('<tr><td><label class="select"> Name Of Degree :</label><input type="text" class="check" style="background: white"  name="nod'+counter+'"></td>'+
            '<td><label class="select"> Specilization :</label><input type="text" style="background: white" class="check"  name="spl'+counter+'"></td>'+
            '<td><label class="select"> Year of Passing :</label><input type="text" style="background: white" class="check" name="yop'+counter+'"></td>'+
            '<td><label class="select"> College :</label><input type="text" style="background: white" class="check" name="college'+counter+'"></td></tr>'+
             '<tr><td><label class="select"> University :</label><input type="text" class="check" style="background: white"  name="university'+counter+'"></td>'+
            '<td><label class="select"> CGPA/Percentage :</label><input type="text" value="NA" class="check" style="background: white"  name="gpa'+counter+'"></td>'+
            '<td><label class="select"> Class :</label><input type="text" value="NA" class="check" style="background: white"  name="class'+counter+'"></td>'+
            '<td><label class="select"> Marksheet/Degree Certificate :</label><input type="file" class="check" style="background: white"  name="marksc'+counter+'"></td></tr>'+
            '<tr><td>'+
                                        '<label>Category :</label><select style="background: white" class="category" name="category'+(++counter)+'">'+
                                                        
                                                    '<option value="#">Select</option>'+
                                                    '<option value="10">10th</option>'+
                                                    '<option value="12">12th</option>'+
                                                    '<option value="dip">Diploma</option>'+
                                                    '<option value="ug">Under Graduate</option>'+
                                                    '<option value="pg">Post Graduate</option>'+
                                                    '<option value="phd">Doctor Of Philosophy</option>'+
                                    '</select>'+    
                                    '</td>'+
                                           
                                       '</tr>'
            );
              }
              else
              {
                
	newTextBoxDiv.after().html('<tr><td><label class="select"> Name Of Degree :</label><input type="text" class="check" style="background: white"  name="nod'+counter+'"></td>'+
            '<td><label class="select"> Specilization :</label><input type="text" style="background: white" class="check"  name="spl'+counter+'"></td>'+
            '<td><label class="select"> Year of Passing :</label><input type="text" style="background: white" class="check" name="yop'+counter+'"></td>'+
            '<td><label class="select"> College :</label><input type="text" style="background: white" class="check" name="college'+counter+'"></td></tr>'+
             '<tr><td><label class="select"> University :</label><input type="text" class="check" style="background: white"  name="university'+counter+'"></td>'+
            '<td><label class="select"> CGPA/Percentage :</label><input type="text" class="check" style="background: white"  name="gpa'+counter+'"></td>'+
            '<td><label class="select"> Class :</label><input type="text" class="check" style="background: white"  name="class'+counter+'"></td>'+
            '<td><label class="select"> Marksheet/Degree Certificate :</label><input type="file" class="check" style="background: white"  name="marksc'+counter+'"></td></tr>'+
            '<tr><td>'+
                                        '<label>Category :</label><select style="background: white" class="category" name="category'+(++counter)+'">'+
                                                        
                                                    '<option value="#">Select</option>'+
                                                    '<option value="10">10th</option>'+
                                                    '<option value="12">12th</option>'+
                                                    '<option value="dip">Diploma</option>'+
                                                    '<option value="ug">Under Graduate</option>'+
                                                    '<option value="pg">Post Graduate</option>'+
                                                    '<option value="phd">Doctor Of Philosophy</option>'+
                                    '</select>'+    
                                    '</td>'+
                                           
                                       '</tr>'
            );
              }
	//counter++;
        newTextBoxDiv.appendTo("#education");      
          
                });
                    
                  
                $(document).on("change",".experience",function(e){
                    
                    var value=$(this).data("newsel");
                    if(value === "yup")
                    {
                        
                            
                        var subid=$(this)[0].id;
                        subid=subid.substring(10,subid.length);
                            console.log(subid);
                        if($(this).val()==="academic")
                        {
                            $("#enature"+subid).remove();
                        }
                          else if($(this).val()==="industry")
                            {
                             
                            $(" <td id='enature"+subid+"'><label class='select'> Nature of Work :</label><input type='text' style='background: white' class='check' name='enature"+subid+"'></td>").insertAfter("#edesg"+subid); 
                            console.log("<td id='enature'"+subid+">");
            }
                        return;            
                    }
         $(this).data("newsel","yup");
        
    var newTextBoxDiv3 = $(document.createElement('div'));
              if($(this).val()==="academic")
              {
	newTextBoxDiv3.after().html('<tr><td><label class="select"> Joining Date:</label><input type="date" class="check" style="background: white"  name="edoj'+ecounter+'"></td>'+
            '<td><label class="select"> Relive Date :</label><input type="date" style="background: white" class="check"  name="edor'+ecounter+'"></td>'+
            '<td><label class="select"> Name Of Organization :</label><input type="text" class="check" style="background: white"  name="enorg'+ecounter+'"></td>'+
            '<td><label class="select"> Address :</label><input type="text" class="check" style="background: white"  name="eaddr'+ecounter+'"></td></tr>'+
             '<tr><td id="edesg'+ecounter+'"><label class="select"> Designation :</label><input type="text" class="check" style="background: white"   name="edesg'+ecounter+'"></td>'+
             
            '<td><label class="select"> Experience report :</label><input type="file" class="check" style="background: white"  name="expsc'+ecounter+'"></td></tr>'+
            '<tr><td>'+
                                        '<label>Category :</label><select style="background: white" class="experience" id="experience'+(ecounter+1)+'" name="experience'+(++ecounter)+'">'+
                                                        
                                                    '<option value="#">Select</option>'+
                                                    '<option value="academic">Academic Experience</option>'+
                                                    '<option value="industry">Industrial Experience</option>'+
                                                    
                                    '</select>'+    
                                    '</td>'+
                                           
                                       '</tr>'
            );
              }else if($(this).val()==="industry"){
        newTextBoxDiv3.after().html('<tr><td><label class="select"> Joining Date:</label><input type="date" class="check" style="background: white"  name="edoj'+ecounter+'"></td>'+
            '<td><label class="select"> Relive Date :</label><input type="date" style="background: white" class="check" name="edor'+ecounter+'"></td>'+
            '<td><label class="select"> Name Of Organization :</label><input type="text" style="background: white" class="check" name="enorg'+ecounter+'"></td>'+
            '<td><label class="select"> Address :</label><input type="text" style="background: white" class="check" name="eaddr'+ecounter+'"></td></tr>'+
             '<tr><td id="edesg'+ecounter+'"><label class="select"> Designation :</label><input type="text" style="background: white" class="check"  name="edesg'+ecounter+'"></td>'+
             '<td id="enature'+ecounter+'"><label class="select"> Nature of Work :</label><input type="text" style="background: white" class="check"  name="enature'+ecounter+'"></td>'+
            '<td><label class="select"> Experience report :</label><input type="file" style="background: white" class="check" name="expsc'+ecounter+'"></td></tr>'+
            
                    '<tr><td>'+
                                        '<label>Category :</label><select style="background: white" class="experience" id="experience'+(ecounter+1)+'" name="experience'+(++ecounter)+'">'+
                                                        
                                                    '<option value="#">Select</option>'+
                                                    '<option value="academic">Academic Experience</option>'+
                                                    '<option value="industry">Industrial Experience</option>'+
                                                    
                                    '</select>'+    
                                    '</td>'+
                                           
                                       '</tr>'
            );
                  
              }
	//counter++;
        newTextBoxDiv3.appendTo("#experience");      
          
                });
                    
        
        
        $("form").submit(function(){
        var newTextBoxDiv2 = $(document.createElement('div'));
         newTextBoxDiv2.after().html('<tr><td><input type="hidden" name="count" value="'+counter+'"></td><input type="hidden" name="ecount" value="'+ecounter+'"></td></tr>');
        
        newTextBoxDiv2.appendTo("#education");      

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
        
    <script>
        function pageshow()
        {

            var showvalue = document.getElementById("pagetype").value;

            if (showvalue === "Manual Entry")
            {
                document.getElementById("excel").style.display = 'none';
                document.getElementById("manual").style.display = 'block';
            }
            if (showvalue === "Excell Upload")
            {
                document.getElementById("manual").style.display = 'none';
                document.getElementById("excel").style.display = 'block';
            }
        }
    </script>

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
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="course.jsp">Course</a></li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="">Subjects</a>
        <ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectAdd.jsp">Subject Add</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Subject View</a>
                        <ul class="sub-menu">
                 <% for(String dept:Find.Depts){%>
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=<%=dept%>"><%=dept.toUpperCase() %></a>
                    <%}%>       </ul></li>
            </ul></li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="feedetails.jsp">Fee Details</a></li>
    </ul>
</li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Students</a>
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

<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Staff</a>
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
                        <select id="pagetype" onchange="javascript:pageshow();">
                            <option value="Manual Entry">Manual Upload</option>
                            <option value="Excell Upload">Excel Upload</option>
                            
                        </select>
                        <div id="manual">
                                <center> <form method="post" action="${pageContext.request.contextPath}/StaffDetailsUpload" enctype="multipart/form-data">
                                    <center><h3>General Details</h3></center>
                            <table cellspacing="10"><tr><td>
                                        
                                        <label>Title :</label><select style="background: white" id="title" name="title">

                                             
                                                    <option value="Mr.">Mr.</option>
                                                    <option value="Mrs.">Mrs.</option>
                                                    <option value="Ms.">Ms.</option>
                                                    <option value="Dr.">Dr.</option></select>
                                
                                    <td>
                                        
                                        <label class="select"> First Name :</label><input class="check" type="text" style="background: white" id="fname" name="fname"></td>
                                <td>
                                    
                                    <label> Middle Name(Optional):</label><input type="text"  style="background: white" id="mname" name="mname"></td>
                                
                                <td><label>Last Name :</label><input type="text" class="check" style="background: white" id="lname" name="lname">
                                </td></tr>
                                <tr>
                                     <td>
                                        <label>Staffid :</label><input type="text" class="check" style="background: white" id="staffid" name="staffid">    
                                    </td>
                                <td><label>Department :</label><select class="check" style="background: white" id="dept" name="dept">

                                         <%=Find.getDeptHTMLContent() %>
                                                    <option value="first">Science & Humanities</option>
                                    </select>
                                </td>
                                    <td>
                                        <label>Designation :</label><select class="check" style="background: white" id="desg" name="desg">

                                              <option value="Professor">Professor</option>
                                                    <option value="Associate Professor">Associate Professor</option>
                                                    <option value="Assistant Professor">Assistant Professor</option>

                                    </select>                                    </td>
                                    
                                    <td>
                                        <label>Date of Joining :</label><input type="date" class="check" style="background: white" id="doj" name="doj">    
                                    </td>
                                        
                
                                        
                                </tr>
                                <tr>
                                                        <td>
                                        <label> Gender :</label><select style="background: white" class="check" id="gender" name="gender">

                                              <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                    </select>    
                                    </td>
                                </tr>
                                
                               <tr><td> <h4>Current Address :</h4></td></tr>
                                <tr>
                                    
                                    
                                    <td>
                                        <label>Address Line 1 :</label><input type="text" class="check" style="background: white" id="add1" name="add1">
                                    </td>
                                    
                                    <td>
                                        <label>Address Line 2 :</label><input type="text" class="check" style="background: white" id="add2" name="add2">
                                    </td>
                                        <td>
                                        <label>City/Town :</label><input type="text" class="check" style="background: white" id="city" name="city">
                                    </td>
                                    
                                    <td>
                                        <label>State :</label><input type="text" class="check" style="background: white" id="state" name="state" value="TamilNadu">
                                    </td>
                                </tr>
                                <tr>
                                    
                                
                                    
                                    <td>
                                        <label>Pincode :</label><input type="text" class="check" style="background: white" id="pincode" name="pincode">
                                    </td>
                                    
                                </tr>
                                
                               <tr><td> <h4>Permanent Address :</h4></td></tr>
                                <tr>
                                    
                                    
                                  <td>
                                        <label>Address Line 1 :</label><input type="text" class="check" style="background: white" id="add1" name="padd1">
                                    </td>
                                    
                                    <td>
                                        <label>Address Line 2 :</label><input type="text" class="check" style="background: white" id="add2" name="padd2">
                                    </td>
                                        <td>
                                        <label>City/Town :</label><input type="text" class="check" style="background: white" id="city" name="pcity">
                                    </td>
                                    
                                    <td>
                                        <label>State :</label><input type="text" class="check" style="background: white" id="state" name="pstate" value="TamilNadu">
                                    </td>
                                </tr>
                                <tr>
                                    
                                
                                    
                                    <td>
                                        <label>Pincode :</label><input type="text" class="check" style="background: white" id="pincode" name="ppincode">
                                    </td>
                                    
                                </tr>
                                
                               <tr><td> <h4>Contact Details :</h4></td></tr>
                                <tr>
                                    <td>
                                        <label>Mobile 1 :</label><input type="text" class="check" style="background: white" id="mobile1" name="mobile1">
                                    </td>
                                    <td>
                                        <label>Mobile 2:</label><input type="text" class="check" style="background: white" id="mobile2" name="mobile2">
                                    </td>
                                                                        <td>
                                        <label>Land line :</label><input type="text" class="check" style="background: white" id="ll" name="ll">
                                    </td>

                                    <td>
                                        <label>Email :</label><input type="text" class="check" style="background: white" id="email" name="email">
                                    </td>
                                
                                    
                                </tr>
                            </table>
                            <br>
                            
                            
                                   <center><h3>Personal Details</h3></center>
                                   <table cellspacing="10">
                                       <tr>
                                           
                                    <td>
                                        <label>Date Of Birth:</label><input type="date" class="check" style="background: white" id="dob" name="dob">
                                    </td>
                                    
                                    <td>
                                        <label>Blood Group :</label><input type="text" class="check" style="background: white" id="bg" name="bg">
                                    </td>
                                    
                                    <td>
                                        <label>Father's Name:</label><input type="text" class="check" style="background: white" id="father" name="father">
                                    </td>
                                    
                                    <td>
                                        <label>Mother's Name :</label><input type="text" class="check" style="background: white" id="mother" name="mother">
                                    </td>
                                       </tr>
                                       
                                       <tr>
                                           
                                           
                                    <td>
                                        <label>Caste :</label><select style="background: white" class="check" id="caste" name="caste">

                                              <option value="OC">OC</option>
                                                    <option value="BC">BC</option>
                                                    <option value="MBC">MBC</option>
                                                    <option value="DC">DC</option>
                                                    <option value="SC">SC</option>
                                                    <option value="ST">ST</option>
                                    </select>    
                                    </td>
                                    
                                    <td>
                                        <label>Relegion :</label><select class="check" style="background: white" id="relegion" name="relegion">

                                              <option value="Hindu">Hindu</option>
                                                    <option value="Muslim">Muslim</option>
                                                    <option value="Christian">Christian</option>
                                                    <option value="Others">Others</option>
                                    </select>    
                                    </td>
                                     <td>
                                        <label>Nationality :</label><input class="check" type="text" style="background: white" id="nation" name="nation">
                                    </td>
                                           </tr>
                                           <tr>
                                               
                                    <td>
                                        <label>PF Number(optional) :</label><input type="text" style="background: white" id="pfno" name="pfno">
                                    </td>
                                           </tr>
                                           <tr><td></td></tr>
                                          <tr>
                                              
                                    <td>
                                        <label>Passport Number (Optional):</label><input type="text"  style="background: white" id="passno" name="passno">
                                    </td>
                                    
                                    <td>
                                        <label>Pdf/Jpeg File(1MB max) :</label><input type="file"  style="background: white" id="passsc" name="passsc">
                                    </td>
                                          </tr>
                                         <tr><td></td></tr>
                                           <tr>
                                              
                                    <td>
                                        <label>Pan Number :</label><input type="text" class="check" style="background: white" id="panno" name="panno">
                                    </td>
                                    
                                    <td>
                                        <label>Pdf/Jpeg File(1MB max) :</label><input type="file" class="check" style="background: white" id="pansc" name="pansc">
                                    </td>
                                          </tr>
                                            <tr><td></td></tr>
                                           <tr>
                                              
                                    <td>
                                        <label>Aadhar Number (Optional):</label><input type="text" style="background: white" id="aadharno" name="aadharno">
                                    </td>
                                    
                                    <td>
                                        <label>Pdf/Jpeg File(1MB max) :</label><input type="file" style="background: white" id="aadharsc" name="aadharsc">
                                    </td>
                                          </tr>
                                   </table>
                                   <br>
                                   
                                   <center><h3>Education Details</h3></center>
                                   <table cellspacing="10" id="education">
                                       <tr>
                                    <td>
                                        <label>Category :</label><select style="background: white" class="category check" name="category0">
                                                        
                                                    <option value="">Select</option>
                                                    <option value="10">10th</option>
                                                    <option value="12">12th</option>
                                                    <option value="dip">Diploma</option>
                                                    <option value="ug">Under Graduate</option>
                                                    <option value="pg">Post Graduate</option>
                                                    <option value="phd">Doctor Of Philosophy</option>
                                                    
                                    </select>    
                                    </td>
                                           
                                       </tr>
                                       
                                   </table>
                                   <br>
                                   
                                   <center><h3>Experience Details</h3></center>
                                   <table cellspacing="10" id="experience">
                                       <tr>
                                    <td>
                                        <label>Category :</label><select style="background: white" class="experience" id="experience0" name="experience0">
                                                        
                                                    <option value="#">Select</option>
                                                    <option value="academic">Academic Experience</option>
                                                    <option value="industry">Industry Experience</option>
                                    </select>    
                                    </td>
                                           
                                       </tr>
                                       
                                   </table>
                                   
                                   <div align="center">
                                                <input type="submit" id="submit" class="submit" value="Submit" /></div>
                                    </form></center>
                    
                        </div>
<br><br><br>
                        <div id="excel">
                            <center>
                                <form action="${pageContext.request.contextPath}/excelprofileupdate" class="sky-form" method="post" enctype="multipart/form-data">
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
                                                <input type="submit" id="submit" value="Submit" /></div>
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
        <div class="copy"></div>
        <button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>
        <nav id="footer-nav">
            <ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="../index.html">Home</a></li>
                   </ul>			
        </nav>
    </div>
</footer>





<script src="../js/jquery.js"></script>

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