import { Section } from '../types';

export const sections: Section[] = [
  {
    id: 'puerta',
    title: 'PUERTA DE ACCESO A CAMARAS',
    activities: [
      { name: 'Estado general de empaques de puertas acceso a las camaras.' },
      { name: 'Estado de hule de arrastre (FALDÓN).' },
      { name: 'Condiciones de herrajes (cerrojos, bisagras, picaportes).' },
      { name: 'Revision de operación de resistencia de marco de puerta.' }
    ]
  },
  {
    id: 'camaras',
    title: 'CAMARAS',
    activities: [
      { name: 'Revisón de los sellos en las molduras' },
      { name: 'Verificación del estado de la cortina de PVC' },
      { name: 'Revision del funcionamiento de iluminacion interior' },
      { name: 'Revision del estado de los termómetros' }
    ]
  },
   {
    id: 'reachin',
    title: 'REACH-IN',
    activities: [
      { name: 'Estado general de empaques en puertas (numero)' },
      { name: 'Revisar funcionamiento de lamparas (100% encendidas)' },
      { name: 'Funcionamiento de torque master' },
      { name: 'Revisar resistencia de marco reach-in (apuntar lecturas)' }
    ]
  },
  {
    id: 'evaporadores',
    title: 'EVAPORADORES',
    activities: [
      { name: 'Revision de estado de base para motor y protector' },
      { name: 'Revision de limpieza en serpentin' },
      { name: 'Revision de la charola de condensados del evaporador' },
      { name: 'Revision del drenaje de condensados del evaporador' },
      { name: 'Limpieza de guardas y aspas' },
      { name: 'Revision de las laminillas del evaporador' },
      { name: 'Verificar funcionamiento de VTE y aislamiento del bulbo' },
      { name: 'Revision de la operación de motores' },
      { name: 'Revision de resistencia de deshielo' }
    ]
  },
  {
    id: 'condensador',
    title: 'CONDENSADOR',
    activities: [
      { name: 'Revision de limpieza en serpentin' },
      { name: 'Revision de laminillas del condensador' },
      { name: 'Revision de la vibracion en motores y compresores' },
      { name: 'Verificar carga adecuada de refrigerante' },
      { name: 'Calibracion de control de presion' },
      { name: 'Revision del tiempo de deshielo' },
      { name: 'Flujo adecuado de ventilacion a travez del serpentin' }
    ]
  },
  {
    id: 'tablero',
    title: 'TABLERO ELÉCTRICO',
    activities: [
      { name: 'Revision de conexiones electricas' },
      { name: 'Revision del estado de los interruptores' },
      { name: 'Verificar platino de contactores' }
    ]
  }
];