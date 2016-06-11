<%-- 
    Document   : appointmentschedule
    Created on : Jun 7, 2016, 9:34:20 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <sql:query dataSource="${snapshot}" var="sch_list">
        select appointment.appointment_id, patient.patient_id, patient.patient_no, patient.first_Name, patient.last_Name, DATE_FORMAT(appointment.service_date,'%d-%m-%Y') as apt_date, service_type.service_type_description, CONCAT(provider.first_name,' ', provider.last_name) provider 
        from appointment join patient on appointment.patient_id = patient.patient_id
        join service_type on appointment.service_type_id = service_type.service_type_id
        left join provider on appointment.provider_id = provider.provider_id
        where appointment.service_date >= sysdate() and appointment.appointment_status = 0
        order by appointment.service_date;
        </sql:query>
        
        
        
        <table border="0" cellpadding="10" >
            <caption><h3><font color="lightseagreen"><b>Upcoming Appointments</b></font></h3></caption>
         <tr>
            <th>Patient Number</th>
            <th>First name</th>
            <th>Last Name</th>
            <th>Appointment date</th>
            <th>Purpose</th>
            <th>Scheduled physician</th>
            <th>Update</th>
            <th>Cancel</th>

         </tr>
         <c:forEach var="row" items="${sch_list.rows}">
         <tr>
            
            <td><a href="<c:url value="patientdetails.jsp?patient_id=${row.patient_id}"/>"><c:out value="${row.patient_no}"/></a></td>
            <td><c:out value="${row.first_name}"/></td>
            <td><c:out value="${row.last_name}"/></td>
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
