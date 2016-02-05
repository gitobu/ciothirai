<%-- 
    Document   : patientlog
    Created on : Jan 19, 2016, 1:22:47 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient log</title>
        <style type="text/css">
        th { background-color:#FFF;
	color:black;
	text-align:left}
	
        tr { background-color:white;
	color:black;
	text-align:left}
        table{
            font-family: verdana, Garamond;
            font-size: 10pt;
            border-color: #6d6f7b;
            border-style: double;
        }
            
        </style>
    </head>
    <body>
        <div id="header">
            <jsp:directive.include file="header.html"/>
        </div>
        <div id="nav">
            <jsp:directive.include file="menubar.jsp"/>
        </div>
        <div id="section">
        
        
        <sql:query dataSource="${snapshot}" var="pa_list">
        SELECT pa.patient_id, pa.patient_no, 
        case when pa.middle_name is null then CONCAT(pa.first_name,' ', pa.last_name)
        else
        CONCAT(pa.first_name,' ', pa.middle_name,' ', pa.last_name) end as patient_name, 
        DATE_FORMAT(pa.date_of_birth,'%d-%m-%Y') as date_of_birth, case when pa.gender = 1 then 'Male' else 'Female' end as patient_gender, pa.national_id, pa.pin_no, 
        case when pa.phone is null then 'N/A' else pa.phone end as phone_number
        FROM patient pa
        ORDER BY pa.last_name
        </sql:query>  
       
        <table border="0" cellpadding="10" align="center" >
         <caption><h2>Patient Log</h2></caption>
         <tr>
            <th>Patient Number</th>
            <th>Patient name</th>
           
            <th>Date of birth</th>
            <th>Gender</th>
            <th>National Id</th>
            <th>PIN Number</th>
            <th>Phone Number</th>
             <th>Visits</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${pa_list.rows}">
         <tr>   
            <td><c:out value="${row.patient_no}"/></td>
            <td><c:out value="${row.patient_name}"/></td>
            
            <td><c:out value="${row.date_of_birth}"/></td>
            <td><c:out value="${row.patient_gender}"/></td>
            <td><c:out value="${row.national_id}"/></td>
            <td><c:out value="${row.pin_no}"/></td>
            <td><c:out value="${row.phone_number}"/></td>
            <td><a href="<c:url value="listvisit.jsp?patient_id=${row.patient_id}"/>">Visits</a></td>
            <td><a href="<c:url value="patient.jsp?patient_id=${row.patient_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>

