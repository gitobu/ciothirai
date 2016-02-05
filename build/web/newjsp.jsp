<%-- 
    Document   : newjsp
    Created on : Feb 4, 2016, 8:18:08 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <a href="patientdata.jsp"></a>
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
        
       <ul>
  <li><a href="#home">Home</a></li>
  <li><a href="#news">News</a></li>
  <li><a href="#contact">Contact</a></li>
 
    <li><a href="#about">About</a></li>
    <li><a href="#login">Login</a></li>
 
</ul>
    </body>
</html>
