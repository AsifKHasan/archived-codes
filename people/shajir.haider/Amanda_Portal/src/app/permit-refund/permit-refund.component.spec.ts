import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PermitRefundComponent } from './permit-refund.component';

describe('PermitRefundComponent', () => {
  let component: PermitRefundComponent;
  let fixture: ComponentFixture<PermitRefundComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PermitRefundComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PermitRefundComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
