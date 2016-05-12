<%-- 
    Document   : inventory
    Created on : May 10, 2016, 9:24:00 PM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="in" class="com.clinic.Inventory" scope="session"/>

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
        <c:set var="drug_id" value = "${param.inventory_id}"/>
           
        <sql:query dataSource="${snapshot}" var="inv_data">
        SELECT i.inventory_id, i.drug_id, d.drug_no, d.drug_name, f.drug_form, i.quantity
        FROM inventory i 
	INNER JOIN drug d ON i.drug_id = i.drug_id
	INNER JOIN drug_form f ON d.drug_form_id = f.drug_form_id
        WHERE inventory_id = ${drug_id}
        </sql:query>
        
        <c:forEach var="row" items="${inv_data.rows}">
        <c:set var="drug_no" value = "${row.drug_no}"/>
        <c:set var="drug_name" value = "${row.drug_name}"/>
        <c:set var="drug_form" value = "${row.drug_form}"/>
        <c:set var="inventory_id" value = "${row.inventory_id}"/>
        <c:set var="drug_id" value = "${row.drug_id}"/>
        <c:set var="quantity" value = "${row.quantity}"/>
         
        </c:forEach> 

        <jsp:setProperty name="in" property="inventory_id" value="${inventory_id}"/>
        <jsp:setProperty name="in" property="quantity" value="${quantity}"/>
        <jsp:setProperty name="in" property="drug_id" value="${drug_id}"/>
        
        
     
    </c:when>
    <c:when test='${new_mode}'>
         <c:set var="inventory_id" value = ""/>
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


