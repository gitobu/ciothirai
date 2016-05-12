<%-- 
    Document   : menubar
    Created on : Jan 19, 2016, 12:58:15 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html>
     <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>JSP Page</title>
     
     <style type="text/css">
            ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #333;
        }

        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        /* Change the link color to #111 (black) on hover */
        li a:hover {
            background-color: #111;
        }
        .active {
            background-color: #4CAF50;
        }
        /* Add a gray right border to all list items, except the last item (last-child) */
        li {
            border-right: 1px solid #bbb;
        }

        li:last-child {
            border-right: none;
        }

        </style>
     </head>
     <body>
         <div id="nav">
             <ul>
                 <li><a href="searchpatient.jsp">Search Patient</a></li>
                 <li><a href="patient.jsp"> New Patient</a></li>
                 
                 <li><a href="jobTitle.jsp">Job Title</a></li>
                 <li><a href="provider.jsp">Clinic Personnel</a></li>
                 <li><a href="drugForm.jsp">Drug Form</a></li>
                 <li><a href="drug.jsp">Drug</a></li>
                 <li><a href="relationship.jsp">Relationship</a></li>
                 <li><a href="servicetype.jsp">Service Type</a></li>
                 <li><a href="inventory.jsp">Inventory</a></li>
                 <li><a href="reports.jsp">Reports</a></li>
             </ul>
         </div>
     </body>
 </html>
