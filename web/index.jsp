<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <%
        HttpSession newsession = request.getSession(false);
    if (newsession != null) 
    {
         newsession.invalidate();

    }
        
        
        %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>Simple Responsive Template</title>
<meta name="description" content="Simple Responsive Template is a template for responsive web design. Mobile first, responsive grid layout, toggle menu, navigation bar with unlimited drop downs, responsive slideshow">
<meta name="keywords" content="">

<!-- Mobile viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">

<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">

<!-- CSS-->
<!-- Google web fonts. You can get your own bundle at http://www.google.com/fonts. Don't forget to update the CSS accordingly!-->
<link href='http://fonts.googleapis.com/css?family=Droid+Serif|Ubuntu' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/basic-style1.css">
<link href="css/style2.css" rel='stylesheet' type='text/css' />

<!-- end CSS-->
    
<!-- JS-->
<script src="js/libs/modernizr-2.6.2.min.js"></script>
<!-- end JS-->


<!-- columns demo style. DELETE IT! -->
<style type="text/css">
<!--

#columnsdemo .grid_1,
#columnsdemo .grid_2,
#columnsdemo .grid_3,
#columnsdemo .grid_4,
#columnsdemo .grid_5,
#columnsdemo .grid_6,
#columnsdemo .grid_7,
#columnsdemo .grid_8,
#columnsdemo .grid_9,
#columnsdemo .grid_10,
#columnsdemo .grid_11,
#columnsdemo .grid_12 {
border: solid 1px #999;
color:#999;
text-align: center;
margin-top:20px;
padding:20px 15px;
}
-->
</style>
</head>

<body id="home">
<header class="wrapper clearfix">
<center>	
<img src="images/logo2.png" height="165px" width="700px" >	</center></header>
  
<!-- header area -->
    <!-- end header -->
 
 
<!-- hero area (the grey one with a slider -->
    <section id="hero" class="clearfix"> 

    <!-- responsive FlexSlider image slideshow -->
    <div class="wrapper">

     <div class="row">
      
	   
	   
			  <!-- FlexSlider -->
              
			  <!-- end grid_7 -->
       <!-- end row -->

	
        <div class="grid_5">
              <div class="flexslider">
                  <ul class="slides">
                      <li>
                          <img src="images/1.JPG" />
                          <center><p class="flex-caption">St.Joseph's Institute of Technology</p></center>
                      </li>
                      <li>
                        <img src="images/2.JPG" />
                         <center><p class="flex-caption">A World Class Educational Institution</p></center>
                      </li>
                      <li>
                          <img src="images/3.JPG" />
                        <center><p class="flex-caption">With well-experienced and trained faculties</p></center>
                      </li>
                      <li>
                          <img src="images/4.JPG" />
                         <center> <p class="flex-caption">We make you shine</p></center>
                      </li>
                  </ul>
              </div> 
			</div>
       <div class="grid_5 rightfloat">
	   <div class="main">
            
		<form action="LoginServlet" method="post">
    		<h1><label>LOGIN</label></h1>
  			<div class="inset">
	  			<p>
	    		 <label for="email">USERNAME</label>
   	 			<input type="text" name="uname" placeholder="" required/>
				</p>
  				<p>
				    <label for="password">PASSWORD</label>
				    <input type="password" name="pass" onKeyPress="return detectCapsLock(event)" placeholder="" required/>
                                    <label id="capsDetect"></label>
  				</p>
				  
 			 </div>
 	 
			  <p class="p-container">
			    
			    <input type="submit" value="Login">
			  </p>
		</form>
	</div>
	</div>
			

   
	   </div>
	   </div>
	   <!-- end wrapper -->
    </section><!-- end hero area -->





<!-- main content area -->   
<!-- #end div #main .wrapper -->


<!-- footer area -->    
<footer>
	<div id="colophon" class="wrapper clearfix">
	<br><br>
    	St.Joseph's Institute of Technology
		<br>
		<br>
		<br>
                <br>
                <br>
                
    </div>
    

    
</footer><!-- #end footer area --> 


<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.9.0.min.js">\x3C/script>')</script>

<script defer src="js/jquery.flexslider-min.js"></script>

<!-- fire ups - read this file!  -->   
<script src="js/main.js"></script>

</body>
</html>