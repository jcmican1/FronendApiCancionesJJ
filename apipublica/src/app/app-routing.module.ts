import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MenuComponent } from './menu/menu.component';
import { AppComponent } from './app.component';
import { Pais1Component } from './pais1/pais1.component';
import { Pais2Component } from './pais2/pais2.component';
import { Pais3Component } from './pais3/pais3.component';
import { CatFactsComponent } from './cat-facts/cat-facts.component';

const routes: Routes = [
  {
    path: 'pais1',
    component: Pais1Component
  },
  {
    path: 'pais2',
    component: Pais2Component
  },
  {
    path: 'pais3',
    component: Pais3Component
  },
  {
    path: 'cat-facts',
    component: CatFactsComponent 
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
