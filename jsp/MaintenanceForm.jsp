<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="clases.Activity"%>
<%@ page import="clases.Section"%>
<%@ page import="servlet.MaintenanceFormServlet"%>

<html>
<head>
    <title>Mantenimiento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/checklist.css">
        <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">
</head>
<body>

<div class="container mx-auto">
    <%-- Static header --%>
    <jsp:include page="checklist/aireCondicionado/Header.jsp" />

    <%-- Dynamic checklist sections --%>
    <c:forEach var="section" items="${sections}">
        <c:set var="sectionTitle" value="${section.title}" scope="request" />
        <c:set var="activities" value="${section.activities}" scope="request" />
        <jsp:include page="checklist/aireCondicionado/ChecklistSection.jsp" />
    </c:forEach>

    <%-- Static footer sections --%>
    <jsp:include page="checklist/aireCondicionado/OperationReadings.jsp" />
    <jsp:include page="checklist/aireCondicionado/ServicesSection.jsp" />
    <jsp:include page="checklist/aireCondicionado/SignatureSection.jsp" />
    
</div>

</body>
</html>

