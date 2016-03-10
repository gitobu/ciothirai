<%-- 
    Document   : relationship
    Created on : Feb 23, 2016, 9:26:45 PM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="rs" class="com.clinic.Relationship" scope="session"/>

<html>
    <head><title>Kenya Clinic: Job Title</title>
    <link href="styleOne.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    function validateFormValues(){
	
	
        if (document.relationship.relationship.value === ""){
		alert('Please enter relationship');
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
            
            <c:set var="edit_mode" value="${not empty param.relationship_id}"></c:set>   
            <c:set var="new_mode" value="${ empty param.relationship_id}"></c:set> 
            
            
            
            <c:choose>
    <c:when test='${edit_mode}'>
        <c:set var="relationship_id" value = "${param.relationship_id}"/>
           
        <sql:query dataSource="${snapshot}" var="r_data">
        SELECT rs.relationship_id, rs.relationship_no, rs.relationship
        FROM relationship rs 
        WHERE rs.relationship_id = ${relationship_id}
        </sql:query>
        
        <c:forEach var="row" items="${r_data.rows}">
        <c:set var="relationship_id" value = "${row.relationship_id}"/>
        <c:set var="relationship_no" value = "${row.relationship_no}"/>
        <c:set var="relationship" value = "${row.relationship}"/>
    

        </c:forEach> 

        <jsp:setProperty name="rs" property="relationship_id" value="${relationship_id}"/>
        <jsp:setProperty name="rs" property="relationship_no" value="${relationship_no}"/>
        <jsp:setProperty name="rs" property="relationship" value="${relationship}"/>
     
    </c:when>
    

   
</c:choose>

            
       
        <sql:query dataSource="${snapshot}" var="rs_list">
        SELECT rs.relationship_id, rs.relationship_no, rs.relationship
        FROM relationship rs
        ORDER BY relationship
        </sql:query>
        
        <form name="relationship" action="saverelationship.jsp" method="POST">
         <table border="0" cellpadding="10" align="center">  
             <caption>
                 <h2>New Relationship</h2>
            </caption>
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 <input type="hidden" name="relationship_id" value="<%= rs.getRelationship_id() %>">   
                  
             <tr><th align="left">Job Title</th><td><input type="text" name="relationship" value="<%= rs.getRelationship() %>"></td> </tr>
             </c:when>
             <c:when test='${new_mode}'>
             <tr><th align="left">Job Title</th><td><input type="text" name="relationship" ></td> </tr>
            </c:when> 
             </c:choose> 
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
         <table border="0" cellpadding="10" >
         <caption><h2>Relationship</h2></caption>
         <tr>
            <th>Relationship Number</th>
            <th>Relationship</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${rs_list.rows}">
         <tr>
            <td><c:out value="${row.relationship_no}"/></td>
            <td><c:out value="${row.relationship}"/></td>
            <td><a href="<c:url value="relationship.jsp?relationship_id=${row.relationship_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>


