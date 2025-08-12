<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="loadData.jspf" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">

<div class="mb-8">
  <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

    <%-- Operation: Juegos --%>
    <jsp:include page="partials/OperationBlock.jsp">
      <jsp:param name="title" value="Verificar condiciones de operación eléctrica de juegos"/>
      <jsp:param name="base" value="juegos"/>
    </jsp:include>

    <%-- Operation: Cocina --%>
    <jsp:include page="partials/OperationBlock.jsp">
      <jsp:param name="title" value="Verificar condiciones de operación de cocina"/>
      <jsp:param name="base" value="cocina"/>
    </jsp:include>

    <%-- Pressure: Juegos --%>
    <jsp:include page="partials/PressureBlock.jsp">
      <jsp:param name="title" value="Lecturas de presiones de operación de juegos"/>
      <jsp:param name="base" value="juegos"/>
    </jsp:include>

    <%-- Pressure: Cocina --%>
    <jsp:include page="partials/PressureBlock.jsp">
      <jsp:param name="title" value="Lecturas de presiones de operación de cocina"/>
      <jsp:param name="base" value="cocina"/>
    </jsp:include>

    <%-- Operation: Comedor --%>
    <jsp:include page="partials/OperationBlock.jsp">
      <jsp:param name="title" value="Verificar condiciones de operación eléctrica de comedor"/>
      <jsp:param name="base" value="comedor"/>
    </jsp:include>

    <%-- Operation: Baños --%>
    <jsp:include page="partials/OperationBlock.jsp">
      <jsp:param name="title" value="Verificar condiciones de operación eléctrica de baños"/>
      <jsp:param name="base" value="banos"/>
    </jsp:include>

    <%-- Pressure: Comedor --%>
    <jsp:include page="partials/PressureBlock.jsp">
      <jsp:param name="title" value="Lecturas de presiones de operación de comedor"/>
      <jsp:param name="base" value="comedor"/>
    </jsp:include>

    <%-- Pressure: Baños --%>
    <jsp:include page="partials/PressureBlock.jsp">
      <jsp:param name="title" value="Lecturas de presiones de operación de baños"/>
      <jsp:param name="base" value="banos"/>
    </jsp:include>

  </div>
</div>
