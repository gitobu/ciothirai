<%-- 
    Document   : listvisit
    Created on : Jan 24, 2016, 6:43:44 AM
    Author     : Gitobu
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>




<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
    </head>
    <body>
       

        <sql:query dataSource="${snapshot}" var="vi_list">
        select v.visit_id, v.visit_no, DATE_FORMAT(v.visit_date,'%d-%m-%Y') as visit_date, v.primary_complaint,  CONCAT(pr.first_name, ' ', pr.last_name) as practitioner, jt.job_title
        from visit v, provider pr, job_title jt
        where v.provider_id = pr.provider_id
        and pr.job_title_id = jt.job_title_id
        and v.patient_id = <%= pa.getPatient_id() %>
        </sql:query>
        <c:forEach var="row" items="${vi_list.rows}">
        <c:set var="visit_id" value = "${row.visit_id}"/>
        
        </c:forEach>
        
        
           
        <font color="lightseagreen"><b>Patient Visit History</b></font>
         <table border="0" cellpadding="10"  >
             
         
         <tr>
            <th>Visit Number</th>
            <th>Visit date</th>
            <th>Primary complaint</th>
            <th>Practitioner</th>
            <th>Practitioner title</th>
           

         </tr>
         <c:forEach var="row" items="${vi_list.rows}">
         <tr>
            <td><a href="<c:url value="listservices.jsp?visit_id=${row.visit_id}"/>"><c:out value="${row.visit_no}"/></a></td>
            <td><c:out value="${row.visit_date}"/></td>         
            <td><c:out value="${row.primary_complaint}"/></td>
            <td><c:out value="${row.practitioner}"/></td>
            <td><c:out value="${row.job_title}"/></td>
         </tr>
         </c:forEach>
         </table>

    </body>
</html>

