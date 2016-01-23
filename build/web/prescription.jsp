<%-- 
    Document   : prescription
    Created on : Jan 22, 2016, 5:39:41 AM
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
           
            
           <hr>
            <jsp:directive.include file="patientdata.jsp"/>
            <hr>
            
            
            
            <sql:query dataSource="${snapshot}" var="dr">
            SELECT drug_id, drug_name
            FROM drug
            ORDER BY drug_name
            </sql:query>
            
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
         
</div>
       
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>
