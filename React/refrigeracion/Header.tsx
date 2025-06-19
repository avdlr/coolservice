import React, { useState } from 'react';
import { CalendarIcon, Clock } from 'lucide-react';

const Header: React.FC = () => {
  const [currentDate] = useState(() => {
    const today = new Date();
    return today.toISOString().split('T')[0];
  });

  const [currentTime] = useState(() => {
    const now = new Date();
    return now.toTimeString().substring(0, 5);
  });

  return (
    <div className="mb-8">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold text-[#005c9b]">
          COOL SERVICE
        </h1>
        <div className="text-sm font-semibold text-center">
          INSTALACION - SERVICIO - MANTENIMIENTO
          <div className="text-sm font-semibold">REFRIGERACION Y AIRE CONDICIONADO</div>
        </div>

      <div className="text-sm font-semibold text-right">
        BENJAMIN ALBERTO TORRES FLORES
        <div className="text-sm font-semibold">AV. SAN CRISTOBAL #12555-4</div>
        <div className="text-sm font-semibold">FRACC. LOMAS DE SAN MARTIN</div>
        <div className="text-sm font-semibold">TIJUANA, B.C.</div>
      </div>
        
        <div className="w-24"></div>
      </div>


      <div className="mb-8">
        <h2 className="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
          BITACORA DE MANTENIMIENTO PREVENTIVO (REFRIGERACION)
        </h2>
        <div className="grid grid-cols-3 gap-4 mb-6">
          <div className="col-span-2">
            <div className="mb-4">
              <label className="block text-sm font-semibold font-medium text-gray-700">Cliente</label>
              <input
                type="text"
                className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm"             
              />
            </div>
            
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium font-semibold text-gray-700">Área</label>
                <input
                  type="text"
                  className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm"
                />
              </div>
              <div>
                <label className="block text-sm font-medium font-semibold text-gray-700">Plaza</label>
                <input
                  type="text"
                  className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm"
                />
              </div>
            </div>
          </div>
          
          <div>
            <div className="mb-4">
              <label className="block text-sm font-medium font-semibold text-gray-700">Unidad</label>
              <input
                type="text"
                className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm"
              />
            </div>
            
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="flex items-center text-sm font-medium font-semibold text-gray-700">
                  <CalendarIcon className="mr-1 h-4 w-4" /> Fecha
                </label>
                <input
                  type="date"
                  className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm"
                  value={currentDate}
                />
              </div>
              <div>
                <label className="flex items-center text-sm font-medium font-semibold text-gray-700">
                  <Clock className="mr-1 h-4 w-4" /> Hora de Entrada
                </label>
                <input
                  type="time"
                  className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#005c9b] focus:ring-[#005c9b] sm:text-sm"
                  value={currentTime}
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Header;