<%-- 
    Document   : patientdata
    Created on : Jan 22, 2016, 9:12:40 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>

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
        <sql:query dataSource="${snapshot}" var="pa_list">
        SELECT pa.patient_id, pa.patient_no, 
        case when pa.middle_name is null then CONCAT(pa.first_name,' ', pa.last_name)
        else
        CONCAT(pa.first_name,' ', pa.middle_name,' ', pa.last_name) end as patient_name, 
        DATE_FORMAT(pa.date_of_birth,'%d-%m-%Y') as date_of_birth, case when pa.gender = 1 then 'Male' else 'Female' end as patient_gender, pa.national_id, pa.pin_no, 
        case when pa.phone is null then 'N/A' else pa.phone end as phone_number, pa.county, pa.location, pa.village
        FROM patient pa 
        WHERE patient_id = <%= pa.getPatient_id() %>
        </sql:query>
        
      
        
        <table border="0" cellpadding="10">
         
                <c:forEach var="row" items="${pa_list.rows}">     
                   
         <tr>
            <th>Patient Number:</th><td><c:out value="${row.patient_no}"/></td><th align="left">Name:</th><td><c:out value="${row.patient_name}"/></td><th>Date of birth:</th><td><c:out value="${row.date_of_birth}"/></td>
            <th>Gender:</th> <td><c:out value="${row.patient_gender}"/></td>
            <th>Phone Number:</th> <td><c:out value="${row.phone_number}"/></td>
            
            <tr>
             <th>National Id</th><td><c:out value="${row.national_id}"/></td><th>PIN Number</th><td><c:out value="${row.pin_no}"/></td>
             <th>County</th> <td><c:out value="${row.county}"/></td> <th>Location</th> <td><c:out value="${row.location}"/></td> <th>Village</th> <td><c:out value="${row.village}"/></td>
            </tr>
            
          
         </c:forEach>
         
         </table>
        
    </body>
</html>
