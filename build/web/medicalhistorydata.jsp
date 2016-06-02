<%-- 
    Document   : medicalhistorydata
    Created on : May 21, 2016, 10:27:45 AM
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
        <sql:query dataSource="${snapshot}" var="mh">
        SELECT medical_history_id, patient_id, time_period, issue, how_treated, current_status
        FROM medical_history  
        WHERE patient_id = <%= pa.getPatient_id() %>
        </sql:query>
        
        <font color="lightseagreen"><b>Medical History</b></font>
       <table border="0" cellpadding="10" >
        
         <tr>
            <th>Time period</th>
            <th>Issue</th>
            <th>How treated</th>
            <th>How feeling now</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${mh.rows}">
         <tr>
            <td><c:out value="${row.time_period}"/></td>
            <td><c:out value="${row.issue}"/></td>
            <td><c:out value="${row.how_treated}"/></td>
             <td><c:out value="${row.current_status}"/></td>
            <td><a href="<c:url value="medicalhistory.jsp?medical_history_id=${row.medical_history_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
           

         
        
    </body>
</html>

