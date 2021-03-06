<%-- 
    Document   : listpatient
    Created on : Jan 23, 2016, 10:31:55 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
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
        <c:set var="patient_id" value = "<%= request.getParameter("patient_id")%>"/>
        
        <jsp:setProperty name="pa" property="patient_id" value="${patient_id}"/>
        
        <c:set var="criteria" value="<%= request.getParameter("method")%>" />
        <c:set var="search_string" value="<%= request.getParameter("search")%>" />
         
        <sql:query dataSource="${snapshot}" var="pa_list">
        SELECT pa.patient_id, pa.patient_no, 
        case when pa.middle_name is null then CONCAT(pa.first_name,' ', pa.last_name)
        else
        CONCAT(pa.first_name,' ', pa.middle_name,' ', pa.last_name) end as patient_name, 
        DATE_FORMAT(pa.date_of_birth,'%d-%m-%Y') as date_of_birth, case when pa.gender = 2 then 'Male' else 'Female' end as patient_gender, pa.national_id, pa.pin_no, 
        case when pa.phone is null then 'N/A' else pa.phone end as phone_number
        FROM patient pa
        
        <c:choose>
            <c:when test="${criteria == 1}">
        WHERE   pa.national_id like '%${search_string}%'     
            </c:when>
            <c:when test="${criteria == 2}">
        WHERE   pa.phone like '%${search_string}%'         
            </c:when>
            <c:when test="${criteria == 3}">
        WHERE   pa.patient_no like '%${search_string}%'         
            </c:when>
            <c:when test="${criteria == 4}">
        WHERE   pa.last_name like '%${search_string}%'         
            </c:when>  
        </c:choose>
        
        
        ORDER BY pa.last_name
        </sql:query>  
       
        <table border="0" cellpadding="10">
         <caption><h2>Patient Log</h2></caption>
         <tr>
            <th>Patient Number</th>
            <th>Patient name</th>
           
            <th>Date of birth</th>
            <th>Gender</th>
            <th>National Id</th>
            <th>PIN Number</th>
            <th>Phone Number</th>
            

         </tr>
         <c:forEach var="row" items="${pa_list.rows}">
         <tr>   
            <td><a href="<c:url value="patientdetails.jsp?patient_id=${row.patient_id}"/>"><c:out value="${row.patient_no}"/></a></td>
            <td><c:out value="${row.patient_name}"/></td>
            
            <td><c:out value="${row.date_of_birth}"/></td>
            <td><c:out value="${row.patient_gender}"/></td>
            <td><c:out value="${row.national_id}"/></td>
            <td><c:out value="${row.pin_no}"/></td>
            <td><c:out value="${row.phone_number}"/></td>
            
         </tr>
         </c:forEach>
         </table>
        
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>


