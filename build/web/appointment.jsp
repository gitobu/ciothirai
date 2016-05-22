<%-- 
    Document   : appointment
    Created on : May 21, 2016, 6:03:27 PM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="app" class="com.clinic.Appointment" scope="session"/>
<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>
<html>
    <head><title>Kenya Clinic: Healthcare provider</title>
    <link href="styleOne.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="tcal.css" /> 
    <script type="text/javascript" src="tcal.js">
    function validateFormValues(){
	
	
        if (document.provider.first_name.value === ""){
		alert('Please enter first name');
		return false;} 
        if (document.provider.last_name.value === ""){
		alert('Please enter last name');
		return false;} 
         if (document.provider.job_title_id.value === ""){
		alert('Please select job title');
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
            
            <c:set var="edit_mode" value="${not empty param.appointment_id}"></c:set>   
            <c:set var="new_mode" value="${ empty param.appointment_id}"></c:set> 
            
            
            
<c:choose>
    <c:when test='${edit_mode}'>
        <c:set var="appointment_id" value = "${param.appointment_id}"/>
           
        <sql:query dataSource="${snapshot}" var="app_data">
        SELECT appointment_id, patient_id, service_date, service_type_id
        FROM appointment 
        WHERE appointment_id = ${appointment_id}
        </sql:query>
        
        <c:forEach var="row" items="${app_data.rows}">
        <c:set var="appointment_id" value = "${row.appointment_id}"/>
        <c:set var="patient_id" value = "${row.patient_id}"/>
        <c:set var="service_date" value = "${row.service_date}"/>
        <c:set var="service_type_id" value = "${row.service_type_id}"/>
 
        </c:forEach> 

        <jsp:setProperty name="app" property="appointment_id" value="${appointment_id}"/>
        <jsp:setProperty name="app" property="patient_id" value="${patient_id}"/>
        <jsp:setProperty name="app" property="service_date" value="${service_date}"/>
        <jsp:setProperty name="app" property="service_type_id" value="${service_type_id}"/>
      
     
    </c:when>
    <c:when test='${new_mode}'>
         <c:set var="appointment_id" value = ""/>
   </c:when>
</c:choose>

            
       
        <sql:query dataSource="${snapshot}" var="app_list">
        SELECT appointment_id, patient_id, service_date, service_type.service_type_description
        FROM appointment join service_type on appointment.service_type_id = service_type.service_type_id
        ORDER BY service_type.service_type_description
        </sql:query>
        
        <sql:query dataSource="${snapshot}" var="st">
        SELECT service_type_id, service_type_description
        FROM service_type
        ORDER BY service_type_description
        </sql:query> 
        
        <form name="provider" action="saveappointment.jsp" method="POST">
         <table border="0" cellpadding="10" align="center">  
             <caption>
                 <h2>Appointment</h2>
            </caption>
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 <tr><td></td><td><input type="hidden" name="appointment_id" value="<%= app.getAppointment_id() %>"></td></tr>  
                 <tr><td></td><td><input type="hidden" name="patient_id" value="<%= pa.getPatient_id() %>"></td></tr>
                  <tr><th align="left">Appointment Date</th><td><input type="text" name="service_date" ></td>
             </c:when>
             <c:when test='${new_mode}'>
                 <tr><th align="left">Appointment date</th><td><input type="text" name="service_date"  class="tcal" value=""/></td> </tr>
                 
            </c:when> 
             </c:choose> 
                 <tr><th align="left">Purpose</th><td> 
                <select name="service_type_id">
                  <c:choose>  
             
                      
                      <c:when test='${edit_mode}'>   
                 <option value="<%= app.getAppointment_id() %>"> ${service_type_description}  </option>
              </c:when>
             <c:when test='${new_mode}'>
                 <option value="">[Please select appointment purpose]</option>
             </c:when>
                  </c:choose>
                 
                 <c:forEach var="row" items="${st.rows}">
                <option value="${row.service_type_id}">${row.service_type_description}</option>
  		</c:forEach> 
                </select> 
  
                     </td> </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
         <table border="0" cellpadding="10" align="center" >
         <caption><h2>Health care provider</h2></caption>
         <tr>
            <th>Appointment Date</th>
            <th>Appointment purpose</th>
            
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${app_list.rows}">
         <tr>
            <td><c:out value="${row.service_date}"/></td>
            <td><c:out value="${row.service_type_description}"/></td>
           
            <td><a href="<c:url value="appointment.jsp?appointment_id=${row.appointment_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>


