<%-- 
    Document   : appointmentdata
    Created on : May 22, 2016, 9:21:17 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>

<jsp:useBean id="app" class="com.clinic.Appointment" scope="session"/>
<!DOCTYPE html>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            
        th { background-color:#FFF;
	color:black;
	text-align:left}
	
        tr { background-color:white;
	color:black;
	text-align:left}
        hr { 
        display: block;
        margin-top: 0.5em;
        margin-bottom: 0.5em;
        margin-left: auto;
        margin-right: auto;
        border-style: inset;
        border-width: 1px;
        } 
         
        </style>
    </head>
    <body>
        
        <sql:query dataSource="${snapshot}" var="app_list">
       
        SELECT appointment_id, patient_id, DATE_FORMAT(appointment.service_date,'%d-%m-%Y') as apt_date, service_type.service_type_description, CONCAT(provider.first_name,' ', provider.last_name) provider 
        FROM appointment join service_type on appointment.service_type_id = service_type.service_type_id
        left join provider on appointment.provider_id = provider.provider_id
        WHERE patient_id = <%= pa.getPatient_id() %> and appointment.appointment_status = 0
        ORDER BY service_type.service_type_description
        </sql:query>
        
       <table border="0" cellpadding="10" >
         
         <tr>
            
            <th>Appointment date</th>
            <th>Purpose</th>
            <th>Scheduled physician</th>
            <th>Update</th>
            <th>Cancel</th>
            

         </tr>
         <c:forEach var="row" items="${app_list.rows}">
         <tr>
            
            <td><c:out value="${row.apt_date}"/></td>
            <td><c:out value="${row.service_type_description}"/></td>
            <td><c:out value="${row.provider}"/></td>
            <td><a href="<c:url value="appointment.jsp?appointment_id=${row.appointment_id}"/>">Edit</a></td>
            <td><a href="<c:url value="cancelappointment.jsp?appointment_id=${row.appointment_id}"/>">Cancel appointment</a></td>
         </tr>
         </c:forEach>
         </table>
           

         
        
    </body>
</html>


