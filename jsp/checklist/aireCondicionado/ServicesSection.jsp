<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loadData.jspf" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">

<div class="mb-8">
  <h2 class="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
    Servicios a resolver
  </h2>

  <div class="overflow-x-auto">
    <table id="servicesTable" class="min-w-full border border-gray-300">
      <thead>
        <tr class="bg-gray-100">
          <th class="w-20 py-2 px-2 border-b border-r border-gray-300 text-center text-sm font-medium text-gray-700">
            Cantidad
          </th>
          <th class="w-1/4 py-2 px-4 border-b border-r border-gray-300 text-left text-sm font-medium text-gray-700">
            Refacciones
          </th>
          <th class="py-2 px-4 border-b border-r border-gray-300 text-left text-sm font-medium text-gray-700">
            Descripción de la falla y/o materiales requeridos
          </th>
          <th class="w-16 py-2 px-2 border-b border-gray-300 text-center text-sm font-medium text-gray-700">
            Acción
          </th>
        </tr>
      </thead>
      <tbody id="servicesBody">
        <c:choose>
          <c:when test="${not empty savedData['serviceQuantity[]']}">
            <c:set var="quantities" value="${savedData['serviceQuantity[]']}" />
            <c:set var="parts" value="${savedData['servicePart[]']}" />
            <c:set var="descs" value="${savedData['serviceDesc[]']}" />
            <c:forEach var="qty" items="${quantities}" varStatus="i">
              <tr>
                <td class="py-2 px-2 border-b border-r border-gray-300">
                  <input type="text" name="serviceQuantity[]" class="w-full text-center border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" value="${qty}" />
                </td>
                <td class="py-2 px-2 border-b border-r border-gray-300">
                  <input type="text" name="servicePart[]" class="w-full border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" value="${parts[i.index]}" />
                </td>
                <td class="py-2 px-2 border-b border-r border-gray-300">
                  <input type="text" name="serviceDesc[]" class="w-full border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" value="${descs[i.index]}" />
                </td>
                <td class="py-2 px-2 border-b border-gray-300 text-center">
                  <button class="text-red-500 hover:text-red-700 transition-colors" onclick="removeRow(this)">
                    ✖
                  </button>
                </td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td class="py-2 px-2 border-b border-r border-gray-300">
                <input type="text" name="serviceQuantity[]" class="w-full text-center border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" />
              </td>
              <td class="py-2 px-2 border-b border-r border-gray-300">
                <input type="text" name="servicePart[]" class="w-full border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" />
              </td>
              <td class="py-2 px-2 border-b border-r border-gray-300">
                <input type="text" name="serviceDesc[]" class="w-full border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" />
              </td>
              <td class="py-2 px-2 border-b border-gray-300 text-center">
                <button class="text-red-500 hover:text-red-700 transition-colors" onclick="removeRow(this)">
                  ✖
                </button>
              </td>
            </tr>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
  </div>

  <div class="mt-2 flex justify-end">
    <button 
      type="button"
      class="flex items-center px-3 py-1 text-sm bg-[#005c9b] text-white rounded hover:bg-[#004b7d] transition-colors"
      onclick="addNewRow()"
    >
      ➕ Agregar fila
    </button>
  </div>
</div>

<script>
  function addNewRow() {
    const tbody = document.getElementById('servicesBody');
    const newRow = document.createElement('tr');
    newRow.innerHTML = `
      <td class="py-2 px-2 border-b border-r border-gray-300">
        <input type="text" name="serviceQuantity[]" class="w-full text-center border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" />
      </td>
      <td class="py-2 px-2 border-b border-r border-gray-300">
        <input type="text" name="servicePart[]" class="w-full border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" />
      </td>
      <td class="py-2 px-2 border-b border-r border-gray-300">
        <input type="text" name="serviceDesc[]" class="w-full border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" />
      </td>
      <td class="py-2 px-2 border-b border-gray-300 text-center">
        <button class="text-red-500 hover:text-red-700 transition-colors" onclick="removeRow(this)">✖</button>
      </td>
    `;
    tbody.appendChild(newRow);
  }

  function removeRow(button) {
    const row = button.closest('tr');
    const tbody = document.getElementById('servicesBody');
    if (tbody.rows.length > 1) {
      tbody.removeChild(row);
    }
  }
</script>
