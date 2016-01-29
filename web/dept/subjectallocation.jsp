<%@page import="dbconnection.dbcon"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en-US">
    
     <% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type1 ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type1 = rsss.getString("type");
        }
        if(type1.equals("dept"))
        {
    
    
    %>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/sky-forms.css" rel="stylesheet">

<script src="../js/jquery-1.11.1.js" type="text/javascript"></script>


<script>
     $(document).on('change', '[id^="sem1"]', function() {
   var sem = $("select#sem1").val();
        var dept = $("select#dept1").val();
        var batch = $("select#batch1").val();
        
        if(dept !== 'null' && batch !== 'null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
                
        },function(response) {

        var select = $('#subject1');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="dept1"]', function() {
   var sem = $("select#sem1").val();
        var dept = $("select#dept1").val();
        var batch = $("select#batch1").val();
        if(sem !== 'null' && batch !== 'null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject1');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="batch1"]', function() {
   var sem = $("select#sem1").val();
        var dept = $("select#dept1").val();
        var batch = $("select#batch1").val();
        if(sem !== 'null' && dept !== 'null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject1');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="sem2"]', function() {
   var sem = $("select#sem2").val();
        var dept = $("select#dept2").val();
        var batch = $("select#batch2").val();
        
        if(dept !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject2');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="dept2"]', function() {
   var sem = $("select#sem2").val();
        var dept = $("select#dept2").val();
        var batch = $("select#batch2").val();
        if(sem !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject2');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="batch2"]', function() {
   var sem = $("select#sem2").val();
        var dept = $("select#dept2").val();
        var batch = $("select#batch2").val();
        if(sem !== 'null' && dept !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject2');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="sem3"]', function() {
   var sem = $("select#sem3").val();
        var dept = $("select#dept3").val();
         var batch = $("select#batch3").val();
        
        
        if(dept !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject3');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="dept3"]', function() {
   var sem = $("select#sem3").val();
        var dept = $("select#dept3").val();
        var batch = $("select#batch3").val();
        if(sem !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject3');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    $(document).on('change', '[id^="batch3"]', function() {
   var sem = $("select#sem3").val();
        var dept = $("select#dept3").val();
        var batch = $("select#batch3").val();
        if(sem !== 'null' && dept !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject3');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="sem4"]', function() {
   var sem = $("select#sem4").val();
        var dept = $("select#dept4").val();
        var batch = $("select#batch4").val();
        
        if(dept !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject4');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="dept4"]', function() {
   var sem = $("select#sem4").val();
        var dept = $("select#dept4").val();
        var batch = $("select#batch4").val();
        if(sem !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject4');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="batch4"]', function() {
   var sem = $("select#sem4").val();
        var dept = $("select#dept4").val();
        var batch = $("select#batch4").val();
        if(sem !== 'null' && dept !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#subject4');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="lsem1"]', function() {
   var sem = $("select#lsem1").val();
        var dept = $("select#ldept1").val();
         var batch = $("select#lbatch1").val();
        
        if(dept !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject1');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="ldept1"]', function() {
   var sem = $("select#lsem1").val();
        var dept = $("select#ldept1").val();
         var batch = $("select#lbatch1").val();
        if(sem !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject1');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    $(document).on('change', '[id^="lbatch1"]', function() {
   var sem = $("select#lsem1").val();
        var dept = $("select#ldept1").val();
         var batch = $("select#lbatch1").val();
        if(sem !== 'null' && dept !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject1');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="lsem2"]', function() {
   var sem = $("select#lsem2").val();
        var dept = $("select#ldept2").val();
        var batch = $("select#lbatch2").val();
        if(dept !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject2');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="ldept2"]', function() {
   var sem = $("select#lsem2").val();
        var dept = $("select#ldept2").val();
         var batch = $("select#lbatch2").val();
        if(sem !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject2');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    $(document).on('change', '[id^="lbatch2"]', function() {
   var sem = $("select#lsem2").val();
        var dept = $("select#ldept2").val();
         var batch = $("select#lbatch2").val();
        if(sem !== 'null' && dept !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject2');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="lsem3"]', function() {
   var sem = $("select#lsem3").val();
        var dept = $("select#ldept3").val();
        var batch = $("select#lbatch3").val();
        
        if(dept !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject3');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="ldept3"]', function() {
   var sem = $("select#lsem3").val();
        var dept = $("select#ldept3").val();
        var batch = $("select#lbatch3").val();
        if(sem !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject3');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="lbatch3"]', function() {
   var sem = $("select#lsem3").val();
        var dept = $("select#ldept3").val();
        var batch = $("select#lbatch3").val();
        if(sem !== 'null' && dept !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject3');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="lsem4"]', function() {
   var sem = $("select#lsem4").val();
        var dept = $("select#ldept4").val();
        var batch = $("select#lbatch4").val();
        
        if(dept !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject4');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="ldept4"]', function() {
   var sem = $("select#lsem4").val();
        var dept = $("select#ldept4").val();
        var batch = $("select#lbatch4").val();
        if(sem !== 'null' & batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject4');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="lbatch4"]', function() {
   var sem = $("select#lsem4").val();
        var dept = $("select#ldept4").val();
        var batch = $("select#lbatch4").val();
        if(sem !== 'null' & dept !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch :batch
        },function(response) {

        var select = $('#lsubject4');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    $(document).on('change', '[id^="lsem5"]', function() {
   var sem = $("select#lsem5").val();
        var dept = $("select#ldept5").val();
        var batch = $("select#lbatch5").val();
        
        if(dept !== 'null' && batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject5');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
    
    $(document).on('change', '[id^="ldept5"]', function() {
   var sem = $("select#lsem5").val();
        var dept = $("select#ldept5").val();
        var batch = $("select#lbatch5").val();
        if(sem !== 'null' & batch !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch
        },function(response) {

        var select = $('#lsubject5');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });
     $(document).on('change', '[id^="lbatch5"]', function() {
   var sem = $("select#lsem5").val();
        var dept = $("select#ldept5").val();
        var batch = $("select#lbatch5").val();
        if(sem !== 'null' & dept !=='null')
        {
        $.get('${pageContext.request.contextPath}/LabJsonServlet', {
                semester : sem, 
                department : dept,
                batch :batch
        },function(response) {

        var select = $('#lsubject5');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        
        });
    }
    
    
    });

 
 
 function dropdown() {
 
    var selectedIndexVal = document.getElementById("numbersub").selectedIndex;
    var selected =document.getElementById("numbersub").options[selectedIndexVal].value;
         
    callAjaxFunction(selected);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunction(index){
  var url="dropdowns.jsp?index="+index;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState  === 4) {
 
            updatepage(xmlHttp.responseText);
        }
 
    };
xmlHttp.send(url);
  }
 
/* Call back function of Ajax Response*/
function updatepage(response){
//alert(str);
document.getElementById("result").innerHTML = response;
}
    
function dropdownlab() {
 
    
     var selectedIndexVal = document.getElementById("numbersub").selectedIndex;
    var selected =document.getElementById("numbersub").options[selectedIndexVal].value;
    var selectedIndexVal1 = document.getElementById("numberlab").selectedIndex;
    var selected1 =document.getElementById("numberlab").options[selectedIndexVal1].value;  
    callAjaxFunctionlab(selected,selected1);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunctionlab(index,index1){
  var url="dropdownslab.jsp?index="+index+"&index1="+index1;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState === 4) {
 
            updatepagelab(xmlHttp.responseText);
        }
 
    };
xmlHttp.send(url);
  }
 
/* Call back function of Ajax Response*/
function updatepagelab(response){
//alert(str);
document.getElementById("resultlab").innerHTML = response;
}    
function drop1() {
 
    
     var selectedIndexVal = document.getElementById("numbersub").selectedIndex;
    var selected =document.getElementById("numbersub").options[selectedIndexVal].value;
    
    callAjaxFunctionlab(selected,selected1);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunctionlab(index,index1){
  var url="dropdownslab.jsp?index="+index+"&index1="+index1;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState === 4) {
 
            updatepagelab(xmlHttp.responseText);
        }
 
    };
xmlHttp.send(url);
  }
 
/* Call back function of Ajax Response*/
function updatepagelab(response){
//alert(str);
document.getElementById("resultlab").innerHTML = response;
}   
    </script>
    <!-- Custom CSS -->
	
		
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="subjectallocation.jsp">Subject Allocation</a>
 <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectallocation.jsp">Allocate</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectview.jsp">View</a></li> 
 </ul>
 </li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="courses/index.html">Attendance</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="memberships/index.html">Update Attendance</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="Attd.jsp">View Attendance</a>
	
</li>
</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Notes</a>
    <ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notes.jsp">View Notes</a></li>
	</ul></li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circular.jsp">Circular</a>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="cireveupdates.jsp">Department Uploads</a>
    </li>


<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marksreport.jsp">Mark Sheet</a>

</li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="studentanalysis.jsp">Student Analysis</a>

</li>
</ul>						</nav>
					</div>
				</div>
			</div>
		</header>


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
            <center>
<form action="${pageContext.request.contextPath}/subjectallocupdate" class="sky-form" method="post">
    <header>Subject Allocation</header>
    <fieldset>					
					<section>
						
            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Staff Name:</b></div>
                <label class="select">
            <select id="staff" name="staff">
                <%
                    //int i=Integer.parseInt(request.getParameter("val"));
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection connection = new dbcon().getConnection("cse");
              Statement statement = connection.createStatement();
                    
              ResultSet rs= statement.executeQuery("select staffid,staffname from staff_table");
                   
              String staffname,staffid = "";
                    
                    
              while(rs.next())
              {
                  staffname=rs.getString("staffname");
                  staffid = rs.getString("staffid");
                  
              
              %>
              <option value="<%=staffid%>"><%=staffname%></option>
              <% } %>
            </select>
                    <i></i>
                </label>
            </label>
            <br> <br>
            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Academic Year </b></div>
                <label class="select">
           
            <%    
          
         java.util.Date t = new java.util.Date();
         int year = t.getYear()+1900;
         
            %>
                    <select id="acyear" name="acyear" >
                <option value="0">select</option>
                <option value="<%=year%>-<%=year+1%>"><%=year%>-<%=year+1%></option>
                <option value="<%=year+1%>-<%=year+2%>"><%=year+1%>-<%=year+2%></option>
                <option value="<%=year+2%>-<%=year+3%>"><%=year+2%>-<%=year+3%></option>
                <option value="<%=year+3%>-<%=year+4%>"><%=year+3%>-<%=year+4%></option>
                <option value="<%=year+4%>-<%=year+5%>"><%=year+4%>-<%=year+5%></option>
            </select>
                    <i></i>
                    </label>
            </label>
                <br><br>
            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Enter the Number of Subjects: </b></div>
                <label class="select">
           
            <select id="numbersub" name="numbersub" onchange="dropdown();">
                <option value="0">select</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
                    <i></i>
                    </label>
            </label>
            <br> <br>
                
             <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Enter the Number of Labs:  </b></div>
                <label class="select">
            
            <select id="numberlab" name="numberlab" onchange="dropdownlab();">
                <option value="0">select</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
                    <i></i>
            <br> <br>
                </label></label>
           
                    <div id="result"></div>
            <!-- <div id="res1"></div> -->
            
                     <div id="resultlab"></div>
            
                    </section>       
             <div align="left">
            <input type="submit" id="submit" value="Submit" /></div>
            <br>
    </fieldset>
        </form></center>

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
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
</ul>			</nav>
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
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>