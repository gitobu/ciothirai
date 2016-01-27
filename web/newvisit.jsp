<%-- 
    Document   : newvisit
    Created on : Jan 26, 2016, 9:37:07 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
       <form name="patient" action="visit.jsp" method="POST">
            <input type="submit" value="New visit">
             
       
          
            
            
           
            <input type="hidden" name="patient_id" value="<%= pa.getPatient_id() %>">
           
        
            
            
        </form>
    </body>
</html>
