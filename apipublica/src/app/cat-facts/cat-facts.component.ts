import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Route, Router, ActivatedRoute, ParamMap, Params } from '@angular/router';

import { CatsService } from '../Servicios/cats.service';
import { modelogatos } from '../Modelos/cats.model';



@Component({
  selector: 'app-cat-facts',
  templateUrl: './cat-facts.component.html',
  styleUrls: ['./cat-facts.component.css']
})

export class CatFactsComponent {

  modelosgatos: Observable<modelogatos[]> | undefined;

  constructor(
    private cat: CatsService,
    private route: ActivatedRoute,
    private router: Router
  ) { }

  ngOnInit() {
    this.modelosgatos = this.cat.obtenerGatos();
  }

}
