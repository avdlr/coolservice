import React, { useState } from 'react';
import { Plus, Trash2 } from 'lucide-react';

interface ServiceItem {
  id: number;
  quantity: string;
  parts: string;
  description: string;
}

const ServicesSection: React.FC = () => {
  const [serviceItems, setServiceItems] = useState<ServiceItem[]>([
    { id: 1, quantity: '', parts: '', description: '' }
  ]);

  const addNewRow = () => {
    const newId = serviceItems.length > 0 
      ? Math.max(...serviceItems.map(item => item.id)) + 1 
      : 1;
    
    setServiceItems([...serviceItems, { id: newId, quantity: '', parts: '', description: '' }]);
  };

  const removeRow = (id: number) => {
    if (serviceItems.length > 1) {
      setServiceItems(serviceItems.filter(item => item.id !== id));
    }
  };

  const updateItem = (id: number, field: keyof ServiceItem, value: string) => {
    setServiceItems(serviceItems.map(item => 
      item.id === id ? { ...item, [field]: value } : item
    ));
  };

  return (
    <div className="mb-8">
      <h2 className="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
        Servicios a resolver
      </h2>
      
      <div className="overflow-x-auto">
        <table className="min-w-full border border-gray-300">
          <thead>
            <tr className="bg-gray-100">
              <th className="w-20 py-2 px-2 border-b border-r border-gray-300 text-center text-sm font-medium text-gray-700">
                Cantidad
              </th>
              <th className="w-1/4 py-2 px-4 border-b border-r border-gray-300 text-left text-sm font-medium text-gray-700">
                Refacciones
              </th>
              <th className="py-2 px-4 border-b border-r border-gray-300 text-left text-sm font-medium text-gray-700">
                Descripción de la falla y/o materiales requeridos
              </th>
              <th className="w-16 py-2 px-2 border-b border-gray-300 text-center text-sm font-medium text-gray-700">
                Acción
              </th>
            </tr>
          </thead>
          <tbody>
            {serviceItems.map((item, index) => (
              <tr key={item.id} className={index % 2 === 0 ? 'bg-white' : 'bg-gray-50'}>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="text" 
                    className="w-full text-center border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" 
                    value={item.quantity}
                    onChange={(e) => updateItem(item.id, 'quantity', e.target.value)}
                  />
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="text" 
                    className="w-full border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" 
                    value={item.parts}
                    onChange={(e) => updateItem(item.id, 'parts', e.target.value)}
                  />
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300">
                  <input 
                    type="text" 
                    className="w-full border-gray-300 rounded-sm focus:border-[#005c9b] focus:ring-[#005c9b]" 
                    value={item.description}
                    onChange={(e) => updateItem(item.id, 'description', e.target.value)}
                  />
                </td>
                <td className="py-2 px-2 border-b border-gray-300 text-center">
                  <button 
                    className="text-red-500 hover:text-red-700 transition-colors"
                    onClick={() => removeRow(item.id)}
                  >
                    <Trash2 className="h-4 w-4" />
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      
      <div className="mt-2 flex justify-end">
        <button 
          className="flex items-center px-3 py-1 text-sm bg-[#005c9b] text-white rounded hover:bg-[#004b7d] transition-colors"
          onClick={addNewRow}
        >
          <Plus className="h-4 w-4 mr-1" /> Agregar fila
        </button>
      </div>
    </div>
  );
};

export default ServicesSection;