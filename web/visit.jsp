<%-- 
    Document   : visit
    Created on : Jan 19, 2016, 1:06:55 AM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>

<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>

<html>
    <head><title>Kenya Clinic: Patient Visit for <%= pa.getFirst_name() %> <%= pa.getLast_name() %> </title>
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
      <div id="header"><jsp:directive.include file="header.html"/></div>
      <div id="nav"><jsp:directive.include file="menubar.jsp"/></div>
      <div id="section">
            
        <sql:query dataSource="${snapshot}" var="pr">
        SELECT provider_id, CONCAT(first_name, ' ' , last_name) as provider
        FROM provider
        ORDER BY last_name
        </sql:query> 
    
        <jsp:directive.include file="patientdata.jsp"/>
      
        <hr>
        <form name="visit" action="savevisit.jsp" method="POST">
            <table border="0" cellpadding="5" >  
                <tr><th align="left"></th><td><input type="hidden" name="patient_id" value="<%= pa.getPatient_id() %>"> </td> </tr>
                <tr><th align="left">Visit date</th><td><input type="text" name="visit_date" class="tcal" value=""></td></tr>  
                <tr><th align="left">Primary complaint</th><td><textarea name="primary_complaint" rows="5" cols="50"></textarea></td> 
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
        <jsp:directive.include file="buttonbar.jsp"/>
        </div>
        <div id="footer"><jsp:directive.include file="footer.html"/></div>
    </body>
</html>



