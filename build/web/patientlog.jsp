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
        SELECT pa.patient_id, pa.patient_no, pa.first_name, pa.last_name, pa.date_of_birth, pa.gender, pa.national_id, pa.pin_no
        FROM patient pa 
        ORDER BY pa.last_name
        </sql:query>  
       
        <table border="1" cellpadding="10" align="center" >
         <caption><h2>Patient Log</h2></caption>
         <tr>
            <th>Patient Number</th>
            <th>First name</th>
            <th>Last name</th>
            <th>Date of birth</th>
            <th>Gender</th>
            <th>National Id</th>
            <th>PIN Number</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${pa_list.rows}">
         <tr>   
            <td><c:out value="${row.patient_no}"/></td>
            <td><c:out value="${row.first_name}"/></td>
            <td><c:out value="${row.last_name}"/></td>
            <td><c:out value="${row.date_of_birth}"/></td>
            <td><c:out value="${row.gender}"/></td>
            <td><c:out value="${row.national_id}"/></td>
            <td><c:out value="${row.pin_no}"/></td>
            
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

