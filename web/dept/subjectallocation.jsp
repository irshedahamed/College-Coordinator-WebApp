<%@page import="com.action.Find"%>
<%@page import="dbconnection.dbcon"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en-US">
    
     <% 
   String username = session.getAttribute("username").toString();
    
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
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
                
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
       
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
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
       
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
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
       
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
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
       
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear :ayear
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
       
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
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
        
        
        
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
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
        
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear :ayear
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
     
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
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
   
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
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
       
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null')
        {
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear : ayear
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
        
        var ayear =$("select#acyear").val();
        
        if(dept !== 'null' && batch !== 'null' && ayear !=='null'){
        $.get('${pageContext.request.contextPath}/JsonServlet', {
                semester : sem, 
                department : dept,
                batch : batch,
                ayear :ayear
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

$(document).on('change','.sbatch',function(e){
    var num=$(this)[0].id.substring(6);
        var batch=$("#batch"+num).val();
        var sec=$("#sec"+num).val();
        var sem=$("#sem"+num).val();
        var dept=$("#dept"+num).val();
        var subject=$("#subject"+num).val();
        var sbatch=$(this).val();
        var acyear=$("#acyear").val();
       
        var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
      
    var url="checkalloc.jsp?batch="+batch+"&sec="+sec+"&sem="+sem+"&dept="+dept+"&subject="+subject+"&sbatch="+sbatch+"&acyear="+acyear;
    
    xmlHttp.open('GET',url,true);
    xmlHttp.onreadystatechange=function(){
       // alert();
      if(this.readyState===4 && this.status===200){
          if(this.responseText.includes("true"))
              alert("This Subject is already allocated");
         
      }  
    };
    xmlHttp.send();
    
    
});



$(document).on('change','.lsbatch',function(e){
    var num=$(this)[0].id.substring(7);
        var batch=$("#lbatch"+num).val();
        var sec=$("#lsec"+num).val();
        var sem=$("#lsem"+num).val();
        var dept=$("#ldept"+num).val();
        var subject=$("#lsubject"+num).val();
        var sbatch=$(this).val();
        var acyear=$("#acyear").val();
       
        var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
      
    var url="checkalloc.jsp?batch="+batch+"&sec="+sec+"&sem="+sem+"&dept="+dept+"&subject="+subject+"&sbatch="+sbatch+"&acyear="+acyear;
    
    xmlHttp.open('GET',url,true);
    xmlHttp.onreadystatechange=function(){
       // alert();
      if(this.readyState===4 && this.status===200){
          if(this.responseText.includes("true"))
              alert("This Subject is already allocated");
         
      }  
    };
    xmlHttp.send();
    
    
});
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
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="subjectallocation.jsp">Subject Allocation</a>
 <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectallocation.jsp">Allocate</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectview.jsp">View</a></li> 
 </ul>
 </li>
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Elective Selection</a>
 <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectSelection.jsp">Assign</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="ElectiveView.jsp">View</a></li> 
 </ul>
 </li>
 
             <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Attendance</a>
<ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="YrAttendance.jsp">View Attendance</a></li>
	</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Notes</a>
    <ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notes.jsp">View Notes</a></li>
                 <li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesReport.jsp">Notes Report</a>
            </li>
	</ul></li>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="cireveupdates.jsp">Department Uploads</a>
    </li>


<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marksreport.jsp">Mark Sheet</a>

</li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="studentanalysis.jsp">Student Analysis</a>

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
              Connection connection = new dbcon().getConnection(Find.dept(username));
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
                <option value="<%=year-2-2000%>"><%=year-2%>-<%=year-1%></option>
                 <option value="<%=year-1-2000%>"><%=year-1%>-<%=year%></option>
                <option value="<%=year-2000%>"><%=year%>-<%=year+1%></option>
                <option value="<%=year+1-2000%>"><%=year+1%>-<%=year+2%></option>
                <option value="<%=year+2-2000%>"><%=year+2%>-<%=year+3%></option>
                <option value="<%=year+3-2000%>"><%=year+3%>-<%=year+4%></option>
                <option value="<%=year+4-2000%>"><%=year+4%>-<%=year+5%></option>
            </select>
                    <i></i>
                    </label>
            </label>
                <br><br>
                <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Sem </b></div>
                <label class="select">
           
      
                    <select id="sem" name="semister" >
                <option value="#">select</option>
                <option value="Odd">Odd</option>
                 <option value="Even">Even</option>
            </select>
                    <i></i>
                    </label>
            </label><br><br>
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
                     
                     <br><br>


                     <label class="input">
                                                    <div align="left" size="4px"><b>
                                                             College In charges: </b></div>
                     </label>
                      <div align="left" style="float: right;">
                                   
                                     <br>            <input type="checkbox" name="otherinc" value="Higher Studies Bureau">Higher Studies Bureau
                                     <br>            <input type="checkbox" name="otherinc" value="Quality Improvement Cell">Quality Improvement Cell
                                     <br>            <input type="checkbox" name="otherinc" value="Cultural">Cultural
                                     <br>            <input type="checkbox" name="otherinc" value="National Social Service Scheme">National Social Service Scheme
                                     <br>            <input type="checkbox" name="otherinc" value="Electrical System">Electrical System, UPS Incharge
                                     <br>            <input type="checkbox" name="otherinc" value="Library">Library
                                       <br>            <input type="checkbox" name="otherinc" value="Sports">Sports
                                     <br>            <input type="checkbox" name="otherinc" value="Reverse Osmosis">Reverse Osmosis
                                     <br>            <input type="checkbox" name="otherinc" value="Plumbing">Plumbing
                                     <br>            <input type="checkbox" name="otherinc" value="Purchase Committee">Purchase Committee
                     </div>        
                     <div align="left">
                         <br>   <input type="checkbox" name="otherinc" value="Principal">Principal     
                                      <br>       <input type="checkbox" name="otherinc" value="Academic Council">Academic Council     
                                     <br>         <input type="checkbox" name="otherinc" value="Discipline Committee">Discipline Committee     
                                     <br>          <input type="checkbox" name="otherinc" value="Controller of Examination">Controller of Examination     
                                     <br>           <input type="checkbox" name="otherinc" value="Youth RedCross">Youth RedCross
                                     <br>           <input type="checkbox" name="otherinc" value="Stationary &Stores">Stationary &Stores
                                     <br>            <input type="checkbox" name="otherinc" value="Training & Placement / IndustryInstitute Interaction">Training & Placement / Industry Institute Interaction
                                     <br>            <input type="checkbox" name="otherinc" value="Research & Development">Research & Development
                                     <br>            <input type="checkbox" name="otherinc" value="UPS & LCD Projectors">UPS & LCD Projectors
                                           <br>            <input type="checkbox" name="otherinc" value="Fire Extinguisher & Welding">Fire Extinguisher & Welding
                                   
                     </div>
                    
                     
                     
                     <br>
                     
                     <label class="input">
                                                    <div align="left" size="4px"><b>
                                                             Academic Committee Member : </b></div>
                     </label>
                     <div align="left">
                     <br><input type="checkbox" name="accommittee" value="Scrutinizing & Monitoring Committee for Academic Matters">Scrutinizing & Monitoring Committee for Academic Matters
<br><input type="checkbox" name="accommittee" value="Placement & Higher Studies Coordination Committee">Placement & Higher Studies Coordination Committee
<br><input type="checkbox" name="accommittee" value="Students Activities Coordination Committee">Students Activities Coordination Committee
<br><input type="checkbox" name="accommittee" value="Industry- Institute Interaction Cell">Industry- Institute Interaction Cell
<br><input type="checkbox" name="accommittee" value="Entrepreneurship Development Cell">Entrepreneurship Development Cell
<br><input type="checkbox" name="accommittee" value="Students Counselling & Grievance Redressal Committee">Students Counselling & Grievance Redressal Committee
<br><input type="checkbox" name="accommittee" value="Sports & Cultural Coordination Committee ">Sports & Cultural Coordination Committee
                     </div>
                     <br>
                            <label class="input">
                                                    <div align="left" size="4px"><b>
                                                             Department In charges: </b></div>
                     </label>
                     
                     
                     
        <div align="left" style="float:right;">             

<br><input type="checkbox" name="otherinc" value="Value Added Courses In-charge">Value Added Courses In-charge 
<br><input type="checkbox" name="otherinc" value="Model & University Exam Co-coordinator">Model & University Exam Co-coordinator  
<br><input type="checkbox" name="otherinc" value="Guest Lecture In-charge">Guest Lecture In-charge
<br><input type="checkbox" name="otherinc" value="Faculty Development Programme">Faculty Development Programme 
<br><input type="checkbox" name="otherinc" value="Workshop & Conference">Workshop & Conference
<br><input type="checkbox" name="otherinc" value="Students Project coordinator">Students Project coordinator
<br><input type="checkbox" name="otherinc" value="Library In-Charge">Library In-Charge
<br><input type="checkbox" name="otherinc" value="Cultural & Sports In-Charge">Cultural & Sports In-Charge
<br><input type="checkbox" name="otherinc" value="Symposium In-Charge">Symposium In-Charge
<br><input type="checkbox" name="otherinc" value="Industrial Visit In-Charge">Industrial Visit In-Charge 
<br><input type="checkbox" name="otherinc" value="Staff Attendance In-Charge">Staff Attendance In-Charge
<br><input type="checkbox" name="otherinc" value="Staff Log Book In-Charge">Staff Log Book In-Charge
        </div>
                     <div align="left">
                       <br><input type="checkbox" name="otherinc" value="Teaching Staff Affairs HOD">Teaching Staff Affairs HOD     
                        <br><input type="checkbox" name="otherinc" value="Lab/Workshop Non-Teaching Staff Affairs HOD">Lab/Workshop Non-Teaching Staff Affairs HOD    
                         <br><input type="checkbox" name="otherinc" value="Student Affairs HOD">Student Affairs HOD    
                        <br><input type="checkbox" name="otherinc" value="File In-charge"> File In-charge 
                        <br><input type="checkbox" name="otherinc" value="Placement Coordinator">Placement Coordinator
<br><input type="checkbox" name="otherinc" value="Scrutinizing Committee (Lab Manual & Question Bank)">Scrutinizing Committee (Lab Manual & Question Bank)
<br><input type="checkbox" name="otherinc" value="Magazine In-Charge">Magazine In-Charge 
<br><input type="checkbox" name="otherinc" value="Student Activities In-Charge">Student Activities In-Charge 
<br><input type="checkbox" name="otherinc" value="Time Table In-Charge">Time Table In-Charge 
<br><input type="checkbox" name="otherinc" value="Special Class In-Charge">Special Class In-Charge
<br><input type="checkbox" name="otherinc" value="Block Time Table & DCT Schedule">Block Time Table & DCT Schedule  

                               
                     </div>
                         
                         
                         
                            <br>
                            
                                   <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Councillor:  </b></div>
                <label class="select">
            <div align="left" size="2px"><b>
                                                             Dept:  </b></div>
                      <label class="select">
            <select id="cdept" name="cdept">
       
            
                       
                       <%=Find.getDeptHTMLContent() %>
               
           
            
            </select>
                      </label>
                    
                       <div align="left" size="2px"><b>
                                                             Batch:  </b></div>
                      <label class="select">
                    <select id="cbatch" name="cbatch">
            <%
                try
                {
                    Connection conbatch = new dbcon().getConnection("sjitportal");
                    Statement stmt = conbatch.createStatement();
                    ResultSet rsbatch=stmt.executeQuery("select batch from regulations");
                    String batch=null;
                    rs.beforeFirst();
                    while(rsbatch.next())
                    {
                        batch=rsbatch.getString("batch");
                %>
                <option value=<%=batch%>><%=batch%></option>
                <%
                }

                            if(stmt!=null)
                            stmt.close();
                              if(conbatch!=null)
                                ;//conbatch.close();
                %>
                
                
                <%
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    %>
               
                    </select></label>
       <div align="left" size="2px"><b>
      Section:  </b></div>
    <select id="section" name="csection" required>
                <option disabled selected>select</option>
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C">C</option>
                <option value="D">D</option>
            </select>
    
                    <i></i>
            <br> <br>
                </label></label>
                     <br>
                     
                                            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Any Other Incharges: </b></div>
                <label class="textarea">
           
                    <textarea rows="3" cols="30" name="allothers"></textarea>
                    <i></i>
                    </label>
            </label>              
            <br> <br>
            
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
			<div class="copy"></div>
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu">
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
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

</html>