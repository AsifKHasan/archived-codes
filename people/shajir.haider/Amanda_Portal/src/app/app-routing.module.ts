import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


//import { ServerResolver } from './servers/server/server-resolver.service';
import { LoginComponent } from './login/login.component'
import  { ChangeLogComponent } from './change-log/change-log.component'
import  {KeepRefundComponent } from './keep-refund/keep-refund.component'
import { PermitRefundComponent } from './permit-refund/permit-refund.component'

const appRoutes: Routes = [
  { path: '', component: LoginComponent },
  {
    path: 'permit-refund',
    component: PermitRefundComponent 
  },
  {
    path: 'keep-refund',
    component: KeepRefundComponent
  },
  {
    path: 'change-log',
    component: ChangeLogComponent 
  }


];

@NgModule({
  imports: [
    // RouterModule.forRoot(appRoutes, {useHash: true})
    RouterModule.forRoot(appRoutes)
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {

}
