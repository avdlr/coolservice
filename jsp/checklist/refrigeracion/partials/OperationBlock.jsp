<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="base" value="${fn:replace(param.title,' ','_')}" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">

<div>
  <h2 class="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
    ${param.title}
  </h2>
  <table class="min-w-full border border-gray-300">
    <tbody>
      <tr>
        <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Voltage</td>
        <td class="py-2 px-2 border-b border-r border-gray-300">
          <input type="number" name="${base}_voltage_AB" placeholder="AB" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" value="${savedData[fn:concat(base,'_voltage_AB')]}"/>
        </td>
        <td class="py-2 px-2 border-b border-r border-gray-300">
          <input type="number" name="${base}_voltage_BC" placeholder="BC" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" value="${savedData[fn:concat(base,'_voltage_BC')]}"/>
        </td>
        <td class="py-2 px-2 border-b border-gray-300">
          <input type="number" name="${base}_voltage_CA" placeholder="CA" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" value="${savedData[fn:concat(base,'_voltage_CA')]}"/>
        </td>
      </tr>
      <tr class="bg-gray-50">
        <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Amperage</td>
        <td class="py-2 px-2 border-b border-r border-gray-300">
          <input type="number" name="${base}_amp_A" placeholder="A" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" value="${savedData[fn:concat(base,'_amp_A')]}"/>
        </td>
        <td class="py-2 px-2 border-b border-r border-gray-300">
          <input type="number" name="${base}_amp_B" placeholder="B" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" value="${savedData[fn:concat(base,'_amp_B')]}"/>
        </td>
        <td class="py-2 px-2 border-b border-gray-300">
          <input type="number" name="${base}_amp_C" placeholder="C" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" value="${savedData[fn:concat(base,'_amp_C')]}"/>
        </td>
      </tr>
    </tbody>
  </table>
</div>
