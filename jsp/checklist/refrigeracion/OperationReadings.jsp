<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../assets/css/checklist.css">

<div class="mb-8">
  <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
    <div>
      <h2 class="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
        Verificar condiciones de operaciónes conservacion
      </h2>
      <table class="min-w-full border border-gray-300">
        <tbody>
          <tr>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Voltage</td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="cons-voltage-ab" placeholder="AB" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="cons-voltage-bc" placeholder="BC" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="cons-voltage-ca" placeholder="CA" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
          <tr class="bg-gray-50">
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Amperage</td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="cons-amp-a" placeholder="A" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="cons-amp-b" placeholder="B" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="cons-amp-c" placeholder="C" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
          <tr>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Superheat compresor</td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="cons-superheat" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Temp. Inyeccion</td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="cons-temp-inyeccion" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
          <tr class="bg-gray-50">
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Temp. Succion</td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="cons-temp-succion" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Temp. Retorno</td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="cons-temp-retorno" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
          <tr>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Medicion de presion (ALTA)    PSI</td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="cons-presion-alta" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Medicion de presion (BAJA)    PSI</td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="cons-presion-baja" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
        </tbody>
      </table>
    </div>

    <div>
      <h2 class="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
        Verificar condiciones de operaciónes freezer
      </h2>
      <table class="min-w-full border border-gray-300">
        <tbody>
          <tr>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Voltage</td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="freezer-voltage-ab" placeholder="AB" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="freezer-voltage-bc" placeholder="BC" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="freezer-voltage-ca" placeholder="CA" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
          <tr class="bg-gray-50">
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Amperage</td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="freezer-amp-a" placeholder="A" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="freezer-amp-b" placeholder="B" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="freezer-amp-c" placeholder="C" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
          <tr>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Superheat compresor</td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="freezer-superheat" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Temp. Inyeccion</td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="freezer-temp-inyeccion" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
          <tr class="bg-gray-50">
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Temp. Succion</td>
            <td class="py-2 px-2 border-b border-r border-gray-300"><input type="number" name="freezer-temp-succion" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Temp. Retorno</td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="freezer-temp-retorno" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
          <tr>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Medicion de presion (ALTA)    PSI</td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="freezer-presion-alta" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">Medicion de presion (BAJA)    PSI</td>
            <td class="py-2 px-2 border-b border-gray-300"><input type="number" name="freezer-presion-baja" class="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500"/></td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>
</div>
