<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">

<div>
  <h2 class="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
    ${param.title}
  </h2>
  <table class="min-w-full border border-gray-300">
    <tbody>
      <tr>
        <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
          Medición de presión (colocar valor psi) ALTA
        </td>
        <td class="py-2 px-2 border-b border-gray-300">
          <input type="number" name="${param.prefix}-alta" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/>
        </td>
      </tr>
      <tr class="bg-gray-50">
        <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
          Medición de presión (colocar valor psi) BAJA
        </td>
        <td class="py-2 px-2 border-b border-gray-300">
          <input type="number" name="${param.prefix}-baja" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/>
        </td>
      </tr>
    </tbody>
  </table>
</div>
