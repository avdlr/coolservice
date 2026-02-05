import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgFor, NgIf } from '@angular/common';
import { OrdenesService, OrdenServicio } from '../../services/ordenes.service';

interface ChatMessage {
  from: 'assistant' | 'user';
  text: string;
}

@Component({
  selector: 'app-chat-assistant',
  standalone: true,
  imports: [FormsModule, NgFor, NgIf],
  templateUrl: './chat-assistant.component.html',
  styleUrl: './chat-assistant.component.css'
})
export class ChatAssistantComponent {
  messages: ChatMessage[] = [
    {
      from: 'assistant',
      text: 'Hola, soy el asistente de órdenes. Comparte un número de orden (ej: OS-2048) y lo consultaré en la base SQL.'
    }
  ];
  input = '';
  loading = false;
  featuredOrdenes: OrdenServicio[] = [];

  constructor(private ordenesService: OrdenesService) {
    this.ordenesService.getFeaturedOrdenes().subscribe((ordenes) => {
      this.featuredOrdenes = ordenes;
    });
  }

  sendMessage() {
    const trimmed = this.input.trim();
    if (!trimmed || this.loading) {
      return;
    }

    this.messages.push({ from: 'user', text: trimmed });
    this.input = '';
    this.loading = true;

    this.ordenesService.lookupOrden(trimmed).subscribe((orden) => {
      if (orden) {
        this.messages.push({
          from: 'assistant',
          text: `Orden ${orden.id} · ${orden.cliente} — Estado: ${orden.estado}. Técnico: ${orden.tecnico}. ${orden.ultimaActualizacion}.`
        });
      } else {
        this.messages.push({
          from: 'assistant',
          text: `No encontré la orden ${trimmed}. Puedes revisar el ID o solicitar una búsqueda avanzada.`
        });
      }
      this.loading = false;
    });
  }
}
