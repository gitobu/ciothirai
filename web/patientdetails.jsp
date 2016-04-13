<%-- 
    Document   : patientdetails
    Created on : Mar 10, 2016, 7:06:35 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>

<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
       <div id="header">
       <jsp:directive.include file="header.html"/>
        </div>
        
              <div id="nav">
                 <jsp:directive.include file="menubar.jsp"/>
</div>   
<div id="section"> 
    <hr>
    <c:set var="patient_id" value = "<%= request.getParameter("patient_id")%>"/>         
    <jsp:setProperty name="pa" property="patient_id" value="${patient_id}"/>
            <jsp:directive.include file="patientdata.jsp"/>
            <hr>
           <jsp:directive.include file="nextofkindata.jsp"/>
            <hr>
</div>
       
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>