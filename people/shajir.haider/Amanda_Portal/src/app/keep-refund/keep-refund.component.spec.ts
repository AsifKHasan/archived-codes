import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { KeepRefundComponent } from './keep-refund.component';

describe('KeepRefundComponent', () => {
  let component: KeepRefundComponent;
  let fixture: ComponentFixture<KeepRefundComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ KeepRefundComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KeepRefundComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
