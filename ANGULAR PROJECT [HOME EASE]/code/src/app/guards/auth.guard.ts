import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router) {}

  canActivate(): boolean {
    if (localStorage.getItem('username')) {
      return true; // User is logged in, allow access
    }
    this.router.navigate(['/login']); // Redirect to login page if not logged in
    return false;
  }
}
