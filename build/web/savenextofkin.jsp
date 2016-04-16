<%-- 
    Document   : savenextofkin
    Created on : Mar 5, 2016, 9:52:55 AM
    Author     : Gitobu
--%>


<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:directive.include file="sqllink.jsp"/>


<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>
<jsp:useBean id="pia" class="com.clinic.Patient" scope="session"/>
<jsp:useBean id="rs" class="com.clinic.Relationship" scope="session"/>
<jsp:useBean id="now" class="java.util.Date" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kenya Clinic: New Patient</title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="tcal.css" />
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
    <script type="text/javascript" src="tcal.js">
        
       
    
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
            <c:set var="phone" value = "<%= request.getParameter("phone")%>" /> 
            
            <c:set var="relationship_id" value = "<%= request.getParameter("relationship_id")%>"/> 
            
            <jsp:setProperty name="rs" property="relationship_id" value="${relationship_id}"/>
            
            <sql:update dataSource="${snapshot}" var="result">
            insert into patient (patient_no, first_name, middle_name, last_name, date_of_birth, gender, national_id, pin_no, phone)
            values ('${pa_no}', '${first_name}','${middle_name}','${last_name}', '${dob}', ${gender}, '${national_id}', '${pin_no}','${phone}')
            </sql:update>   
            
            <c:set var="v_patient_id" value="<%= pa.getPatient_id() %>"/>
            
            <c:set var="v_relationship_id" value="<%= rs.getRelationship_id() %>"/>
                
            <sql:update dataSource="${snapshot}" var="result">
            insert into next_of_kin (patient_id, kin_patient_id, relationship_id) 
            values (${v_patient_id}, ${patient_id}, ${v_relationship_id})
            </sql:update>
       <sql:query dataSource="${snapshot}" var="rel">
    select relationship_id, relationship 
    from relationship
    order by relationship_id
    </sql:query> 
           
          <jsp:directive.include file="patientdata.jsp"/>
          <hr>
          <jsp:directive.include file="nextofkindata.jsp"/>
          
      <%-- Add next of kin --%>  
    &nbsp;
      <h4>Next of Kin Information</h4>
      <hr>
     <form name="nextofkin" action="savenextofkin.jsp" method="POST">
          <table border="0" cellpadding="10">  
            
             
         
           <tr><th align="left">First name</th><td><input type="text" name="first_name" ></td> 
            <th align="left">Middle name</th><td><input type="text" name="middle_name" ></td> </tr>
             <tr><th align="left">Last name</th><td><input type="text" name="last_name" ></td> 
            <th align="left">Date of birth</th><td><input type="text" name="date_of_birth" class="tcal" value=""></td></tr>          
             <tr><th align="left">Gender</th><td><input type="radio" name="gender" value="1">Female<input type="radio" name="gender" value="2">Male</td> 
             <th align="left">National Id</th><td><input type="text" name="national_id" ></td> </tr>
             <tr><th align="left">PIN Number</th><td><input type="text" name="pin_no" ></td> 
             <th align="left">Phone Number</th><td><input type="text" name="phone" ></td> </tr>
              
              <tr><th align="left">Relationship to patient</th>
                  <td>
             <select name="relationship_id">
                  
                 <option value="">[Please select relationship]</option>
             
                 <c:forEach var="row" items="${rel.rows}">
                <option value="${row.relationship_id}">${row.relationship}</option>
  		</c:forEach> 
                </select> 
                  </td> 
             <tr><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
     
         <%-- Add Visit --%>  
         <form name="patient" action="visit.jsp" method="POST">
            <input type="submit" value="Patient visit">
             
       
          
            
       
          <input type="hidden" name="patient_id" value="<%= pa.getPatient_id() %>">
        </form>

        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>



