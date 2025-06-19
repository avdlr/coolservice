import React, { useState, useRef } from 'react';
import { XCircle } from 'lucide-react';

const SignatureSection: React.FC = () => {
  const [techSignature, setTechSignature] = useState<string | null>(null);
  const [managerSignature, setManagerSignature] = useState<string | null>(null);
  
  const techNameRef = useRef<HTMLInputElement>(null);
  const managerNameRef = useRef<HTMLInputElement>(null);
  
  const clearTechSignature = () => {
    setTechSignature(null);
  };
  
  const clearManagerSignature = () => {
    setManagerSignature(null);
  };
  
  return (
    <div className="mt-10 grid grid-cols-1 md:grid-cols-2 gap-8">
      <div className="border border-gray-300 rounded-md p-4">
        <h3 className="text-md font-bold text-gray-700 mb-4">Nombre y Firma del Técnico</h3>
        
        <div className="mb-4">
          <label className="block text-sm font-medium text-gray-700 mb-1">Nombre completo:</label>
          <input
            ref={techNameRef}
            type="text"
            className="w-full border-gray-300 rounded-md focus:border-blue-500 focus:ring-blue-500"
          />
        </div>
        
        <div>
          <div className="flex justify-between items-center mb-1">
            <label className="block text-sm font-medium text-gray-700">Firma:</label>
            {techSignature && (
              <button 
                onClick={clearTechSignature}
                className="text-red-500 hover:text-red-600 flex items-center text-sm"
              >
                <XCircle className="h-4 w-4 mr-1" /> Limpiar
              </button>
            )}
          </div>
          
          <div className="border-2 border-dashed border-gray-300 rounded-md h-32 flex items-center justify-center bg-gray-50">
            {techSignature ? (
              <img src={techSignature} alt="Firma del técnico" className="max-h-full" />
            ) : (
              <span className="text-sm text-gray-500">Firmar aquí</span>
            )}
          </div>
        </div>
      </div>
      
      <div className="border border-gray-300 rounded-md p-4">
        <h3 className="text-md font-bold text-gray-700 mb-4">Nombre y Firma del Gerente de Unidad</h3>
        
        <div className="mb-4">
          <label className="block text-sm font-medium text-gray-700 mb-1">Nombre completo:</label>
          <input
            ref={managerNameRef}
            type="text"
            className="w-full border-gray-300 rounded-md focus:border-blue-500 focus:ring-blue-500"
          />
        </div>
        
        <div>
          <div className="flex justify-between items-center mb-1">
            <label className="block text-sm font-medium text-gray-700">Firma:</label>
            {managerSignature && (
              <button 
                onClick={clearManagerSignature}
                className="text-red-500 hover:text-red-600 flex items-center text-sm"
              >
                <XCircle className="h-4 w-4 mr-1" /> Limpiar
              </button>
            )}
          </div>
          
          <div className="border-2 border-dashed border-gray-300 rounded-md h-32 flex items-center justify-center bg-gray-50">
            {managerSignature ? (
              <img src={managerSignature} alt="Firma del gerente" className="max-h-full" />
            ) : (
              <span className="text-sm text-gray-500">Firmar aquí</span>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default SignatureSection;