<%-- 
    Document   : saverelationship
    Created on : Feb 23, 2016, 9:48:29 PM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kenya Clinic: Relationship</title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
    function validateFormValues(){
	
	
        if (document.relationship.relationship.value === ""){
		alert('Please enter Relationship');
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

            <c:set var="relationship_id" value = "<%= request.getParameter("relationship_id")%>"/>        
            <c:set var="relationship" value="<%= request.getParameter("relationship")%>" />

            <sql:update dataSource="${snapshot}" var="result">
            update relationship set relationship = '${relationship}'
            where relationship_id = ${relationship_id}
            </sql:update>  

        </c:when>
        <c:when test='${new_mode}'>
            <sql:query dataSource="${snapshot}" var="rs">
            select CONCAT('RS', max(substr(relationship_no,3,5)) + 1) as rs_no 
            FROM relationship
            </sql:query>

            <c:forEach var="row" items="${rs.rows}">
                <c:set var="rs_no" value = "${row.rs_no}" />
            </c:forEach>   


            <c:set var="relationship" value="<%= request.getParameter("relationship")%>" />

            <sql:update dataSource="${snapshot}" var="result">
            insert into relationship (relationship_no, relationship)
            values ('${rs_no}', '${relationship}')
            </sql:update>        

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
            
             <tr><th align="left">Relationship</th><td><input type="text" name="relationship"></td> </tr>
             
             
          
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
    </form>
    <table border="0" cellpadding="10" align="center" >
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



