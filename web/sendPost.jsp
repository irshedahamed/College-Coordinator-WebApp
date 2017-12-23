<%-- 
    Document   : sendPost
    Created on : 29 Jan, 2017, 4:22:03 PM
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
    <script LANGUAGE="JavaScript">
        function sendPost()
        {

            document.sendpost.submit();
        }
    </script>
    <body onload="sendPost();" >

        <form method="post" name="sendpost" action="<%=request.getParameter("RUrl")%> ">

        </form>
    </body></HTML>