<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="clases.Activity"%>
<%@ page import="clases.Section"%>
<%@ include file="checklist/refrigeracion/loadData.jspf" %>

<html>
<head>
    <title>Mantenimiento Refrigeracion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
</head>
<body>

<form id="refrigeracionForm" method="post" action="<%= request.getContextPath() %>/refrigeracion-form/save">
<div class="container mx-auto">
    <%-- Static header --%>
    <jsp:include page="checklist/refrigeracion/Header.jsp" />

    <%-- Dynamic checklist sections --%>
       
    <c:forEach var="section" items="${sections}">
        <c:set var="sectionTitle" value="${section.title}" scope="request" />
        <c:set var="activities" value="${section.activities}" scope="request" />
        <c:set var="sectionId" value="${section.id}" scope="request" />
        <c:set var="bienMalOnly" value="${section.id eq 'puerta'}" scope="request" />
        <jsp:include page="checklist/refrigeracion/ChecklistSection.jsp" />
    </c:forEach>

    <%-- Static footer sections --%>
    <jsp:include page="checklist/refrigeracion/OperationReadings.jsp" />
    <jsp:include page="checklist/refrigeracion/ServicesSection.jsp" />
    <jsp:include page="checklist/refrigeracion/SignatureSection.jsp" />

    <div class="my-4 text-center">
        <button type="submit" id="saveButton" class="btn btn-primary" disabled>Guardar</button>
        <button type="button" id="downloadPdf" class="btn btn-secondary ms-2">Descargar PDF</button>
    </div>

</div>
</form>
<script>
document.addEventListener('DOMContentLoaded', async function () {
    const form = document.getElementById('refrigeracionForm');
    const ordenInput = document.getElementById('ordenServicio');
    if (ordenInput && ordenInput.value) {
        try {
            const resp = await fetch(form.action + '?ordenServicio=' + encodeURIComponent(ordenInput.value));
            if (resp.ok) {
                const data = await resp.json();
                Object.entries(data).forEach(([key, value]) => {
                    const inputs = form.querySelectorAll(`[name='${key}']`);
                    inputs.forEach(input => {
                        if (input.type === 'checkbox' || input.type === 'radio') {
                            if (Array.isArray(value)) {
                                input.checked = value.includes(input.value);
                            } else {
                                input.checked = input.value === String(value) || value === true || value === 'on';
                            }
                        } else {
                            input.value = value;
                        }
                    });
                });
            }
        } catch (err) {
            console.error('Unable to load saved data', err);
        }
    }

    form.addEventListener('submit', async function (e) {
        e.preventDefault();
       const formData = new FormData(form);
       const resp = await fetch(form.action, { method: 'POST', body: formData });
       const text = await resp.text();
       alert(text);
    });

    const pdfBtn = document.getElementById('downloadPdf');
    if (pdfBtn) {
        pdfBtn.addEventListener('click', function () {
            const { jsPDF } = window.jspdf;
            html2canvas(form).then(canvas => {
                const imgData = canvas.toDataURL('image/png');
                const pdf = new jsPDF('p', 'pt', 'a4');
                const pdfWidth = pdf.internal.pageSize.getWidth();
                const pdfHeight = canvas.height * pdfWidth / canvas.width;
                pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
                pdf.save('refrigeracion-form.pdf');
            });
        });
    }
});
</script>
</body>
</html>
