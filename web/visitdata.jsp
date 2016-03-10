<%-- 
    Document   : visitdata
    Created on : Jan 23, 2016, 5:59:28 AM
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
            
        </style>
    </head>
    <body>
        <sql:query dataSource="${snapshot}" var="vi_list">
        select v.visit_id, v.visit_no, DATE_FORMAT(v.visit_date,'%d-%m-%Y') as visit_date, v.primary_complaint,  CONCAT(pr.first_name, ' ', pr.last_name) as practitioner, jt.job_title
        from visit v, provider pr, job_title jt
        where v.provider_id = pr.provider_id
        and pr.job_title_id = jt.job_title_id
        and v.visit_id = <%= vi.getVisit_id() %>
        </sql:query>
        
        
        <table border="0" cellpadding="10"  >
         
                <c:forEach var="row" items="${vi_list.rows}">     
                   
         <tr>
            <th>Visit Number:</th><td><a href="<c:url value="listservice.jsp?visit_id=${row.visit_id}"/>"><c:out value="${row.visit_no}"/></a></td><th align="left">Visit date:</th><td><c:out value="${row.visit_date}"/></td><th>Primary complaint:</th><td><c:out value="${row.primary_complaint}"/></td>
            <th>Practitioner:</th> <td><c:out value="${row.practitioner}"/></td>
            <th>Practitioner title:</th> <td><c:out value="${row.job_title}"/></td>
            
           
             </tr>
   
         </c:forEach>
         
         </table>
        
    </body>
</html>

