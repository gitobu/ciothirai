<%-- 
    Document   : listvisit
    Created on : Jan 24, 2016, 6:43:44 AM
    Author     : Gitobu
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>

<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
       
<div id="header">
       <jsp:directive.include file="header.html"/>
        </div>
        
              <div id="nav">
                 <jsp:directive.include file="menubar.jsp"/>
</div>   
<div id="section"> 
    
        <c:set var="patient_id" value = "${param.patient_id}"/>
           
        <sql:query dataSource="${snapshot}" var="pa_data">
        SELECT pa.patient_id, pa.patient_no, pa.first_name, pa.middle_name, pa.last_name, pa.date_of_birth, pa.gender, pa.national_id, pa.pin_no, pa.phone
        FROM patient pa 
        WHERE pa.patient_id = ${patient_id}
        </sql:query>       

        <c:forEach var="row" items="${pa_data.rows}">
        <c:set var="patient_id" value = "${row.patient_id}"/>
        <c:set var="patient_no" value = "${row.patient_no}"/>
        <c:set var="first_name" value = "${row.first_name}"/>
        <c:set var="middle_name" value = "${row.middle_name}"/>
        <c:set var="last_name" value = "${row.last_name}"/>
        
        <c:set var="gender" value = "${row.gender}"/>
        <c:set var="national_id" value = "${row.national_id}"/>
        <c:set var="pin_no" value = "${row.pin_no}"/>
        <c:set var="phone" value = "${row.phone}"/>

        </c:forEach> 

        <jsp:setProperty name="pa" property="patient_id" value="${patient_id}"/>
        <jsp:setProperty name="pa" property="patient_no" value="${patient_no}"/>
        <jsp:setProperty name="pa" property="first_name" value="${first_name}"/>
        <jsp:setProperty name="pa" property="middle_name" value="${middle_name}"/>
        <jsp:setProperty name="pa" property="last_name" value="${last_name}"/>
       
        <jsp:setProperty name="pa" property="gender" value="${gender}"/>
        <jsp:setProperty name="pa" property="national_id" value="${national_id}"/>
        <jsp:setProperty name="pa" property="pin_no" value="${pin_no}"/>
        <jsp:setProperty name="pa" property="phone" value="${phone}"/>
            
             
        
            <hr>
            <jsp:directive.include file="patientdata.jsp"/>
            <hr>
            
            
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
        
        <table border="0" cellpadding="10"  >
         
                <c:forEach var="row" items="${vi_list.rows}">     
                   
         <tr>
            <th>Visit Number:</th><td><a href="<c:url value="listservice.jsp?visit_id=${row.visit_id}"/>"><c:out value="${row.visit_no}"/></a></td><th align="left">Visit date:</th><td><c:out value="${row.visit_date}"/></td><th>Primary complaint:</th><td><c:out value="${row.primary_complaint}"/></td>
            <th>Practitioner:</th> <td><c:out value="${row.practitioner}"/></td>
            <th>Practitioner title:</th> <td><c:out value="${row.job_title}"/></td>
            
           
             </tr>
   
         </c:forEach>
         
         </table>
        
         
</div>
       
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>

