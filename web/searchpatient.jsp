<%-- 
    Document   : searchpatient
    Created on : Jan 23, 2016, 11:18:29 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find patient</title>
  <style type="text/css">
        table {alignment-adjust: middle;
		}
        
        th { background-color:#FFF;
	color:black;
	text-align:left}
	
        tr { background-color:white;
	color:black;
	text-align:left}
            
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
        <form action="listpatient.jsp" method="POST">
            <table border="0" >
                <caption><h3>Find a patient</h3></caption>
                <tr><th>Select search criteria</th><td>
            <select name="method">
                 <option value="1">National Id</option>
                 <option value="2">Phone Number</option>
                 <option value="3">Patient Number</option>
                 <option value="4">Last Name</option>
            </select>
                    </td><td><input type="text" name="search"></td><td><input type="submit" value="Search"></td></tr>
           </table> 
        </form>
        </div>
        <div id="footer">
            
        
       <jsp:directive.include file="footer.html"/>
      
        </div>
    </body>
</html>
