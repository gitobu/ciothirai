<%-- 
    Document   : medicalhistory
    Created on : May 19, 2016, 9:26:16 PM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>
<jsp:useBean id="mh" class="com.clinic.Medical_history" scope="session"/>

<html>
    <head><title>Kenya Clinic: Drug information</title>
    <link href="styleOne.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    function validateFormValues(){
	
	
        if (document.drug.drug_name.value === ""){
		alert('Please enter drug name');
		return false;} 
         if (document.drug.drug_form_id.value === ""){
		alert('Please select drug form');
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
            
            <c:set var="edit_mode" value="${not empty param.medical_history_id}"></c:set>   
            <c:set var="new_mode" value="${ empty param.medical_history_id}"></c:set> 
            
            
            
<c:choose>
    <c:when test='${edit_mode}'>
        <c:set var="medical_history_id" value = "${param.medical_history_id}"/>
           
        <sql:query dataSource="${snapshot}" var="mh_data">
        SELECT medical_history_id, patient_id, time_period, issue, how_treated, current_status
        FROM medical_history
        WHERE medical_history_id = ${medical_history_id}
        </sql:query>
        
        <c:forEach var="row" items="${mh_data.rows}">
        <c:set var="medical_history_id" value = "${row.medical_history_id}"/>
        <c:set var="patient_id" value = "${row.patient_id}"/>
        <c:set var="time_period" value = "${row.time_period}"/>
        <c:set var="issue" value = "${row.issue}"/>
        <c:set var="how_treated" value = "${row.how_treated}"/>
        <c:set var="current_status" value = "${row.current_status}"/>
        </c:forEach> 

        <jsp:setProperty name="mh" property="medical_history_id" value="${medical_history_id}"/>
        <jsp:setProperty name="mh" property="patient_id" value="${patient_id}"/>
        <jsp:setProperty name="mh" property="time_period" value="${time_period}"/>
        <jsp:setProperty name="mh" property="issue" value="${issue}"/>
        <jsp:setProperty name="mh" property="how_treated" value="${how_treated}"/>
        <jsp:setProperty name="mh" property="current_status" value="${current_status}"/>
    </c:when>
    <c:when test='${new_mode}'>
         <c:set var="medical_history_id" value = ""/>
   </c:when>
</c:choose>

            
       
       <sql:query dataSource="${snapshot}" var="mh">
        SELECT medical_history_id, patient_id, time_period, issue, how_treated, current_status
        FROM medical_history  
        WHERE patient_id = <%= pa.getPatient_id() %>
        </sql:query>
        
        
       
        
        <form name="medical_history" action="savemedicalhistory.jsp" method="POST">
         <table border="0" cellpadding="10" >  
             <caption>
                 <h2>Medical history for <%= pa.getLast_name() %></h2>
            </caption>
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 <tr><td><input type="hidden" name="medical_history_id" value="<%= mh.getMedical_history_id() %>"> </td></tr>  
                  
             <tr><th align="left">Time period</th><td><input type="text" name="time_period" value="<%= mh.getTime_period() %>"></td> </tr>
             <tr><th align="left">What was the issue?</th><td><input type="text" name="issue" value="<%= mh.getIssue() %>"></td> </tr>
             <tr><th align="left">How was it treated?</th><td><input type="text" name="how_treated" value="<%= mh.getHow_treated() %>"></td> </tr>
             <tr><th align="left">How are your feeling now?</th><td><input type="text" name="current_status" value="<%= mh.getCurrent_status() %>"></td> </tr>
             
             </c:when>
             <c:when test='${new_mode}'>
              
             <tr><th align="left">Time period</th><td><input type="text" name="time_period" ></td> </tr>
             <tr><th align="left">What was the issue?</th><td><textarea name="issue" rows="5" cols="50"></textarea></td> </tr>
             <tr><th align="left">How was it treated?</th><td><textarea name="how_treated" rows="5" cols="50"></textarea></td> </tr>
             <tr><th align="left">How are your feeling now?</th><td><textarea name="current_status" rows="5" cols="50"></textarea></td> </tr>
         
             
             </c:when>
         </c:choose>
            <tr><td></td><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
             </table>
            </form>
         
         <table border="0" cellpadding="10" >
         <caption><h2>Medical History </h2></caption>
         <tr>
            <th>Time period</th>
            <th>Issue</th>
            <th>How treated</th>
            <th>How feeling now</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${mh.rows}">
         <tr>
            <td><c:out value="${row.time_period}"/></td>
            <td><c:out value="${row.issue}"/></td>
            <td><c:out value="${row.how_treated}"/></td>
             <td><c:out value="${row.current_status}"/></td>
            <td><a href="<c:url value="medicalhistory.jsp?medical_history_id=${row.medical_history_id}"/>">Edit</a></td>
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


