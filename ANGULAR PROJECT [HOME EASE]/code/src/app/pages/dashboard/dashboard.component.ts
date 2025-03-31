import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent {
  username: string | null = '';

  constructor(private router: Router) {
    this.username = localStorage.getItem('username'); // Get logged-in user
  }

  logout() {
    localStorage.removeItem('username'); // Remove user session
    this.router.navigate(['/login']); // Redirect to login
  }
}
