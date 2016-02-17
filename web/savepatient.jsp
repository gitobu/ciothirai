<%-- 
    Document   : savepatient
    Created on : Jan 19, 2016, 1:02:36 AM
    Author     : Gitobu
--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:directive.include file="sqllink.jsp"/>


<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>
<jsp:useBean id="pia" class="com.clinic.Patient" scope="session"/>
<jsp:useBean id="now" class="java.util.Date" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kenya Clinic: New Patient</title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
    function validateFormValues(){
	
	
       if (document.patient.first_name.value === ""){
		alert('Please enter first name');
		return false;} 
        if (document.patient.last_name.value === ""){
		alert('Please enter last name');
		return false;} 
         if (document.patient.gender.value === ""){
		alert('Please select patient gender');
		return false;} 
			else
		{
			return true;
		}
    }
    </script>
    
    </head>
    <body>
  <div id="header">
       <jsp:directive.include file="header.html"/>
        </div>
        
              <div id="nav">
                 <jsp:directive.include file="menubar.jsp"/>
</div>   
<div id="section">
      <c:set var="edit_mode" value="${not empty param.patient_id}"></c:set>   
      <c:set var="new_mode" value="${ empty param.patient_id}"></c:set> 
      
      
      <c:choose>
        <c:when test='${edit_mode}'>
          
            <c:set var="patient_id" value = "<%= request.getParameter("patient_id")%>"/> 
            <c:set var="patient_no" value = "<%= request.getParameter("patient_no")%>"/> 
            <c:set var="first_name" value = "<%= request.getParameter("first_name")%>"/> 
            <c:set var="middle_name" value = "<%= request.getParameter("middle_name")%>"/> 
            <c:set var="last_name" value = "<%= request.getParameter("last_name")%>"/> 
            <c:set var="date_of_birth" value = "<%= request.getParameter("date_of_birth")%>"/> 
            <c:set var="gender" value = "<%= request.getParameter("gender")%>"/> 
            <c:set var="national_id" value = "<%= request.getParameter("national_id")%>"/> 
            <c:set var="pin_no" value = "<%= request.getParameter("pin_no")%>"/> 
            <c:set var="phone" value = "<%= request.getParameter("phone")%>"/> 
            
            <sql:update dataSource="${snapshot}" var="result">
            update patient set first_name = '${first_name}', last_name = '${last_name}', middle_name = '${middle_name}', date_of_birth = '${date_of_birth}', gender = ${gender}, national_id = '${national_id}', pin_no = '${pin_no}', phone = '${phone}'
            where patient_id  = ${patient_id}
            </sql:update>  

        </c:when>
        <c:when test='${new_mode}'> 
            <sql:query dataSource="${snapshot}" var="pa">
            select Max(patient_id) +1 as patient_id, CONCAT('PT', max(substr(patient_no,3,5)) + 1) as pa_no 
            FROM patient
            </sql:query>

            <c:forEach var="row" items="${pa.rows}">
                <c:set var="pa_no" value = "${row.pa_no}" />
                <c:set var="patient_id" value = "${row.patient_id}" />
            </c:forEach>   

            <c:set var="first_name" value = "<%= request.getParameter("first_name")%>"/> 
            <c:set var="middle_name" value = "<%= request.getParameter("middle_name")%>"/> 
            <c:set var="last_name" value = "<%= request.getParameter("last_name")%>"/> 
            <c:set var="date_of_birth" value = "<%= request.getParameter("date_of_birth")%>"/> 
            <c:set var="vday" value="${fn:substring(date_of_birth, 0, 2)}"/>
            <c:set var="vmonth" value="${fn:substring(date_of_birth, 3, 5)}"/>
            <c:set var="vyear" value="${fn:substring(date_of_birth, 6, 10)}"/>
            <c:set var="dash" value="-"/>
            <c:set var="dob" value="${vyear}${dash}${vmonth}${dash}${vday}"/>
            <c:set var="gender" value = "<%= request.getParameter("gender")%>"/> 
            <c:set var="national_id" value = "<%= request.getParameter("national_id")%>"/> 
            <c:set var="pin_no" value = "<%= request.getParameter("pin_no")%>"/>
            <c:set var="phone" value = "<%= request.getParameter("phone")%>"/>
            
            <sql:update dataSource="${snapshot}" var="result">
            insert into patient (patient_no, first_name, middle_name, last_name, date_of_birth, gender, national_id, pin_no, phone)
            values ('${pa_no}', '${first_name}','${middle_name}','${last_name}', '${dob}', ${gender}, '${national_id}', '${pin_no}','${phone}')
            </sql:update>   
            
       
      
            <jsp:setProperty name="pia" property="patient_id" value="${patient_id}"/>
            <jsp:setProperty name="pia" property="patient_no" value="${pa_no}"/>
            <jsp:setProperty name="pia" property="first_name" value="${first_name}"/>
            <jsp:setProperty name="pia" property="middle_name" value="<${middle_name}"/> 
            <jsp:setProperty name="pia" property="last_name" value="<${last_name}"/>   
            <jsp:setProperty name="pia" property="vday" value="${fn:substring(date_of_birth, 1, 2)}"/>
            <jsp:setProperty name="pia" property="vmonth" value="${fn:substring(date_of_birth, 1, 2)}"/>
            <jsp:setProperty name="pia" property="vyear" value="${fn:substring(date_of_birth, 1, 2)}"/>
            <jsp:setProperty name="pia" property="gender" value="${gender}"/>
            <jsp:setProperty name="pia" property="national_id" value="${national_id}"/>
            <jsp:setProperty name="pia" property="pin_no" value="${pin_no}"/>
            <jsp:setProperty name="pia" property="phone" value="${phone}"/>    
    </c:when>
    </c:choose>
               
      
        <sql:query dataSource="${snapshot}" var="pa_list">
        SELECT pat.patient_id, pat.patient_no, pat.first_name, pat.middle_name, pat.last_name, DATE_FORMAT(pat.date_of_birth,'%d-%m-%Y') as date_of_birth, 
        case 
            when pat.gender = 1 then 'Female'
            when pat.gender = 2 then 'Male' 
        end as gender,
        pat.national_id, pat.pin_no, pat.phone
        FROM patient pat 
        <c:choose>
        <c:when test='${edit_mode}'>
            WHERE pat.patient_id = <%= pa.getPatient_id() %>
        </c:when>
         <c:when test='${new_mode}'> 
            WHERE pat.patient_id =  <%= pia.getPatient_id() %>
         </c:when>
        </c:choose>
        ORDER BY pat.last_name
        </sql:query>
     
         <table border="0" cellpadding="10" align="center">
             <c:forEach var="row" items="${pa_list.rows}">
             <tr><th>Patient Number</th><td><c:out value="${row.patient_no}"/></td></tr>
             <tr><th>First Name</th><td><c:out value="${row.first_name}"/></td></tr>
             <tr><th>Middle Name</th><td><c:out value="${row.middle_name}"/></td></tr>
             <tr><th>Last Name</th><td><c:out value="${row.last_name}"/></td></tr>
             <tr><th>Date of Birth</th><td><c:out value="${row.date_of_birth}"/></td></tr>
             <tr><th>Gender</th><td><c:out value="${row.gender}"/></td></tr>
             <tr><th>National Id</th><td><c:out value="${row.national_id}"/><td></td></tr>
             <tr><th>Pin Number</th><td><c:out value="${row.pin_no}"/></td></tr>
             <tr><th>Phone Number</th><td><c:out value="${row.phone}"/></td></tr>
             <tr><th>Update</th><td><a href="<c:url value="patient.jsp?patient_id=${row.patient_id}"/>">Edit</a></td></tr>
               </c:forEach>
         </table>
        
    
         
         <form name="patient" action="visit.jsp" method="POST">
            <input type="submit" value="Patient visit">
             
       
          
            
            
            <c:choose>
        <c:when test='${edit_mode}'>
            <input type="hidden" name="patient_id" value="<%= pa.getPatient_id() %>">
           
        </c:when>
         <c:when test='${new_mode}'> 
           <input type="hidden" name="patient_id" value="<%= pia.getPatient_id() %>">
         </c:when>
        </c:choose>
            
            
        </form>

        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>



