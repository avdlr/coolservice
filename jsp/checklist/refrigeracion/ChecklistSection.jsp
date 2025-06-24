<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/checklist.css">

<div class="mb-8">
  <h2 class="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
    ${sectionTitle}
  </h2>
  <div class="overflow-x-auto">
    <table class="min-w-full border border-gray-300">
    
      <thead>
        <tr class="bg-gray-100">
          <th class="w-1/3 py-2 px-4 border-b border-r border-gray-300 text-left text-sm font-medium text-gray-700">Actividad</th>
          <th class="py-2 px-2 border-b border-r border-gray-300 text-center text-sm font-medium text-gray-700">Bien</th>
          <th class="py-2 px-2 border-b border-gray-300 text-center text-sm font-medium text-gray-700">Mal</th>
        </tr>
      </thead>
      
      <tbody>
        <c:forEach var="activity" items="${activities}" varStatus="status">
          <tr class="${status.index % 2 == 0 ? 'bg-white' : 'bg-gray-50'}">
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm text-gray-800">
              ${activity.name}
            </td>

            <td class="py-2 px-2 border-b border-r border-gray-300 text-center">
              <div class="flex justify-center space-x-4">
                <label class="inline-flex items-center">
                  <input type="radio" name="status-${sectionTitle}-${status.index}-Bien" class="form-radio h-4 w-4 text-[#005c9b]" />
                  <span class="ml-1 text-sm text-gray-700">B</span>
                </label>
              </div>
            </td>
            <td class="py-2 px-2 border-b border-gray-300 text-center">
              <div class="flex justify-center space-x-4">
                <label class="inline-flex items-center">
                  <input type="radio" name="status-${sectionTitle}-${status.index}-Mal" class="form-radio h-4 w-4 text-red-600" />
                  <span class="ml-1 text-sm text-gray-700">M</span>
                </label>
              </div>
            </td>

          </tr>
        </c:forEach>
      </tbody>
    
      <thead>
        <tr class="bg-gray-100">
          <th class="w-1/3 py-2 px-4 border-b border-r border-gray-300 text-left text-sm font-medium text-gray-700">Actividad</th>
          <th class="py-2 px-2 border-b border-r border-gray-300 text-center text-sm font-medium text-gray-700">Conservacion</th>
          <th class="py-2 px-2 border-b border-gray-300 text-center text-sm font-medium text-gray-700">Freezer</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="activity" items="${activities}" varStatus="status">
          <tr class="${status.index % 2 == 0 ? 'bg-white' : 'bg-gray-50'}">
            <td class="py-2 px-4 border-b border-r border-gray-300 text-sm text-gray-800">
              ${activity.name}
            </td>

            <td class="py-2 px-2 border-b border-r border-gray-300 text-center">
              <div class="flex justify-center space-x-4">
                <label class="inline-flex items-center">
                  <input type="radio" name="status-${sectionTitle}-${status.index}-Conservacion" class="form-radio h-4 w-4 text-[#005c9b]" />
                  <span class="ml-1 text-sm text-gray-700">B</span>
                </label>
                <label class="inline-flex items-center">
                  <input type="radio" name="status-${sectionTitle}-${status.index}-Conservacion" class="form-radio h-4 w-4 text-red-600" />
                  <span class="ml-1 text-sm text-gray-700">M</span>
                </label>
              </div>
            </td>
            <td class="py-2 px-2 border-b border-gray-300 text-center">
              <div class="flex justify-center space-x-4">
                <label class="inline-flex items-center">
                  <input type="radio" name="status-${sectionTitle}-${status.index}-Freezer" class="form-radio h-4 w-4 text-[#005c9b]" />
                  <span class="ml-1 text-sm text-gray-700">B</span>
                </label>
                <label class="inline-flex items-center">
                  <input type="radio" name="status-${sectionTitle}-${status.index}-Freezer" class="form-radio h-4 w-4 text-red-600" />
                  <span class="ml-1 text-sm text-gray-700">M</span>
                </label>
              </div>
            </td>

          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>
