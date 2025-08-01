<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="clases.Activity"%>
<%@ page import="clases.Section"%>

<html>
<head>
    <title>Mantenimiento de Aire Condicionado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">
</head>
<body>

<form method="post" action="maintenance-form/save">
<div class="container mx-auto">
    <%-- Static header --%>
    <jsp:include page="checklist/aireCondicionado/Header.jsp" />

    <%-- Dynamic checklist sections --%>
    <c:forEach var="section" items="${sections}">
        <c:set var="sectionTitle" value="${section.title}" scope="request" />
        <c:set var="activities" value="${section.activities}" scope="request" />
        <c:set var="sectionId" value="${section.id}" scope="request" />
        <c:set var="bienMalOnly" value="${section.id eq 'ducteria'}" scope="request" />
        <jsp:include page="checklist/aireCondicionado/ChecklistSection.jsp" />
    </c:forEach>

    <%-- Static footer sections --%>
    <jsp:include page="checklist/aireCondicionado/OperationReadings.jsp" />
    <jsp:include page="checklist/aireCondicionado/ServicesSection.jsp" />
    <jsp:include page="checklist/aireCondicionado/SignatureSection.jsp" />

    <div class="my-4 text-center">
        <button type="submit" id="saveButton" class="btn btn-primary" disabled>Guardar</button>
    </div>

</div>
</form>

</body>
</html>

