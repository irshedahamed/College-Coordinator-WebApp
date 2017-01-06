<%-- 
    Document   : requests
    Created on : 2 Jan, 2017, 5:22:49 PM
    Author     : Home
--%>
<%@page import="com.action.Find"%>
<%@page import="Actor.Student"%>
<%@page import="Forms.OutPass"%>
<%-- 
    Document   : home
    Created on : 18 Nov, 2016, 5:57:23 PM
    Author     : Home
--%>
<%@page import="General.Holidays"%>
<%@page import="General.Batch"%>
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
        if(type.equals("hostel"))
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
         
     



<link rel="stylesheet" href="../css/angular-material.css">
      
     
<link rel="stylesheet" href="../css/sky-forms.css">
      
	
		
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

    


   <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="requests.jsp">Grant OutPass</a>
  
</li>


<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="Setup.jsp">Holiday Setup</a>


</li>


</ul>						
                                                </nav>
					</div>
				</div>
			</div>
                         <script>
                        $(document).ready(function(){
                            
                         <%
                     Student stu=new Student();
                     if(request.getParameter("rollno")!=null)
                        stu=Student.getById(request.getParameter("rollno"));
                 
                        if(stu.getId()!=null){
                         %>
                            $(".change").on('change keydown',function(){
                                
                              var batch='<%=stu.getBatch() %>';
                              var dept='<%=stu.getDept() %>';
                              var holiday=$(this).val();
                                
                             if(batch!== null && dept!==null&&holiday!== null ){
                                        $.post('../HolidayData',{
                                            batch : batch,
                                            dept : dept,
                                            name : holiday
                                        },function(response){
                                            
                                           // console.log(response);
                                            $("#nfrom").val(response.from);
                                            $("#ntill").val(response.till);
                                        });
                                          
                                      }
                            });
                            <%}%>
                        });
                        
                    </script>
                    <script>
                        $(document).ready(function(){
                            $("#display").hide();
                    $(".pending").on('click',function(){
                               $(this).parents("#pendingrequest").css('float','left');
                               $("#display").show();
                               var rollno=$(this).children().val();
                              //console.log(rollno);
                               $.post('../pendingDetails',{
                                   rollno:rollno.split('-')[0]
                               },function(response){
                                   $("#pname").val(rollno.split('-')[1]);
                                   $("#preason").val(response.reason);
                                   $("#pfrom").val(response.from);
                                   $("#prollno").val(response.rollno);
                                   $("#ptill").val(response.till);
                               });
                            });
          
          
                $(".button").click(function(){
            
            
          $("[name='status']").val($(this).val());
         $("[disabled]").removeAttr('disabled');
        });
                        });
                        
                    </script>
		</header>


<center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                <br><br><br><br>
          <section class="landing">
              <center>
               
                      <br>
                      <form method="get" action="requests.jsp">
                      <label class="input">
                                                    <b>Roll No : </b>
                                                    <label class="input" style="background: white;">
           
          <input type="text" id="rollno"   name="rollno" />
                    <i></i>                                    </label>
                                                </label>
                  
                      &nbsp;&nbsp;&nbsp;&nbsp;   <input type="submit" id="submit" class="search"   value="Submit" />
                  </form>
                      <br><br>
                 <br><br>
                 <%
                     if( stu.getId()!=null){
                   
                 
                 
                 
                 %>
                 <div id="wardenentry">
          
                     <form class="sky-form" action="${pageContext.request.contextPath}/processOutPass" method="post">
          
                     <header>OUTPASS</header>
                         
                          <fieldset>                  
                                                        
                                       
                                            
                                                <div  class="newoutpass">
                                                      <label class="input">
                                                    <label class="input">
                                                          <div align="left" size="3px"><b>
                                                            Name: </b></div> 
                                                        <input type="text" id="nname"  value="<%=stu.getName() %>" disabled >
                                                    
                                                    </label> </label>
                                                    <label class="input"><label class="input">
                                                          <div align="left" size="3px"><b>
                                                            Rollno: </b></div> 
                                                            <input type="text" id="nrollno" name="rollno" value="<%=stu.getId() %>" disabled >
                                                    </label> </label>
                                                    
                                                    <label class="select"><label class="select">
                                                         <div align="left" size="3px"><b>
                                                            Reason: </b></div> 
                                                            <select id="nreason" class="change" name="reason">
                                                                <option value="">Select</option>
                                                                <%
                                                                for(Holidays h:Holidays.getAll(Find.sdept(stu.getId()))){
                                                                %>
                                                               
                                                                <% if(h.getBatch().equals(stu.getBatch())) {%>
                                                                <option value="<%=h.getName() %>"><%=h.getName() %></option>
                                                                <%
                                                                    }
                                                                %>
                                                              
                                                                <%
                                                                }
                                                                %>
                                                              <option value="others">Others</option>
                                                            </select>
                                                    </label> </label>
                                                    <label class="date"><label class="input">
                                                        <div align="left" size="3px"><b>
                                                            From: </b></div> 
                                                    <input type="date" id="nfrom"  name="from" >
                                                   </label> </label>
                                                   &nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <label class="date"><label class="input">
                                                          <div align="left" size="3px"><b>
                                                            Till: </b></div> 
                                                    <input type="date" id="ntill"  name="till" >
                                                    </label> </label>
                                                      <br>
                                                      <br>
                                                      <input type="hidden" name="status" value="Accepted"> 
                                                       
                                                    <input type="submit" class="button" value="Accepted" id="submit" value="Accept">
                                           
                                                  
                                        
                                       
                                                </div> 
                                                  
                  
                          </fieldset>
                  <br><br>
                     </form>
          
                     
                     
                 </div>
                 <%
                 }
 else{
                 %>
                     <div id="display" style="display: block;float: right;width: 45%;">
                    
                     <form class="sky-form" action="${pageContext.request.contextPath}/processOutPass" method="post">
                     <header>REQUEST DETAILS</header>
                              
                          <fieldset>                  
                                         
                                       
                                            
                                                <div  class="pending">
                                                      <label class="input">
                                                    <label class="input">
                                                          <div align="left" size="3px"><b>
                                                            Name: </b></div> 
                                                    <input type="text" id="pname"  value="" disabled>
                                                    
                                                    </label> </label>
                                                    <label class="input"><label class="input">
                                                          <div align="left" size="3px"><b>
                                                            Rollno: </b></div> 
                                                    <input type="text" id="prollno" name="rollno" value="" disabled>
                                                    </label> </label>
                                                    
                                                    <label class="input"><label class="input">
                                                         <div align="left" size="3px"><b>
                                                            Reason: </b></div> 
                                                    <input type="text" id="preason" name="reason"  value="" disabled>
                                                    </label> </label>
                                                    <label class="date"><label class="input">
                                                        <div align="left" size="3px"><b>
                                                            From: </b></div> 
                                                    <input type="date" id="pfrom"  name="from" >
                                                   </label> </label>
                                                   &nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <label class="date"><label class="input">
                                                          <div align="left" size="3px"><b>
                                                            Till: </b></div> 
                                                    <input type="date" id="ptill"  name="till" >
                                                    </label> </label>
                                                      <br>
                                                      <br>
                                                      <input type="hidden" name="status">
                                                           <input type="submit" class="button" value="Rejected" id="submit" value="Reject">
                                                
                                                    <input type="submit" class="button" value="Accepted" id="submit" value="Accept">
                                           
                                                  
                                                   
                                                </div> 
                                                  
                                        
                          </fieldset>
                                <br><br>
                    </form>
                 </div>
                
                 <div id="pendingrequest" style="width: 45%;">
                     <form class="sky-form">
                     <header>PENDING REQUESTS</header>
                                <br><br>
                                       
                                                   <%
                                                   List<OutPass> outpass=OutPass.getAllPending();
                                                   for(OutPass op:outpass){
                                                       if(username.contains("girl")){
                                                           Student s=Student.getById(op.getRollno());
                                                       if(s.getSex().contains("F")){
                                                   %>
                                                    <label class="input">
                                         
                                            <br>
                                            <label class="text" >
                                                <div  class="pending">
                                                    <input type="text"  value="<%=op.getRollno()+" - "+s.getName() %>" disabled>
                                                </div> 
                                                   </label>
                                        </label>
                                                <%
                                                      }
                                                    }else{
                                                        Student s=Student.getById(op.getRollno());
                                                      if(!s.getSex().contains("F")){
                                                   %>
                                                           <label class="input">
                                         
                                           
                                            <label class="text" >
                                                <div class="pending">
                                                <input type="text"  value="<%=op.getRollno()+" - "+s.getName() %>" disabled>
                                                </div>       
                                                </label>
                                        </label>
                                                <%
                                                        }
                                                    }
                                                }
                                                    %>

                                       
                                <br><br>

                     </form>
                 </div>
              <%
              } 

              %>
              </center>     
              
            
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