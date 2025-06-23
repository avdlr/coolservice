<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/checklist.css">

<div class="mb-8">
  <div class="flex justify-between items-center mb-6">

    <h1 class="text-2xl font-bold text-[#005c9b]">      
      <img src="../assets/img/cool_service_logox2.jpeg" alt="Cool Service Logo" style="height: 48px; display: inline-block; vertical-align: middle; margin-left: 16px;">
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
          <input type="text" name="cliente" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" />
        </div>

        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-semibold text-gray-700">Área</label>
              <input type="text" name="area" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" />
          </div>
          <div>
            <label class="block text-sm font-semibold text-gray-700">Plaza</label>
              <input type="text" name="plaza" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" />
          </div>
        </div>
      </div>

      <div>
        <div class="mb-4">
          <label class="block text-sm font-semibold text-gray-700">Unidad</label>
          <input type="text" name="unidad" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" />
        </div>

        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-semibold text-gray-700">Fecha</label>
              <input type="date" id="fecha" name="fecha" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" />
          </div>
          <div>
            <label class="block text-sm font-semibold text-gray-700">Hora de Entrada</label>
              <input type="time" id="hora" name="hora" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm" />
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  window.addEventListener('DOMContentLoaded', () => {
    const today = new Date();
    document.getElementById('fecha').value = today.toISOString().split('T')[0];
    document.getElementById('hora').value = today.toTimeString().substring(0, 5);
  });
</script>