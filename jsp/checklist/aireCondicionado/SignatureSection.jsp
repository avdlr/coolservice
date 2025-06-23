<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../assets/css/checklist.css">

<div class="mt-10 grid grid-cols-1 md:grid-cols-2 gap-8">

  <%-- Technician Signature Section --%>
  <div class="border border-gray-300 rounded-md p-4">
    <h3 class="text-md font-bold text-gray-700 mb-4">Nombre y Firma del Técnico</h3>

    <div class="mb-4">
      <label class="block text-sm font-medium text-gray-700 mb-1">Nombre completo:</label>
      <input type="text" name="nombreTecnico" class="w-full border-gray-300 rounded-md focus:border-blue-500 focus:ring-blue-500" />
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
      </div>
      <input type="hidden" name="firmaTecnico" id="techData" />
    </div>
  </div>

  <%-- Manager Signature Section --%>
  <div class="border border-gray-300 rounded-md p-4">
    <h3 class="text-md font-bold text-gray-700 mb-4">Nombre y Firma del Gerente de Unidad</h3>

    <div class="mb-4">
      <label class="block text-sm font-medium text-gray-700 mb-1">Nombre completo:</label>
      <input type="text" name="nombreGerente" class="w-full border-gray-300 rounded-md focus:border-blue-500 focus:ring-blue-500" />
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
      </div>
      <input type="hidden" name="firmaGerente" id="managerData" />
    </div>
  </div>

</div>

<script>
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
      ctx.strokeStyle = '#1f2937'; // Tailwind gray-800
      ctx.lineWidth = 2;
      ctx.stroke();
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
  }

  window.onload = function() {
    initSignatureCanvas('techCanvas');
    initSignatureCanvas('managerCanvas');
    const form = document.querySelector('form');
    if (form) {
      form.addEventListener('submit', () => {
        const techCanvas = document.getElementById('techCanvas');
        const managerCanvas = document.getElementById('managerCanvas');
        document.getElementById('techData').value = techCanvas.toDataURL();
        document.getElementById('managerData').value = managerCanvas.toDataURL();
      });
    }
  };
</script>
