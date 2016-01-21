<%-- 
    Document   : test
    Created on : Jan 21, 2016, 5:34:24 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vi" class="com.clinic.Visit" scope="session" />
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
            
        <sql:query dataSource="${snapshot}" var="sid">
            SELECT max(visit_id) as visit_id
            FROM visit
        
            </sql:query>
            
            <c:forEach var="row" items="${sid.rows}">
                <c:set var="visit_id" value = "${row.visit_id}" />
            </c:forEach>
            
            <jsp:setProperty name="vi" property="visit_id" value="${visit_id}"/>
            
            <%= vi.getVisit_id() %>
    </body>
</html>
