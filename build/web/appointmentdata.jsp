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
        SELECT appointment_id, patient_id, service_date, service_type.service_type_description
        FROM appointment join service_type on appointment.service_type_id = service_type.service_type_id
        WHERE patient_id = <%= pa.getPatient_id() %>
        ORDER BY service_type.service_type_description
        </sql:query>
        
       <table border="0" cellpadding="10" >
         
         <tr>
            <th>Appointment Date</th>
            <th>Appointment purpose</th>
            
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${app_list.rows}">
         <tr>
            <td><c:out value="${row.service_date}"/></td>
            <td><c:out value="${row.service_type_description}"/></td>
           
            <td><a href="<c:url value="appointment.jsp?appointment_id=${row.appointment_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
           

         
        
    </body>
</html>


