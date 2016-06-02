<%-- 
    Document   : buttonbar
    Created on : May 24, 2016, 8:14:59 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <hr>
            <table border="0" cellpadding="10" align="left">
                <tr>
                    <td>
            <form name="patientdetails" action="patientdetails.jsp">  
                <input type="hidden" name="patient_id" value="<%= pa.getPatient_id() %>">
                            <input type="Submit" value="Patient Portal">
                        </form>
                    </td>
                    <td>
                     <form name="medical_history" action="medicalhistory.jsp">
                         
                                
                <input type="Submit" value="Add Medical History">
                
            </form>   
                        
                    </td>
                    <td>
            <form name="newvisit" action="visit.jsp">  
                            <input type="Submit" value="Add visit">
                        </form>
                    </td>
                   
                    <td>
                        
                       <form name="addnextofkin" action="addnextofkin.jsp">
                <input type="Submit" value="Add Next of Kin">
                
            </form> 
                    </td>
                    
                    <td>
                        
                       <form name="addappointment" action="appointment.jsp">
                <input type="Submit" value="Add Appointment">
                
            </form> 
                    </td>
             </table>   
    </body>
</html>
