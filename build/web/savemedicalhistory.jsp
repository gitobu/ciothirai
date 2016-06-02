<%-- 
    Document   : savemedicalhistory
    Created on : May 21, 2016, 7:01:12 AM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>
<jsp:useBean id="mh" class="com.clinic.Medical_history" scope="session"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kenya Clinic: Medical History</title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
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
      <c:set var="edit_mode" value="${not empty param.medical_history_id}"></c:set>   
      <c:set var="new_mode" value="${ empty param.medical_history_id}"></c:set> 
      
    <c:choose>
        <c:when test='${edit_mode}'>
            <c:set var="medical_history_id" value = "<%= mh.getMedical_history_id() %>"/>   
            <c:set var="patient_id" value = "<%= request.getParameter("patient_id")%>"/>   
            <c:set var="time_period" value = "<%= request.getParameter("time_period")%>"/>   
            <c:set var="issue" value = "<%= request.getParameter("issue")%>"/> 
            <c:set var="how_treated" value = "<%= request.getParameter("how_treated")%>"/> 
            <c:set var="current_status" value = "<%= request.getParameter("current_status")%>"/>   

            <sql:update dataSource="${snapshot}" var="result">
            update medical_history set  time_period = '${time_period}', issue = '${issue}', how_treated = '${how_treated}', current_status = '${current_status}' 
            where medical_history_id  = ${medical_history_id}
            </sql:update>  

        </c:when>
        <c:when test='${new_mode}'>
            <c:set var="medical_history_id" value = "<%= request.getParameter("medical_history_id")%>"/>   
            <c:set var="patient_id" value = "<%= pa.getPatient_id() %>"/>   
            <c:set var="time_period" value = "<%= request.getParameter("time_period")%>"/>   
            <c:set var="issue" value = "<%= request.getParameter("issue")%>"/> 
            <c:set var="how_treated" value = "<%= request.getParameter("how_treated")%>"/> 
            <c:set var="current_status" value = "<%= request.getParameter("current_status")%>"/> 

            <sql:update dataSource="${snapshot}" var="result">
            insert into medical_history (patient_id, time_period, issue, how_treated, current_status)
            values (${patient_id}, '${time_period}','${issue}', '${how_treated}', '${current_status}')
            </sql:update>        

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
         
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
             </c:when>
         </c:choose>
             </table>
            </form>
         
         <table border="0" cellpadding="10"  >
         <caption><h2>Medical History</h2></caption>
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




