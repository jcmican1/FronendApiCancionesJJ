import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

  @Input() opciones!: string[];
  @Input() colorfondo!: string;
  @Output() presionopcion = new EventEmitter();

  constructor() { }

  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  presion(i: number): void {
    this.presionopcion.emit(i)
  }

}
