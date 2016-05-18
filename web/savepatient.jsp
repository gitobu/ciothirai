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
    <link rel="stylesheet" type="text/css" href="tcal.css" />
     <script type="text/javascript" src="tcal.js">
    function validateFormValues(){
	
	
       if (document.nextofkin.first_name.value === ""){
		alert('Please enter first name');
		return false;} 
        if (document.nextofkin.last_name.value === ""){
		alert('Please enter last name');
		return false;} 
         if (document.nextofkin.gender.value === ""){
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
            
            <c:set var="county" value = "<%= request.getParameter("county")%>"/>
            <c:set var="location" value = "<%= request.getParameter("location")%>"/>
            <c:set var="village" value = "<%= request.getParameter("village")%>"/>
            <c:set var="referred" value = "<%= request.getParameter("referred")%>"/>
            <c:set var="affiliation" value = "<%= request.getParameter("affiliation")%>"/>
            <c:set var="is_member" value = "<%= request.getParameter("is_member")%>"/>
            
            <sql:update dataSource="${snapshot}" var="result">
            update patient set first_name = '${first_name}', 
            last_name = '${last_name}', 
            middle_name = '${middle_name}', 
            date_of_birth = '${date_of_birth}', 
            gender = ${gender}, 
            national_id = '${national_id}', 
            pin_no = '${pin_no}', 
            phone = '${phone}',
            county = '${county}',
            location = '${location}',
            village = '${village}',
            referred = '${referred}',
            affiliation = '${affiliation}',
            is_member = '${is_member}'
            where patient_id  = ${patient_id}
            </sql:update>  

        </c:when>
        <c:when test='${new_mode}'> 
            <sql:query dataSource="${snapshot}" var="pat">
            select Max(patient_id) +1 as patient_id, CONCAT('PT', max(substr(patient_no,3,5)) + 1) as pa_no 
            FROM patient
            </sql:query>

            <c:forEach var="row" items="${pat.rows}">
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
            
            <c:set var="county" value = "<%= request.getParameter("county")%>"/>
            <c:set var="location" value = "<%= request.getParameter("location")%>"/>
            <c:set var="village" value = "<%= request.getParameter("village")%>"/>
            <c:set var="referred" value = "<%= request.getParameter("referred")%>"/>
            <c:set var="affiliation" value = "<%= request.getParameter("affiliation")%>"/>
            <c:set var="is_member" value = "<%= request.getParameter("is_member")%>"/>
            
            <sql:update dataSource="${snapshot}" var="result">
            insert into patient (patient_no, first_name, middle_name, last_name, date_of_birth, gender, national_id, pin_no, phone, county, location, village, referred, affiliation, is_member)
            values ('${pa_no}', '${first_name}','${middle_name}','${last_name}', '${dob}', ${gender}, '${national_id}', '${pin_no}','${phone}','${county}','${location}','${village}','${referred}','${affiliation}','${is_member}')
            </sql:update>   
            
       
      
            <jsp:setProperty name="pa" property="patient_id" value="${patient_id}"/>
            <jsp:setProperty name="pa" property="patient_no" value="${pa_no}"/>
            <jsp:setProperty name="pa" property="first_name" value="${first_name}"/>
            <jsp:setProperty name="pa" property="middle_name" value="<${middle_name}"/> 
            <jsp:setProperty name="pa" property="last_name" value="<${last_name}"/>   
            <jsp:setProperty name="pa" property="vday" value="${fn:substring(date_of_birth, 1, 2)}"/>
            <jsp:setProperty name="pa" property="vmonth" value="${fn:substring(date_of_birth, 1, 2)}"/>
            <jsp:setProperty name="pa" property="vyear" value="${fn:substring(date_of_birth, 1, 2)}"/>
            <jsp:setProperty name="pa" property="gender" value="${gender}"/>
            <jsp:setProperty name="pa" property="national_id" value="${national_id}"/>
            <jsp:setProperty name="pa" property="pin_no" value="${pin_no}"/>
            <jsp:setProperty name="pa" property="phone" value="${phone}"/>
            
            <jsp:setProperty name="pa" property="county" value="${county}"/>
            <jsp:setProperty name="pa" property="location" value="${location}"/>
            <jsp:setProperty name="pa" property="village" value="${village}"/>
            <jsp:setProperty name="pa" property="referred" value="${referred}"/>
            <jsp:setProperty name="pa" property="affiliation" value="${affiliation}"/>
            <jsp:setProperty name="pa" property="is_member" value="${is_member}"/>
    </c:when>
    </c:choose>
               
      
        <sql:query dataSource="${snapshot}" var="pa_list">
        SELECT pat.patient_id, pat.patient_no, pat.first_name, pat.middle_name, pat.last_name, DATE_FORMAT(pat.date_of_birth,'%d-%m-%Y') as date_of_birth, 
        case 
            when pat.gender = 1 then 'Female'
            when pat.gender = 2 then 'Male' 
        end as gender,
        pat.national_id, pat.pin_no, pat.phone, pat.county, pat.location, pat.village, pat.referred, pat.affiliation, pat.is_member
        FROM patient pat 
        WHERE pat.patient_id = <%= pa.getPatient_id() %>
        ORDER BY pat.last_name
        </sql:query>
        
    <sql:query dataSource="${snapshot}" var="rel">
    select relationship_id, relationship 
    from relationship
    order by relationship_id
    </sql:query> 
      
      &nbsp;
      
      <h3>Patient Information</h3>
      <hr>
         <table border="0" cellpadding="10" align="center" >
         
         <tr>
            <th>Patient Number</th>
            <th>First name</th>
            <th>Middle name</th>
            <th>Last name</th>
            <th>Date of birth</th>
            <th>Gender</th>
            <th>National Id</th>
            <th>PIN Number</th>
            <th>Phone Number</th>
            <th>County</th> 
            <th>Location</th> 
            <th>Village</th> 
            
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${pa_list.rows}">
         <tr>   
            <td><c:out value="${row.patient_no}"/></td>
            <td><c:out value="${row.first_name}"/></td>
            <td><c:out value="${row.middle_name}"/></td>
            <td><c:out value="${row.last_name}"/></td>
            <td><c:out value="${row.date_of_birth}"/></td>
            <td><c:out value="${row.gender}"/></td>
            <td><c:out value="${row.national_id}"/></td>
            <td><c:out value="${row.pin_no}"/></td>
            <td><c:out value="${row.phone}"/></td>
            
            <td><c:out value="${row.county}"/></td>
            <td><c:out value="${row.location}"/></td>
            <td><c:out value="${row.village}"/></td>
           
          
            <td><a href="<c:url value="patient.jsp?patient_id=${row.patient_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
      <%-- Add next of kin --%>  
      &nbsp;
      <h3>Next of Kin Information</h3>
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
     
        

        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>



