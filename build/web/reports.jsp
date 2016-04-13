<%-- 
    Document   : reports
    Created on : Apr 7, 2016, 8:00:47 PM
    Author     : Gitobu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient log</title>
        <link href="styleOne.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
        th { background-color:#FFF;
	color:black;
	text-align:left}
	
        tr { background-color:white;
	color:black;
	text-align:left}
        table{
            font-family: verdana, Garamond;
            font-size: 10pt;
            border-color: #6d6f7b;
            border-style: double;
        }
            
        </style>
    </head>
    <body>
        <div id="header">
            <jsp:directive.include file="header.html"/>
        </div>
        <div id="nav">
            <jsp:directive.include file="menubar.jsp"/>
        </div>
        <div id="section">
        
        
        <sql:query dataSource="${snapshot}" var="occurances">
        select case when primary_complaint like '%ose%' and primary_complaint like '%bleed%' then 'Nose bleeding' else primary_complaint
        end as complaint,count(visit_id) as occ
        from visit
        group by case when primary_complaint like '%ose%' and primary_complaint like '%bleed%' then 'Nose bleeding' else primary_complaint
        end having count(visit_id) >1
        order by count(visit_id) desc
        </sql:query>  
       
        <table border="0" cellpadding="10" align="center" >
         <caption><h2>Illness cases</h2></caption>
         <tr>
            <th>Primary Complaint</th>
            <th>Number of Cases</th>
 

         </tr>
         <c:forEach var="row" items="${occurances.rows}">
         <tr>   
            <td><c:out value="${row.complaint}"/></td>
            <td><c:out value="${row.occ}"/></td>
            
            
         </tr>
         </c:forEach>
         </table>
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>


