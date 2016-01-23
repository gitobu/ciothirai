<%-- 
    Document   : servicedata
    Created on : Jan 23, 2016, 6:28:06 AM
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
        <sql:query dataSource="${snapshot}" var="se_list">
        select service_type.service_type_no, service_type.service_type_description
        from service, service_type
        where service.service_type_id = service_type.service_type_id
        and service.visit_id = <%= vi.getVisit_id() %>

        </sql:query>
        
        
        
        <table border="0" cellpadding="10"  >
        
         <tr>
             <th>Service_code:</th>
            <th>Service:</th>
           
            

         </tr>
         
         <c:forEach var="row" items="${se_list.rows}">
         <tr>   
             <td><c:out value="${row.service_type_no}"/></td>
             <td><c:out value="${row.service_type_description}"/></td>
           

            
            
         </tr>
         </c:forEach>
         </table>
    </body>
</html>


