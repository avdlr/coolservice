<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loadData.jspf" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">

<div class="mb-8">
  <div class="flex justify-between items-center mb-6">

    <h1 class="text-2xl font-bold text-[#005c9b]">      
      <img src="<%= request.getContextPath() %>/assets/img/cool_service_logox2.jpeg" alt="Cool Service Logo" style="height: 48px; display: inline-block; vertical-align: middle; margin-left: 16px;">
    </h1>

    <div class="text-sm font-semibold text-center">
      INSTALACION - SERVICIO - MANTENIMIENTO
      <div class="text-sm font-semibold">REFRIGERACION Y AIRE CONDICIONADO</div>
    </div>

    <div class="text-sm font-semibold text-right">
      BENJAMIN ALBERTO TORRES FLORES
      <div class="text-sm font-semibold">AV. SAN CRISTOBAL #12555-4</div>
      <div class="text-sm font-semibold">FRACC. LOMAS DE SAN MARTIN</div>
      <div class="text-sm font-semibold">TIJUANA, B.C.</div>
    </div>

    <div class="w-24"></div>
  </div>

  <div class="mb-8">
    <h2 class="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
      BITÁCORA DE MANTENIMIENTO PREVENTIVO (AIRE ACONDICIONADO)
    </h2>

    <div class="grid grid-cols-3 gap-4 mb-6">
      <div class="col-span-2">
        <div class="mb-4">
          <label class="block text-sm font-semibold text-gray-700">Cliente</label>
          <input type="text" id="cliente" name="cliente" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" value="${not empty savedData.cliente ? savedData.cliente : (not empty param.cliente ? param.cliente : '')}" />
        </div>

        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-semibold text-gray-700">Área</label>
              <input type="text" name="area" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" value="${not empty savedData.area ? savedData.area : ''}" />
          </div>
          <div>
            <label class="block text-sm font-semibold text-gray-700">Plaza</label>
              <input type="text" name="plaza" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" value="${not empty savedData.plaza ? savedData.plaza : ''}" />
          </div>
        </div>
      </div>

      <div>
        <div class="grid grid-cols-2 gap-4 mb-4">
          <div>
            <label class="block text-sm font-semibold text-gray-700">Unidad</label>
              <input type="text" name="unidad" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" value="${not empty savedData.unidad ? savedData.unidad : ''}" />
          </div>
          <div>
            <label class="block text-sm font-semibold text-gray-700">Orden de servicio</label>
              <input type="text" id="ordenServicio" name="ordenServicio" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" value="${not empty savedData.ordenServicio ? savedData.ordenServicio : (not empty param.ordenServicio ? param.ordenServicio : (not empty param.orden ? param.orden : ''))}" />
          </div>
        </div>

        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-semibold text-gray-700">Fecha</label>
              <input type="date" id="fecha" name="fecha" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" value="${not empty savedData.fecha ? savedData.fecha : ''}" />
          </div>
          <div>
            <label class="block text-sm font-semibold text-gray-700">Hora de Entrada</label>
              <input type="time" id="hora" name="horaEntrada" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" value="${not empty savedData.horaEntrada ? savedData.horaEntrada : ''}" />
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  window.addEventListener('DOMContentLoaded', () => {
    const fechaInput = document.getElementById('fecha');
    const horaInput = document.getElementById('hora');
    const today = new Date();
    if (!fechaInput.value) {
      fechaInput.value = today.toISOString().split('T')[0];
    }
    if (!horaInput.value) {
      horaInput.value = today.toTimeString().substring(0, 5);
    }
  });
</script>
