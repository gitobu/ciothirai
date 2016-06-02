<%-- 
    Document   : listservices
    Created on : Jun 1, 2016, 8:31:39 PM
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
        <title>JSP Page</title>
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
         <c:set var="visit_id" value = "${param.visit_id}"/>
          <jsp:setProperty name="vi" property="visit_id" value="${visit_id}"/>
          <jsp:directive.include file="patientdata.jsp"/>
            <hr>
          <jsp:directive.include file="visitdata.jsp"/>
            <hr>
         <jsp:directive.include file="servicedata.jsp"/>
            <hr>
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
           

         </tr>
         
         <c:forEach var="row" items="${show_drugs.rows}">
         <tr>   
             <td><c:out value="${row.drug_no}"/></td>
             <td><c:out value="${row.drug_name}"/></td>
             <td><c:out value="${row.drug_form}"/></td>
            <td><c:out value="${row.quantity}"/></td>

            
            
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