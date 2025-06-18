<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<div>
  <h2 class="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
    ${param.title}
  </h2>
  <table class="min-w-full border border-gray-300">
    <tbody>
      <tr>
        <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Voltage</td>
        <td class="py-2 px-2 border-b border-r border-gray-300">
          <input type="number" placeholder="AB" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/>
        </td>
        <td class="py-2 px-2 border-b border-r border-gray-300">
          <input type="number" placeholder="BC" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/>
        </td>
        <td class="py-2 px-2 border-b border-gray-300">
          <input type="number" placeholder="CA" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/>
        </td>
      </tr>
      <tr class="bg-gray-50">
        <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Amperage</td>
        <td class="py-2 px-2 border-b border-r border-gray-300">
          <input type="number" placeholder="A" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/>
        </td>
        <td class="py-2 px-2 border-b border-r border-gray-300">
          <input type="number" placeholder="B" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/>
        </td>
        <td class="py-2 px-2 border-b border-gray-300">
          <input type="number" placeholder="C" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/>
        </td>
      </tr>
    </tbody>
  </table>
</div>
