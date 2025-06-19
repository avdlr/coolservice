import React from 'react';
import Header from './Header';
import ChecklistSection from './ChecklistSection';
import OperationReadings from './OperationReadings';
import ServicesSection from './ServicesSection';
import SignatureSection from './SignatureSection';
import { sections } from '../../data/formDataRefrigeracion';

const MaintenanceForm: React.FC = () => {
  return (
    <div className="max-w-6xl mx-auto bg-white shadow-md my-8 px-6 py-8 print:shadow-none print:my-0">
      <Header />
      
      {sections.map((section) => (
        <ChecklistSection 
          key={section.id}
          title={section.title}
          activities={section.activities}
        />
      ))}
      
      <OperationReadings />
      <ServicesSection />
      <SignatureSection />
      
      <div className="mt-8 print:hidden flex justify-end gap-4">
        <button 
          className="px-4 py-2 bg-gray-200 text-gray-700 rounded hover:bg-gray-300 transition-colors"
          onClick={() => window.print()}
        >
          Imprimir
        </button>
        <button className="px-4 py-2 bg-[#005c9b] text-white rounded hover:bg-[#004b7d] transition-colors">
          Guardar PDF
        </button>
      </div>
    </div>
  );
};

export default MaintenanceForm;