<%-- 
    Document   : savevisit
    Created on : Jan 19, 2016, 8:34:10 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>
<jsp:useBean id="vi" class="com.clinic.Visit" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kenya Clinic: Job Title</title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
    function validateFormValues(){
	
	
       if (document.service.service_type_id.value === ""){
		alert('Please select a service type');
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
   
      
      
            <sql:query dataSource="${snapshot}" var="vi">
            select CONCAT('VI', max(substr(visit_no,3,5)) + 1) as vi_no 
            FROM visit
            </sql:query>

            <c:forEach var="row" items="${vi.rows}">
                <c:set var="vi_no" value = "${row.vi_no}" />
            </c:forEach>   


            <c:set var="patient_id" value="<%= pa.getPatient_id() %>" />
            <c:set var="primary_complaint" value="<%= request.getParameter("primary_complaint")%>" />
            <c:set var="provider_id" value="<%= request.getParameter("provider_id")%>" />

            <sql:update dataSource="${snapshot}" var="result">
            insert into visit (patient_id, visit_no, primary_complaint, provider_id)
            values (${patient_id}, '${vi_no}','${primary_complaint}', ${provider_id})
            </sql:update> 
            
            <sql:query dataSource="${snapshot}" var="sid">
            SELECT visit_id
            FROM visit
            WHERE visit_no = (select CONCAT('VI', max(substr(visit_no,3,5))) FROM visit)
            </sql:query>
            
            <c:forEach var="row" items="${sid.rows}">
                <c:set var="visit_id" value = "${row.visit_id}" />
            </c:forEach>
            
            <jsp:setProperty name="vi" property="visit_id" value="${visit_id}"/>
    
            <sql:query dataSource="${snapshot}" var="se">
            SELECT service_type_id, service_type_no, service_type_description
            FROM service_type
            ORDER BY service_type_description
            </sql:query> 
    

        
        <form name="service" action="addservice.jsp" method="POST">
         <table border="0" cellpadding="10" align="center">  
             <caption>
                 <h2>Patient Visit for <%= pa.getFirst_name() %> <%= pa.getLast_name() %></h2>
            </caption>
             
                 <tr><th align="left"></th><td><input type="hidden" name="visit_id" value="<%= vi.getVisit_id() %>"> </td> </tr>
             
            
                 <tr><th align="left">Service Type </th><td> 
                <select name="service_type_id">
                  
                 <option value="">[Please select Service]</option>
             
                 <c:forEach var="row" items="${se.rows}">
                <option value="${row.service_type_id}">${row.service_type_description}</option>
  		</c:forEach> 
                </select> 
  
                     </td> </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
         
            </table>
            </form>
         
         
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>



