<%-- 
    Document   : displaybean
    Created on : Mar 8, 2016, 7:55:13 PM
    Author     : Gitobu
--%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<jsp:useBean id="vi" class="com.clinic.Visit" scope="session" />
<jsp:useBean id="pa" class="com.clinic.Patient" scope="session" />
<html>
<head><title>Bean property display</title></head>
<body>
<h2>Here are the Bean properties</h2>

Visit id <%= vi.getVisit_id() %> 

Patient Id <%=  pa.getPatient_id() %>


</body>
</html>
