import React from 'react';
import { Activity } from '../types';

interface ChecklistSectionProps {
  title: string;
  activities: Activity[];
}

const ChecklistSection: React.FC<ChecklistSectionProps> = ({ title, activities }) => {
  return (
    <div className="mb-8">
      <h2 className="text-lg font-bold text-white bg-[#005c9b] py-2 px-4 rounded-t-md">
        {title}
      </h2>
     
      <div className="overflow-x-auto">
        <table className="min-w-full border border-gray-300">
          <thead>
            <tr className="bg-gray-100">
              <th className="w-1/3 py-2 px-4 border-b border-r border-gray-300 text-left text-sm font-medium text-gray-700">
                Actividad
              </th>
              <th className="py-2 px-2 border-b border-r border-gray-300 text-center text-sm font-medium text-gray-700">
                Conservacion
              </th>
              <th className="py-2 px-2 border-b border-r border-gray-300 text-center text-sm font-medium text-gray-700">
                Freezer
              </th>
            </tr>
          </thead>
          <tbody>
            {activities.map((activity, index) => (
              <tr key={index} className={index % 2 === 0 ? 'bg-white' : 'bg-gray-50'}>
                <td className="py-2 px-4 border-b border-r border-gray-300 text-sm text-gray-800">
                  {activity.name}
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300 text-center">
                  <div className="flex justify-center space-x-4">
                    <label className="inline-flex items-center">
                      <input type="radio" name={`status-${title}-${index}`} className="form-radio h-4 w-4 text-[#005c9b]" />
                      <span className="ml-1 text-sm text-gray-700">B</span>
                    </label>
                    <label className="inline-flex items-center">
                      <input type="radio" name={`status-${title}-${index}`} className="form-radio h-4 w-4 text-red-600" />
                      <span className="ml-1 text-sm text-gray-700">M</span>
                    </label>
                  </div>
                </td>
                <td className="py-2 px-2 border-b border-r border-gray-300 text-center">
                  <div className="flex justify-center space-x-4">
                    <label className="inline-flex items-center">
                      <input type="radio" name={`status-${title}-${index}`} className="form-radio h-4 w-4 text-[#005c9b]" />
                      <span className="ml-1 text-sm text-gray-700">B</span>
                    </label>
                    <label className="inline-flex items-center">
                      <input type="radio" name={`status-${title}-${index}`} className="form-radio h-4 w-4 text-red-600" />
                      <span className="ml-1 text-sm text-gray-700">M</span>
                    </label>
                  </div>
                </td>              
               
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default ChecklistSection;