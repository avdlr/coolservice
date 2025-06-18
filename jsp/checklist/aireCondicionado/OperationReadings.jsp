<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="mb-8">
  <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

    <%-- Operation: Juegos --%>
    <jsp:include page="partials/OperationBlock.jsp">
      <jsp:param name="title" value="Verificar condiciones de operación eléctrica de juegos"/>
    </jsp:include>

    <%-- Operation: Cocina --%>
    <jsp:include page="partials/OperationBlock.jsp">
      <jsp:param name="title" value="Verificar condiciones de operación de cocina"/>
    </jsp:include>

    <%-- Pressure: Juegos --%>
    <jsp:include page="partials/PressureBlock.jsp">
      <jsp:param name="title" value="Lecturas de presiones de operación de juegos"/>
    </jsp:include>

    <%-- Pressure: Cocina --%>
    <jsp:include page="partials/PressureBlock.jsp">
      <jsp:param name="title" value="Lecturas de presiones de operación de cocina"/>
    </jsp:include>

    <%-- Operation: Comedor --%>
    <jsp:include page="partials/OperationBlock.jsp">
      <jsp:param name="title" value="Verificar condiciones de operación eléctrica de comedor"/>
    </jsp:include>

    <%-- Operation: Baños --%>
    <jsp:include page="partials/OperationBlock.jsp">
      <jsp:param name="title" value="Verificar condiciones de operación eléctrica de baños"/>
    </jsp:include>

    <%-- Pressure: Comedor --%>
    <jsp:include page="partials/PressureBlock.jsp">
      <jsp:param name="title" value="Lecturas de presiones de operación de comedor"/>
    </jsp:include>

    <%-- Pressure: Baños --%>
    <jsp:include page="partials/PressureBlock.jsp">
      <jsp:param name="title" value="Lecturas de presiones de operación de baños"/>
    </jsp:include>

  </div>
</div>
