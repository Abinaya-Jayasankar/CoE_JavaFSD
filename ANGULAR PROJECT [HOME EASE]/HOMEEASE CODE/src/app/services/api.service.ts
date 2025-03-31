import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl = 'http://localhost:4500'; // ✅ Ensure base URL is defined

  constructor(private http: HttpClient) {}

  getHomeData(): Observable<any> {
    return this.http.get(`${this.apiUrl}/homeData`); // ✅ Ensure backend is running
  }
  
  getProviders(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/providers`); // ✅ Correct API URL
  }

  getBookings(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/bookings`);
  }
  submitInquiry(inquiry: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/inquiries`, inquiry);
  }
  getServices(): Observable<any[]> {
    return this.http.get<any[]>('http://localhost:4500/services');
  }

  getDetails(id: string): Observable<any> {
    return this.http.get<any[]>(`http://localhost:4500/details?id=${id}`);
  }
  addBooking(booking: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/bookings`, booking);
  }
}
