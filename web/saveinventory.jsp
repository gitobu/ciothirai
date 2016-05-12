<%-- 
    Document   : saveinventory
    Created on : May 12, 2016, 5:12:00 AM
    Author     : Gitobu
--%>
<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="in" class="com.clinic.Inventory" scope="session"/>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head><title>Kenya Clinic: Inventory</title>
    <link href="styleOne.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="tcal.css" /> 
    <script type="text/javascript" src="tcal.js">
    function validateFormValues(){
	
	
        if (document.inventory.quantity.value === ""){
		alert('Please enter drug quantity');
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
    <c:set var="edit_mode" value="${not empty param.inventory_id}"></c:set>   
      <c:set var="new_mode" value="${ empty param.inventory_id}"></c:set> 
      
    <c:choose>
        <c:when test='${edit_mode}'>
            <c:set var="inventory_id" value = "<%= request.getParameter("inventory_id")%>"/> 
            <c:set var="drug_id" value = "<%= request.getParameter("drug_id")%>"/>        
            <c:set var="quantity" value = "<%= request.getParameter("quantity")%>"/>
            <c:set var="date_entered" value = "<%= request.getParameter("date_entered")%>"/> 
            <sql:update dataSource="${snapshot}" var="result">
            update inventory set date_entered = '${date_entered}', drug_id = '${drug_id}',  quantity = ${quantity}
            where inventory_id  = ${inventory_id}
            </sql:update>  

        </c:when>
        <c:when test='${new_mode}'>
            


            <c:set var="drug_id" value="<%= request.getParameter("drug_id")%>" />
            
            <c:set var="quantity" value="<%= request.getParameter("quantity")%>" />
            <c:set var="date_entered" value = "<%= request.getParameter("date_entered")%>"/> 
            <c:set var="vday" value="${fn:substring(date_entered, 0, 2)}"/>
            <c:set var="vmonth" value="${fn:substring(date_entered, 3, 5)}"/>
            <c:set var="vyear" value="${fn:substring(date_entered, 6, 10)}"/>
            <c:set var="dash" value="-"/>
            <c:set var="de" value="${vyear}${dash}${vmonth}${dash}${vday}"/>

            <sql:update dataSource="${snapshot}" var="result">
            insert into inventory (date_entered, drug_id, quantity)
            values ('${de}', '${drug_id}', '${quantity}')
            </sql:update>        

        </c:when>
    </c:choose>
         <sql:query dataSource="${snapshot}" var="inv_list">

        
        SELECT inventory.inventory_id, inventory.date_entered, drug.drug_name, inventory.quantity 
        FROM inventory inner join drug on inventory.drug_id = drug.drug_id
        ORDER BY inventory.date_entered, drug.drug_name
        </sql:query>
        
        <sql:query dataSource="${snapshot}" var="dr">
        select drug_id, drug_no, drug_name, drug_form_id 
        from drug
        order by drug_name
        </sql:query>
        
     <form name="inventory" action="saveinventory.jsp" method="POST">
         <table border="0" cellpadding="10" align="center">  
             <caption>
                 <h2>Inventory</h2>
            </caption>
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 <input type="hidden" name="inventory_id" value="<%= in.getInventory_id() %>">   
              <tr><th align="left">Date </th><td><input type="text" name="date_entered" ></td>      
             <tr><th align="left">Quantity</th><td><input type="text" name="quantity" value="<%= in.getQuantity() %>"></td> </tr>
             
             </c:when>
             <c:when test='${new_mode}'>
                 <th align="left">Date </th><td><input type="text" name="date_entered" class="tcal" value=""></td></tr> 
                 <tr><th align="left">Quantity</th><td><input type="text" name="quantity" /></td> </tr>
                 
            </c:when> 
             </c:choose> 
                 <tr><th align="left">Drug Name</th><td> 
                <select name="drug_id">
                  <c:choose>  
             
                      
                      <c:when test='${edit_mode}'>   
                 <option value="<%= in.getDrug_id() %>"> ${drug_name}  </option>
              </c:when>
             <c:when test='${new_mode}'>
                 <option value="">[Please select drug name]</option>
             </c:when>
                  </c:choose>
                 
                 <c:forEach var="row" items="${dr.rows}">
                <option value="${row.drug_id}">${row.drug_name}</option>
  		</c:forEach> 
                </select> 
                
       
             
                 
            
                 
                 
                   
                 
                     
                     </td> </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>   
    <table border="0" cellpadding="10" align="center" >
         <caption><h2>Inventory</h2></caption>
         <tr>
            <th>Date entered</th>
            <th>Drug name</th>
            <th>Quantity</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${inv_list.rows}">
         <tr>
            <td><c:out value="${row.date_entered}"/></td>
            <td><c:out value="${row.drug_name}"/></td>
            <td><c:out value="${row.quantity}"/></td>
            <td><a href="<c:url value="inventory.jsp?inventory_id=${row.inventory_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
</div>
      <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>
