import { Component, OnInit } from '@angular/core';
import { ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router'; 

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  @ViewChild('f') signupForm: NgForm;
  user = {
    login: 'test',
    password: '1234',
  };
  submitted = false;

  constructor(private router: Router){ }

  ngOnInit() {
  }

  onSubmit() {
    this.submitted = true;
    if(this.user.login === this.signupForm.value.userData.login && this.user.password === this.signupForm.value.userData.password)
      {
         this.router.navigate(['/permit-refund']);
      }
  }
}

