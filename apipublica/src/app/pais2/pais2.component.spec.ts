import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Pais2Component } from './pais2.component';

describe('Pais2Component', () => {
  let component: Pais2Component;
  let fixture: ComponentFixture<Pais2Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [Pais2Component]
    });
    fixture = TestBed.createComponent(Pais2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
