import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { ChatAssistantComponent } from '../../components/chat-assistant/chat-assistant.component';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [ChatAssistantComponent, RouterLink],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {}
