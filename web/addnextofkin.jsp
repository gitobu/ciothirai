<%-- 
    Document   : addnextofkin
    Created on : Apr 12, 2016, 7:51:33 PM
    Author     : Gitobu
--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:directive.include file="sqllink.jsp"/>


<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>

<jsp:useBean id="now" class="java.util.Date" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Kenya Clinic: Next of kin</title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
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
    <jsp:directive.include file="patientdata.jsp"/>
            <hr>
    <sql:query dataSource="${snapshot}" var="rel">
    select relationship_id, relationship 
    from relationship
    order by relationship_id
    </sql:query> 
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
