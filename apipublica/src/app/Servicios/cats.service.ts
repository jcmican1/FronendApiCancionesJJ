import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { modelogatos } from '../Modelos/cats.model';


@Injectable({
  providedIn: 'root'
})
export class CatsService {

  constructor(private http: HttpClient) { }
  obtenerGatos(){
    return this.http.get<modelogatos[]>("http://localhost:5000/albumes");
    // https://cat-fact.herokuapp.com/facts
  }
}
