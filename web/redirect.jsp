<%-- 
    Document   : sms.jsp
    Created on : 12 Nov, 2016, 4:04:56 PM
    Author     : Home
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
response.setStatus(301);
String url=request.getParameter("url");
//System.out.println(url);
response.setHeader( "Location", url);
response.setHeader( "Connection", "close" );
%>
