import React from 'react';

const OperationReadings: React.FC = () => {
  return (
    <div className="mb-8">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <h2 className="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
            Verificar condiciones de operaciónes conservacion
          </h2>
          <table className="min-w-full border border-gray-300">
            <tbody>
              <tr>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Voltage
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number"
                    placeholder="AB"
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    placeholder="BC"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-2 border-b border-gray-300">
                  <input 
                    placeholder="CA"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>
              <tr className="bg-gray-50">
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Amperage
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    placeholder="A"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    placeholder="B"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-2 border-b border-gray-300">
                  <input 
                    placeholder="C"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>

               <tr>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Superheat compresor
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Temp. Inyeccion
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>

              <tr className="bg-gray-50">
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Temp. Succion
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                 <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Temp. Retorno
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>

               <tr>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Medicion de presion (ALTA)    PSI
                </td>
                <td className="py-2 px-2 border-b border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Medicion de presion (BAJA)    PSI
                </td>
                <td className="py-2 px-2 border-b border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>                 
              </tr>             
            </tbody>
          </table>
        </div>

        <div>
          <h2 className="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
            Verificar condiciones de operaciónes freezer
          </h2>
          <table className="min-w-full border border-gray-300">            
            <tbody>
              <tr>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Voltage
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    placeholder="AB"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    placeholder="BC"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-2 border-b border-gray-300">
                  <input 
                    placeholder="CA"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>
              <tr className="bg-gray-50">
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Amperage
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    placeholder="A"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    placeholder="B"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-2 border-b border-gray-300">
                  <input 
                    placeholder="C"
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>

               <tr>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Superheat compresor
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
               <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Temp. Inyeccion
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>

              <tr className="bg-gray-50">
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Temp. Succion
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Temp. Retorno
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>

               <tr>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Medicion de presion (ALTA)    PSI
                </td>
                <td className="py-2 px-2 border-b border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm font-medium text-gray-700">
                  Medicion de presion (BAJA)    PSI
                </td>
                <td className="py-2 px-2 border-b border-gray-300">
                  <input 
                    type="number" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-blue-500 focus:ring-blue-500" 
                  />
                </td>
              </tr>                    
            </tbody>
          </table>
        </div>
        
      </div>
    </div>
  );
};

export default OperationReadings;