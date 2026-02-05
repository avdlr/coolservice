import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { catchError, of } from 'rxjs';

export interface OrdenServicio {
  id: string;
  cliente: string;
  estado: string;
  tecnico: string;
  ultimaActualizacion: string;
}

const MOCK_ORDENES: OrdenServicio[] = [
  {
    id: 'OS-1042',
    cliente: 'Grupo Altura',
    estado: 'En ruta',
    tecnico: 'Mariana Soto',
    ultimaActualizacion: 'Hace 18 minutos'
  },
  {
    id: 'OS-2048',
    cliente: 'Logística Rivera',
    estado: 'En diagnóstico',
    tecnico: 'Luis Ávila',
    ultimaActualizacion: 'Hace 42 minutos'
  },
  {
    id: 'OS-3091',
    cliente: 'Hotel Miramar',
    estado: 'Completada',
    tecnico: 'Andrea Campos',
    ultimaActualizacion: 'Hoy, 9:12 AM'
  }
];

@Injectable({
  providedIn: 'root'
})
export class OrdenesService {
  constructor(private http: HttpClient) {}

  lookupOrden(id: string) {
    return this.http.get<OrdenServicio>(`/api/ordenes/${id}`).pipe(
      catchError(() => {
        const mock = MOCK_ORDENES.find((orden) => orden.id.toLowerCase() === id.toLowerCase());
        return of(mock ?? null);
      })
    );
  }

  getFeaturedOrdenes() {
    return of(MOCK_ORDENES);
  }
}
