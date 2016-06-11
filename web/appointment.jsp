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
            <jsp:directive.include file="patientdata.jsp"/> 
            <c:set var="edit_mode" value="${not empty param.appointment_id}"></c:set>   
            <c:set var="new_mode" value="${ empty param.appointment_id}"></c:set> 
            
            
            
<c:choose>
    <c:when test='${edit_mode}'>
        <c:set var="appointment_id" value = "${param.appointment_id}"/>
           
        <sql:query dataSource="${snapshot}" var="app_data">
        SELECT appointment_id, patient_id, service_date, service_type_id, substr(service_date,1,4) as yr, substr(service_date,6,2) as mm, substr(service_date,9,2) as dd
        FROM appointment 
        WHERE appointment_id = ${appointment_id}
        </sql:query>
        
        <c:forEach var="row" items="${app_data.rows}">
        <c:set var="appointment_id" value = "${row.appointment_id}"/>
        <c:set var="patient_id" value = "${row.patient_id}"/>
        <c:set var="service_date" value = "${row.service_date}"/>
        <c:set var="service_type_id" value = "${row.service_type_id}"/>
        
        <c:set var="yr" value = "${row.yr}"/>
        <c:set var="dd" value = "${row.mm}"/>
        <c:set var="mo" value = "${row.dd}"/>
        
        </c:forEach> 

        <jsp:setProperty name="app" property="appointment_id" value="${appointment_id}"/>
        <jsp:setProperty name="app" property="patient_id" value="${patient_id}"/>
        <jsp:setProperty name="app" property="service_type_id" value="${service_type_id}"/>
      
        <jsp:setProperty name="app" property="vday" value="${dd}"/>
        <jsp:setProperty name="app" property="vyear" value="${yr}"/>
        <jsp:setProperty name="app" property="vmonth" value="${mo}"/>
        
    </c:when>
    <c:when test='${new_mode}'>
         <c:set var="appointment_id" value = ""/>
   </c:when>
</c:choose>

            
       
        <sql:query dataSource="${snapshot}" var="app_list">
        SELECT appointment_id, patient_id, service_date, service_type.service_type_description, CONCAT(provider.first_name,' ', provider.last_name) provider 
        FROM appointment join service_type on appointment.service_type_id = service_type.service_type_id
        left join provider on appointment.provider_id = provider.provider_id
        WHERE patient_id = <%= pa.getPatient_id() %>
        ORDER BY service_type.service_type_description
        </sql:query>
        
        <sql:query dataSource="${snapshot}" var="st">
        SELECT service_type_id, service_type_description
        FROM service_type
        ORDER BY service_type_description
        </sql:query> 
         <sql:query dataSource="${snapshot}" var="pr">
        SELECT provider_id, CONCAT(first_name, ' ' , last_name) as provider
        FROM provider
        ORDER BY last_name
        </sql:query> 
        <form name="provider" action="saveappointment.jsp" method="POST">
         <h3><font color="lightseagreen"><b>New appointment for <%= pa.getLast_name() %></b></font></h3>   
         <table border="0" cellpadding="10" >  
             
                 
                 
            
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 
                 <tr><td></td><td><input type="hidden" name="appointment_id" value="<%= app.getAppointment_id() %>"></td></tr>  
                 <tr><td></td><td><input type="hidden" name="patient_id" value="<%= pa.getPatient_id() %>"></td></tr>
                  <tr><th align="left">Appointment Date</th><td><input type="text" name="service_date"  class="tcal" value="<%= app.getVday() %><%= app.getVdash() %><%= app.getVmonth() %><%= app.getVdash() %><%= app.getVyear() %>"></td>
             </c:when>
             <c:when test='${new_mode}'>
                 <tr><th align="left">Appointment date</th><td><input type="text" name="service_date"  class="tcal" value=""/></td> </tr>
                 
            </c:when> 
             </c:choose> 
                 <tr><th align="left">Purpose</th><td> 
         
  <select name="service_type_id">
      
    <c:forEach var="row" items="${st.rows}">
        <option value="${row.service_type_id}" ${row.service_type_id ==  app.getService_type_id() ? 'selected="selected"' : ''}>${row.service_type_description}</option>
    </c:forEach>
</select>
                     </td> </tr>
                 
                 <tr><th align="left">Attending physician </th>
                <td> 
                <select name="provider_id">
                  <option value="">[Please select attending physician]</option>
                    <c:forEach var="row" items="${pr.rows}">
                        <option value="${row.provider_id}">${row.provider}</option>
                    </c:forEach> 
                </select> 
                </td> 
                </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
                 <h3><font color="lightseagreen"><b>Appointments for <%= pa.getLast_name() %></b></font></h3>
         <table border="0" cellpadding="10"  >
       
   
         <tr>
            <th>Appointment Date</th>
            <th>Appointment purpose</th>
            <th>Scheduled physician</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${app_list.rows}">
         <tr>
            <td><c:out value="${row.service_date}"/></td>
            <td><c:out value="${row.service_type_description}"/></td>
           <td><c:out value="${row.provider}"/></td>
            <td><a href="<c:url value="appointment.jsp?appointment_id=${row.appointment_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
         <jsp:directive.include file="buttonbar.jsp"/>
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>


