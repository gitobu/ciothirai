<%-- 
    Document   : Patient
    Created on : Jan 19, 2016, 1:01:17 AM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>

<html>
    <head><title>Kenya Clinic: Patient</title>
    <link href="styleOne.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="tcal.css" /> 
    <script type="text/javascript" src="tcal.js">
       
        date_of_birth, national_id        
    function validateFormValues(){
	
	
        if (document.patient.first_name.value === ""){
		alert('Please enter first name');
		return false;} 
        if (document.patient.last_name.value === ""){
		alert('Please enter last name');
		return false;} 
        if (document.patient.date_of_birth.value === ""){
                alert('Please enter date of birth');
                return false
        }
         if (document.patient.national_id.value === ""){
                alert('Please enter national id');
                return false
        }
            
			else
		{
			return true;
		}
    }
   
    </script>
   
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
      <div id="header">
       <jsp:directive.include file="header.html"/>
        </div>
              

                   <jsp:directive.include file="menubar.jsp"/>


        <div id="section">
            
            <c:set var="edit_mode" value="${not empty param.patient_id}"></c:set>   
            <c:set var="new_mode" value="${ empty param.patient_id}"></c:set> 
            
            
            
<c:choose>
    <c:when test='${edit_mode}'>
        <c:set var="patient_id" value = "${param.patient_id}"/>
           
        <sql:query dataSource="${snapshot}" var="pa_data">
        SELECT pa.patient_id, pa.patient_no, pa.first_name, pa.middle_name, pa.last_name, substr(pa.date_of_birth,1,4) as yr, substr(pa.date_of_birth,6,2) as mm, substr(pa.date_of_birth,9,2) as dd, pa.gender, pa.national_id, pa.pin_no, pa.phone,
        pa.county, pa.location, pa.village, pa.referred, pa.affiliation, pa.is_member
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
        
        <c:set var="county" value = "${row.county}"/>
        <c:set var="location" value = "${row.location}"/>
        <c:set var="village" value = "${row.village}"/>
        <c:set var="referred" value = "${row.referred}"/>
        <c:set var="affiliation" value = "${row.affiliation}"/>
        <c:set var="is_member" value = "${row.is_member}"/>
        
        <c:set var="yr" value = "${row.yr}"/>
        <c:set var="dd" value = "${row.mm}"/>
        <c:set var="mo" value = "${row.dd}"/>

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
        
        <jsp:setProperty name="pa" property="county" value="${county}"/>
        <jsp:setProperty name="pa" property="location" value="${location}"/>
        <jsp:setProperty name="pa" property="village" value="${village}"/>
        <jsp:setProperty name="pa" property="referred" value="${referred}"/>
        <jsp:setProperty name="pa" property="affiliation" value="${affiliation}"/>
        <jsp:setProperty name="pa" property="is_member" value="${is_member}"/>
        
        <jsp:setProperty name="pa" property="vday" value="${dd}"/>
        <jsp:setProperty name="pa" property="vyear" value="${yr}"/>
        <jsp:setProperty name="pa" property="vmonth" value="${mo}"/>
    </c:when>
    <c:when test='${new_mode}'>
         <c:set var="patient_id" value = ""/>
   </c:when>
</c:choose>

            
     &nbsp;
      <h4>New Patient Information</h4>
      <hr width="333%">  
     
        
     
        
        <form name="patient" action="savepatient.jsp" method="POST">
          <table border="0" cellpadding="10" align="center">  
             
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 <td><input type="hidden" name="patient_id" value="<%= pa.getPatient_id() %>"></td> 
                 
                
             <tr><th align="left">First name</th><td><input type="text" name="first_name" value="<%= pa.getFirst_name() %>"></td> 
             <th align="left">Middle name</th><td><input type="text" name="middle_name" value="<%= pa.getMiddle_name() %>"></td> </tr>
             <tr><th align="left">Last name</th><td><input type="text" name="last_name" value="<%= pa.getLast_name() %>"></td> 
             <th align="left">Date of birth</th><td><input type="text" name="date_of_birth" class="tcal" value="<%= pa.getVday() %><%= pa.getVdash() %><%= pa.getVmonth() %><%= pa.getVdash() %><%= pa.getVyear() %>"></td> 
             <tr><th align="left">Gender</th><td>
                    <c:choose> 
                        <c:when test='{<%= pa.getGender() %> equals ("1")}'>
                        Female<input type="radio" name="gender" value="1" checked="checked">
                        Male<input type="radio" name="gender" value="2">
                        </c:when>
                        <c:otherwise>
                       
                        Female<input type="radio" name="gender" value="1" >
                        Male<input type="radio" name="gender" value="2" checked="checked">
                        </c:otherwise>
                     </c:choose>
                 </td>
             <th align="left">National Id</th><td><input type="text" name="national_id" value="<%= pa.getNational_id() %>"></td>
             <tr><th align="left">PIN Number</th><td><input type="text" name="pin_no" value="<%= pa.getPin_no() %>"></td> 
             <th align="left">Phone Number</th><td><input type="text" name="phone" value="<%= pa.getPhone() %>"></td> </tr>
            
             <tr><th align="left">County</th><td><input type="text" name="county" value="<%= pa.getCounty() %>"></td> 
             <th align="left">Location</th><td><input type="text" name="location" value="<%= pa.getLocation() %>"></td> </tr>
             <tr><th align="left">Village</th><td><input type="text" name="village" value="<%= pa.getVillage() %>"></td> 
             <th align="left">Religious affiliation</th><td><input type="text" name="affiliation" value="<%= pa.getAffiliation() %>"></td> </tr>
             </table>
             <table border="0" cellpadding="10" align="left">
             <tr><th align="left">Were you referred to this clinic?</th><td>
                     <c:choose> 
                        <c:when test='{<%= pa.getReferred() %> == 1}'>
                        Yes<input type="radio" name="referred" value="1" checked="checked">
                        No<input type="radio" name="referred" value="2">
                        </c:when>
                        <c:otherwise>
                       
                        Yes<input type="radio" name="referred" value="1" >
                        No<input type="radio" name="referred" value="2" checked="checked">
                        </c:otherwise>
                     </c:choose>
                 </td></tr>
             <tr><th align="left">Are you a member of Ciothirai Methodist Church?</th><td>
                      <c:choose> 
                        <c:when test='{<%= pa.getIs_member() %> == 1}'>
                        Yes<input type="radio" name="is_member" value="1" checked="checked">
                        No<input type="radio" name="is_member" value="2">
                        </c:when>
                        <c:otherwise>    
                        Yes<input type="radio" name="is_member" value="1" >
                        No<input type="radio" name="is_member" value="2" checked="checked">
                        </c:otherwise>
                     </c:choose>
                 </td>
             <tr><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
             </table>
             </c:when>
             <c:when test='${new_mode}'>
             <table border="0" cellpadding="10" align="center">
            <tr><th align="left">First name</th><td><input type="text" name="first_name" ></td> 
            <th align="left">Middle name</th><td><input type="text" name="middle_name" ></td> </tr>
             <tr><th align="left">Last name</th><td><input type="text" name="last_name" ></td> 
            <th align="left">Date of birth</th><td><input type="text" name="date_of_birth" class="tcal" value=""></td></tr>          
             <tr><th align="left">Gender</th><td><input type="radio" name="gender" value="1">Female<input type="radio" name="gender" value="2">Male</td> 
             <th align="left">National Id</th><td><input type="text" name="national_id" ></td> </tr>
             <tr><th align="left">PIN Number</th><td><input type="text" name="pin_no" ></td> 
             <th align="left">Phone Number</th><td><input type="text" name="phone" ></td> </tr>
             <tr>
                 <th align="left">County</th><td><input type="text" name="county"></td>
                 <th align="left">Location</th><td><input type="text" name="location"></td>
             </tr>
             <tr>
                 <th align="left">Village</th><td><input type="text" name="village"></td>
                 <th align="left">Religious affiliation</th><td><input type="text" name="affiliation"></td>
             </tr>
             </table >
             <table border="0" cellpadding="10" align="left">
             <tr>
                 <th align="left">Were you referred to this clinic?</th><td>Yes<input type="radio" name="referred" value="1">No<input type="radio" name="referred" value="2"></td></tr>
             <tr>  <th align="left">Are you a member of Ciothirai Methodist Church?</th><td>Yes<input type="radio" name="is_member" value="1">No<input type="radio" name="is_member" value="2"></td>
             </tr>
              <tr><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
             </table> 
            </c:when> 
             </c:choose> 
                 
            
            </form>
        
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>


