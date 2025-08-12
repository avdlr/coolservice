<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loadData.jspf" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">

<div class="mt-10 grid grid-cols-1 md:grid-cols-2 gap-8">

  <%-- Technician Signature Section --%>
  <div class="border border-gray-300 rounded-md p-4">
    <h3 class="text-md font-bold text-gray-700 mb-4">Nombre y Firma del Técnico</h3>

    <div class="mb-4">
      <label class="block text-sm font-medium text-gray-700 mb-1">Nombre completo:</label>
      <input type="text" name="technicianName" class="w-full border-gray-300 rounded-md focus:border-blue-500 focus:ring-blue-500" value="${savedData.technicianName}" />
    </div>

    <div>
      <div class="flex justify-between items-center mb-1">
        <label class="block text-sm font-medium text-gray-700">Firma:</label>
        <button onclick="clearCanvas('techCanvas')" class="text-red-500 hover:text-red-600 flex items-center text-sm">
          ✖ Limpiar
        </button>
      </div>

      <div class="border-2 border-dashed border-gray-300 rounded-md h-32 bg-gray-50 flex items-center justify-center">
        <canvas id="techCanvas" width="400" height="120" class="bg-white rounded-md border border-gray-300"></canvas>
        <input type="hidden" name="technicianSignature" id="technicianSignature" value="${savedData.technicianSignature}" />
      </div>
    </div>
  </div>

  <%-- Manager Signature Section --%>
  <div class="border border-gray-300 rounded-md p-4">
    <h3 class="text-md font-bold text-gray-700 mb-4">Nombre y Firma del Gerente de Unidad</h3>

    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700 mb-1">Nombre completo:</label>
        <input type="text" name="managerName" class="w-full border-gray-300 rounded-md focus:border-blue-500 focus:ring-blue-500" value="${savedData.managerName}" />
    </div>

    <div>
      <div class="flex justify-between items-center mb-1">
        <label class="block text-sm font-medium text-gray-700">Firma:</label>
        <button onclick="clearCanvas('managerCanvas')" class="text-red-500 hover:text-red-600 flex items-center text-sm">
          ✖ Limpiar
        </button>
      </div>

      <div class="border-2 border-dashed border-gray-300 rounded-md h-32 bg-gray-50 flex items-center justify-center">
        <canvas id="managerCanvas" width="400" height="120" class="bg-white rounded-md border border-gray-300"></canvas>
        <input type="hidden" name="managerSignature" id="managerSignature" value="${savedData.managerSignature}" />
      </div>
    </div>
  </div>

</div>

<script>
  let techSigned = false;
  let managerSigned = false;

  function checkFormValidity() {
    const saveBtn = document.getElementById('saveButton');
    const techName = document.querySelector('input[name="technicianName"]');
    const managerName = document.querySelector('input[name="managerName"]');

    const valid = techName.value.trim() !== '' &&
                  managerName.value.trim() !== '' &&
                  techSigned && managerSigned;
    if (saveBtn) {
      saveBtn.disabled = !valid;
    }
  }

  function initSignatureCanvas(canvasId) {
    const canvas = document.getElementById(canvasId);
    const ctx = canvas.getContext('2d');
    let drawing = false;

    const startDrawing = (e) => {
      drawing = true;
      ctx.beginPath();
      ctx.moveTo(e.offsetX, e.offsetY);
    };

    const draw = (e) => {
      if (!drawing) return;
      ctx.lineTo(e.offsetX, e.offsetY);
      ctx.strokeStyle = '#1f2937';
      ctx.lineWidth = 2;
      ctx.stroke();

      if (canvasId === 'techCanvas') techSigned = true;
      if (canvasId === 'managerCanvas') managerSigned = true;
      checkFormValidity();
    };

    const stopDrawing = () => {
      drawing = false;
    };

    canvas.addEventListener('mousedown', startDrawing);
    canvas.addEventListener('mousemove', draw);
    canvas.addEventListener('mouseup', stopDrawing);
    canvas.addEventListener('mouseleave', stopDrawing);
  }

  function clearCanvas(canvasId) {
    const canvas = document.getElementById(canvasId);
    const ctx = canvas.getContext('2d');
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    if (canvasId === 'techCanvas') {
      techSigned = false;
      document.getElementById('technicianSignature').value = '';
    }
    if (canvasId === 'managerCanvas') {
      managerSigned = false;
      document.getElementById('managerSignature').value = '';
    }
    checkFormValidity();
  }

  document.addEventListener('DOMContentLoaded', function() {
    initSignatureCanvas('techCanvas');
    initSignatureCanvas('managerCanvas');

    document.querySelector('input[name="technicianName"]').addEventListener('input', checkFormValidity);
    document.querySelector('input[name="managerName"]').addEventListener('input', checkFormValidity);

    checkFormValidity();

    const form = document.getElementById('maintenanceForm') || document.getElementById('refrigeracionForm') || document.querySelector('form');
    if (form) {
      form.addEventListener('submit', function() {
        document.getElementById('technicianSignature').value = document.getElementById('techCanvas').toDataURL('image/png');
        document.getElementById('managerSignature').value = document.getElementById('managerCanvas').toDataURL('image/png');
      });
    }
  });
</script>
