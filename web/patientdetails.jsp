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
     <sql:query dataSource="${snapshot}" var="pat_data">
        SELECT patient_id, first_name, last_name
        FROM patient
        WHERE patient_id = ${patient_id}
        </sql:query>
        <c:forEach var="row" items="${pat_data.rows}">
             <c:set var="patient_id" value = '${row.patient_id}'/>
             <c:set var="first_name" value = '${row.first_name}'/>
             <c:set var="last_name" value = '${row.last_name}'/>
         
         <jsp:setProperty name="pa" property="patient_id" value="${patient_id}"/>
        <jsp:setProperty name="pa" property="first_name" value="${first_name}"/>
        <jsp:setProperty name="pa" property="last_name" value="${last_name}"/>
    
    </c:forEach>
            <jsp:directive.include file="patientdata.jsp"/>
            <hr>
           <jsp:directive.include file="nextofkindata.jsp"/>
            <hr>
            <jsp:directive.include file="medicalhistorydata.jsp"/>
            <hr>
             
           <jsp:directive.include file="listvisit.jsp"/>
              <hr>
              <font color="lightseagreen"><b>Appointments</b></font>
             <jsp:directive.include file="appointmentdata.jsp"/> 
            
              <jsp:directive.include file="buttonbar.jsp"/>
            
</div>
       
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>