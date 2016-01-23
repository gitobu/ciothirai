<%-- 
    Document   : saveprescription
    Created on : Jan 22, 2016, 5:56:41 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vi" class="com.clinic.Visit" scope="session" />

<jsp:useBean id="pa" class="com.clinic.Patient" scope="session"/>

<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prescription for <%= pa.getFirst_name() %> <%= pa.getLast_name() %></title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="header">
       <jsp:directive.include file="header.html"/>
        </div>
        
              <div id="nav">
                 <jsp:directive.include file="menubar.jsp"/>
</div>   
<div id="section"> 
        
            
            <c:set var="visit_id" value="<%= vi.getVisit_id() %>" />
            <c:set var="drug_id" value="<%= request.getParameter("drug_id")%>" />
            <c:set var="quantity" value="<%= request.getParameter("quantity")%>" />
            
            <sql:update dataSource="${snapshot}" var="result">
            insert into prescription (visit_id, drug_id, quantity)
            values (${visit_id}, ${drug_id},${quantity})
            </sql:update> 
        
        
        <sql:query dataSource="${snapshot}" var="dr">
            SELECT drug_id, drug_name
            FROM drug
            ORDER BY drug_name
            </sql:query>
            <hr>
            <jsp:directive.include file="patientdata.jsp"/>
            <hr> 
            <form name="service" action="saveprescription.jsp" method="POST">
               
         <table border="0" cellpadding="10" >  
             <caption>
                
            </caption>
             
                 <tr><th align="left"></th><td><input type="hidden" name="visit_id" value="<%= vi.getVisit_id() %>"> </td> </tr>
                 
            
                 <tr><th align="left">Drug </th><td> 
                <select name="drug_id">
                  
                 <option value="">[Please select Drug]</option>
             
                 <c:forEach var="row" items="${dr.rows}">
                <option value="${row.drug_id}">${row.drug_name}</option>
  		</c:forEach> 
                </select> 
  
                     </td> </tr>
                 <tr><th align="left">Quantity</th><td><input type="text" name="quantity"> </td> </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
         
            </table>
            </form>
              
             <sql:query dataSource="${snapshot}" var="show_drugs">
             SELECT prescription.visit_id, drug.drug_no, drug.drug_name, drug_form.drug_form, prescription.quantity
             FROM prescription, drug, drug_form
             WHERE prescription.drug_id = drug.drug_id
             AND drug.drug_form_id = drug_form.drug_form_id
             AND prescription.visit_id = ${visit_id}
             </sql:query>
             
             <table border="0" cellpadding="10"  >
        
         <tr>
             <th>Drug Code</th>
            <th>Drug</th>
            <th>Drug Form</th>
            <th>Quantity</th>
            <th>Edit</th>

         </tr>
         
         <c:forEach var="row" items="${show_drugs.rows}">
         <tr>   
             <td><c:out value="${row.drug_no}"/></td>
             <td><c:out value="${row.drug_name}"/></td>
             <td><c:out value="${row.drug_form}"/></td>
            <td><c:out value="${row.quantity}"/></td>

            
            <td><a href="<c:url value="patient.jsp?patient_id=${row.patient_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
         </div>
       
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>
