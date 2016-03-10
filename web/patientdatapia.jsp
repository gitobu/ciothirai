<%-- 
    Document   : patientdatapia
    Created on : Mar 6, 2016, 6:20:35 AM
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
        case when pa.phone is null then 'N/A' else pa.phone end as phone_number
        FROM patient pa 
        WHERE patient_id = <%= pia.getPatient_id() %>
        </sql:query>
        <sql:query dataSource="${snapshot}" var="nok_list">
        select p.patient_id, CONCAT(p.first_name,' ', p.last_name) as patient, CONCAT(pr.first_name,' ', pr.last_name) as next_of_kin,  r.relationship, pr.phone, p.national_id, 
        case 
                    when pr.gender = 1 then 'Female'
                    when pr.gender = 2 then 'Male' 
                end as gender
        from  next_of_kin nok inner join  patient p on (nok.patient_id = p.patient_id and p.patient_id = <%= pia.getPatient_id() %>)
        inner join patient pr on nok.kin_patient_id = pr.patient_id
        inner join relationship r on nok.relationship_id = r.relationship_id
        </sql:query>
        &nbsp; 
        <h4>Patient Information</h4>
        <hr>
        <table border="0" cellpadding="10" align="center" >
         
                <c:forEach var="row" items="${pa_list.rows}">     
                   
         <tr>
            <th>Patient Number:</th><td><c:out value="${row.patient_no}"/></td><th align="left">Name:</th><td><c:out value="${row.patient_name}"/></td><th>Date of birth:</th><td><c:out value="${row.date_of_birth}"/></td>
            <th>Gender:</th> <td><c:out value="${row.patient_gender}"/></td>
            <th>Phone Number:</th> <td><c:out value="${row.phone_number}"/></td>
            
            <tr>
             <th>National Id</th><td><c:out value="${row.national_id}"/></td><th>PIN Number</th><td><c:out value="${row.pin_no}"/></td></tr>
    
         </c:forEach>
         
         </table>
        <h4>Next of Kin</h4>
        <hr>
        <table border="0" cellpadding="10"  >
        
         <tr>
             <th>Name:</th>
            <th>Relationship:</th>
           <th>Phone:</th>
           <th>National Id:</th>
           <th>Gender:</th>
         </tr>
         
         <c:forEach var="row" items="${nok_list.rows}">
         <tr>   
             <td><c:out value="${row.next_of_kin}"/></td>
             <td><c:out value="${row.relationship}"/></td>
             <td><c:out value="${row.phone}"/></td>
             <td><c:out value="${row.national_id}"/></td>
             <td><c:out value="${row.gender}"/></td>
         </tr>
         </c:forEach>
         </table>
        
    </body>
</html>
