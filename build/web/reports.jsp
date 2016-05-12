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
        <title>Reports</title>
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
        
        <div style="float:left; width:55%;">
        <div style="float:top; height:45%;">
        <sql:query dataSource="${snapshot}" var="occurances">
        select case when primary_complaint like '%ose%' and primary_complaint like '%bleed%' then 'Nose bleeding' else primary_complaint
        end as complaint,count(visit_id) as occ
        from visit
        group by case when primary_complaint like '%ose%' and primary_complaint like '%bleed%' then 'Nose bleeding' else primary_complaint
        end having count(visit_id) >1
        order by count(visit_id) desc
        </sql:query> 
       
        <table border="0" cellpadding="10">
         <caption><h2>Illness cases</h2></caption>
         <tr>
            <th>Primary Complaint</th>
            <th>Number of Cases</th>
         </tr>
         <c:forEach var="row" items="${occurances.rows}">
         <tr>   
            <td><c:out value="${row.complaint}"/></td>
            <td align="center"><c:out value="${row.occ}"/></td>      
         </tr>
         </c:forEach>
         </table>
        
        </div>
        <div style="float:bottom; height:45%;">
       <sql:query dataSource="${snapshot}" var="inventory">
       select total_drugs.drug_name, df.drug_form,  total_drugs.quantity, dispensed.qty as drugs_dispensed, total_drugs.quantity - dispensed.qty balance
       from
            (select i.drug_id, d.drug_name, sum(i.quantity) quantity, d.drug_form_id
             from inventory i inner join drug d on i.drug_id = d.drug_id
             group by i.drug_id, d.drug_name, d.drug_form_id) total_drugs
            inner join 
            drug_form df on total_drugs.drug_form_id = df.drug_form_id
            left join 
            (select prescription.drug_id, drug.drug_name, count(prescription.quantity) as qty 
            from prescription inner join drug on prescription.drug_id = drug.drug_id
            inner join visit on prescription.visit_id = visit.visit_id
            group by drug.drug_name) dispensed
            on total_drugs.drug_id = dispensed.drug_id order by 1;
        </sql:query>   
         <table border="0" cellpadding="10">
         <caption><h2>Inventory</h2></caption>
         <tr>
            <th>Drug</th>
            <th>Drug form</th>
            <th>Inventory Quantity</th>
            <th>Drugs dispensed</th>
            <th>Drugs remaining</th>
 

         </tr>
         <c:forEach var="row" items="${inventory.rows}">
         <tr>   
            <td><c:out value="${row.drug_name}"/></td>
            <td><c:out value="${row.drug_form}"/></td>
            <td><c:out value="${row.quantity}"/></td>
            <td><c:out value="${row.qty}"/></td>
            <td><c:out value="${row.balance}"/></td>
         </tr>
         </c:forEach>
         </table>
        </div>
        </div>
        <div style="float:right; width:35%;">
         <div style="float:top; height:45%;">   
        <sql:query dataSource="${snapshot}" var="pat_by_age">    
        select bracket, count(patient_id) as no_of_patients 
        from age_brackets
        group by bracket
        order by ranking;   
        </sql:query>
        <table border="0" cellpadding="10">
         <caption><h2>Patients by age</h2></caption>
         <tr>
            <th>Age group</th>
            <th>Number of patients</th>
         
         </tr>
         <c:forEach var="row" items="${pat_by_age.rows}">
         <tr>   
            <td><c:out value="${row.bracket}"/></td>
            <td align="center"><c:out value="${row.no_of_patients}"/></td>

         </tr>
         </c:forEach>
         </table>
         </div>
         <div style="float:bottom; height:45%;">
        <sql:query dataSource="${snapshot}" var="pat_by_gender">
        select  case when gender = 1 then 'Female' else 'Male' end as gender_type, 
        count(patient_id) as no_of_patients 
        from patient group by case when gender = 1 then 'Female' else 'Male' end;
        </sql:query>
        <table border="0" cellpadding="10">
         <caption><h2>Patients by gender</h2></caption>
         <tr>
            <th>Gender</th>
            <th>Number of patients</th>
         </tr>
         <c:forEach var="row" items="${pat_by_gender.rows}">
         <tr>   
            <td><c:out value="${row.gender_type}"/></td>
            <td align="center"><c:out value="${row.no_of_patients}"/></td>
         </tr>
         </c:forEach>
         </table>
         </div>
        </div>
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>


