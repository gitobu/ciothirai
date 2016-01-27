<%-- 
    Document   : savedrug
    Created on : Jan 26, 2016, 9:15:07 PM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="dr" class="com.clinic.Drug" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kenya Clinic: Job Title</title>
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
      <c:set var="edit_mode" value="${not empty param.drug_id}"></c:set>   
      <c:set var="new_mode" value="${ empty param.drug_id}"></c:set> 
      
    <c:choose>
        <c:when test='${edit_mode}'>

            <c:set var="drug_id" value = "<%= request.getParameter("drug_id")%>"/>        
            <c:set var="drug_name" value="<%= request.getParameter("drug_name")%>" /> 
            <c:set var="drug_form_id" value="<%= request.getParameter("drug_form_id")%>" />

            <sql:update dataSource="${snapshot}" var="result">
            update drug set drug_name = '${drug_name}',  drug_form_id = ${drug_form_id}
            where drug_id  = ${drug_id}
            </sql:update>  

        </c:when>
        <c:when test='${new_mode}'>
            <sql:query dataSource="${snapshot}" var="dr">
            select CONCAT('DR', max(substr(drug_no,3,5)) + 1) as dr_no 
            FROM drug
            </sql:query>

            <c:forEach var="row" items="${dr.rows}">
                <c:set var="dr_no" value = "${row.dr_no}" />
            </c:forEach>   


            <c:set var="drug_name" value="<%= request.getParameter("drug_name")%>" />
            
            <c:set var="drug_form_id" value="<%= request.getParameter("drug_form_id")%>" />

            <sql:update dataSource="${snapshot}" var="result">
            insert into drug (drug_no, drug_name, drug_form_id)
            values ('${dr_no}', '${drug_name}', ${drug_form_id})
            </sql:update>        

        </c:when>
    </c:choose>
    
    <sql:query dataSource="${snapshot}" var="dr_list">
        SELECT drug.drug_id, drug.drug_no, drug.drug_name, drug_form.drug_form, drug.drug_form_id
        FROM drug inner join drug_form on drug.drug_form_id = drug_form.drug_form_id
        ORDER BY  drug.drug_name
        </sql:query>
        
        <sql:query dataSource="${snapshot}" var="dr">
        SELECT drug_form_id, drug_form
        FROM drug_form
        ORDER BY drug_form
        </sql:query> 
        
        <form name="drug" action="savedrug.jsp" method="POST">
         <table border="0" cellpadding="10" align="center">  
             <caption>
                 <h2>Drug</h2>
            </caption>
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 <input type="hidden" name="drug_id" value="<%= dr.getDrug_id() %>">   
                  
             <tr><th align="left">Drug name</th><td><input type="text" name="drug_name" value="<%= dr.getDrug_name() %>"></td> </tr>
             
             </c:when>
             <c:when test='${new_mode}'>
                 <tr><th align="left">First name</th><td><input type="text" name="drug_name" /></td> </tr>
                 
            </c:when> 
             </c:choose> 
                 <tr><th align="left">Drug Form</th><td> 
                <select name="drug_form_id">
                  <c:choose>  
             
                      
                      <c:when test='${edit_mode}'>   
                 <option value="<%= dr.getDrug_form_id() %>"> ${drug_form}  </option>
              </c:when>
             <c:when test='${new_mode}'>
                 <option value="">[Please select drug form]</option>
             </c:when>
                  </c:choose>
                 
                 <c:forEach var="row" items="${dr.rows}">
                <option value="${row.drug_form_id}">${row.drug_form}</option>
  		</c:forEach> 
                </select> 
   
                     
                     </td> </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
         <table border="1" cellpadding="10" align="center" >
         <caption><h2>Drugs</h2></caption>
         <tr>
            <th>Drug Number</th>
            <th>Drug name</th>
            <th>Drug form</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${dr_list.rows}">
         <tr>
            <td><c:out value="${row.drug_no}"/></td>
            <td><c:out value="${row.drug_name}"/></td>
            <td><c:out value="${row.drug_form}"/></td>
            
            <td><a href="<c:url value="drug.jsp?drug_id=${row.drug_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>

