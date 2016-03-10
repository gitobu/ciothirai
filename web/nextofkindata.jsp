<%-- 
    Document   : nextofkindata
    Created on : Mar 8, 2016, 8:33:12 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>

<!DOCTYPE html>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            
        th { background-color:#FFF;
	color:black;
	text-align:left}
	
        tr { background-color:white;
	color:black;
	text-align:left}
        hr { 
        display: block;
        margin-top: 0.5em;
        margin-bottom: 0.5em;
        margin-left: auto;
        margin-right: auto;
        border-style: inset;
        border-width: 1px;
        } 
         
        </style>
    </head>
    <body>
        <sql:query dataSource="${snapshot}" var="nok_list">

        select p.patient_id, CONCAT(p.first_name,' ', p.last_name) as patient, CONCAT(pr.first_name,' ', pr.last_name) as next_of_kin,  r.relationship, pr.phone, p.national_id, 
        case 
            when pr.gender = 1 then 'Female'
            when pr.gender = 2 then 'Male' 
        end as gender
        from  next_of_kin nok inner join  patient p on (nok.patient_id = p.patient_id and p.patient_id = <%= pa.getPatient_id() %>)
        inner join patient pr on nok.kin_patient_id = pr.patient_id
        inner join relationship r on nok.relationship_id = r.relationship_id;
        
        </sql:query>
        
       
        <table border="0" cellpadding="10"  >
        
         <tr>
             <th>Name</th>
            <th>Relationship</th>
           <th>Phone number</th>
           <th>National Id</th>
           <th>Gender</th>
            

         </tr>
         
         <c:forEach var="row" items="${nok_list.rows}">
         <tr>   
             <td><c:out value="${row.next_of_kin}"/></td>
             <td><c:out value="${row.relationship}"/></td>
             <td><c:out value="${row.phone}"/></td>           
            <td><c:out value="${row.national_id}"/></td>
            <td><c:out value="${row.gender}"/></td>
            
            
         </tr>
         </c:forEach>
         </table>
           

         
        
    </body>
</html>
