import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  username: string = '';
  password: string = '';

  constructor(private router: Router) {}

  login() {
    if (this.username === 'Abi' && this.password === 'abc') {
      localStorage.setItem('username', this.username);
      this.router.navigate(['/home']); // Redirect to Dashboard
    } else {
      alert('Invalid Credentials');
    }
  }
}
