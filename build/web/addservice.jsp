<%-- 
    Document   : addservice
    Created on : Jan 21, 2016, 5:18:28 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vi" class="com.clinic.Visit" scope="session" />

<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>

<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Visit for <%= pa.getFirst_name() %> <%= pa.getLast_name() %></title>
        <jsp:directive.include file="sqllink.jsp"/>
    </head>
    <body>
        <div id="header">
       <jsp:directive.include file="header.html"/>
        </div>
        
              <div id="nav">
                 <jsp:directive.include file="menubar.jsp"/>
</div>   
<div id="section"> 
        <c:set var="visit_id" value="<%= vi.getVisit_id() %>" />
            <c:set var="service_type_id" value="<%= request.getParameter("service_type_id")%>" />
           
            <sql:update dataSource="${snapshot}" var="result">
            insert into service (visit_id, service_type_id)
            values (${visit_id},  ${service_type_id})
            </sql:update> 
            
            <sql:query dataSource="${snapshot}" var="sd">
            SELECT service.service_type_id, service_type_no, service_type_description
            FROM service, service_type
            WHERE service.service_type_id = service_type.service_type_id
            AND visit_id = ${visit_id}
            </sql:query>
            
            <sql:query dataSource="${snapshot}" var="se">
            SELECT service_type_id, service_type_no, service_type_description
            FROM service_type
            ORDER BY service_type_description
            </sql:query>
            <hr>
             <jsp:directive.include file="patientdata.jsp"/>
           
            <hr>
           
            <jsp:directive.include file="visitdata.jsp"/>
            <hr>
            <form name="service" action="addservice.jsp" method="POST">
                
         <table border="0" cellpadding="10" >  
             <caption>
                 
            </caption>
             
                 <tr><th align="left"></th><td><input type="hidden" name="visit_id" value="<%= vi.getVisit_id() %>"> </td> </tr>
             
            
                 <tr><th align="left">Service Type </th><td> 
                <select name="service_type_id">
                  
                 <option value="">[Please select Service]</option>
             
                 <c:forEach var="row" items="${se.rows}">
                <option value="${row.service_type_id}">${row.service_type_description}</option>
  		</c:forEach> 
                </select> 
  
                     </td> 
             <td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
         
            </table>
            </form>
            
            <table border="0" cellpadding="10"  >
        
         <tr>
            <th>Service Number</th>
            <th>Description</th>
            <th>Edit</th>

         </tr>
         
         <c:forEach var="row" items="${sd.rows}">
         <tr>   
             <td><c:out value="${row.service_type_no}"/></td>
            <td><c:out value="${row.service_type_description}"/></td>

            
            <td><a href="<c:url value="patient.jsp?patient_id=${row.patient_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
         
         <form name="patient" action="prescription.jsp" method="POST">
            <input type="submit" value="Drugs">
      
         
            <input type="hidden" name="visit_id" value="<%= vi.getVisit_id() %>">
           
        
            
        </form>
            <jsp:directive.include file="buttonbar.jsp"/>
</div>
           <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div> 
    </body>
</html>
