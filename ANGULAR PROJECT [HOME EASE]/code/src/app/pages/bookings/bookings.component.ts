import { Component, OnInit } from '@angular/core';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-bookings',
  templateUrl: './bookings.component.html',
  styleUrls: ['./bookings.component.css']
})
export class BookingsComponent implements OnInit {
  userBookings: any[] = [];

  constructor(private api: ApiService) {}

  ngOnInit(): void {
    this.fetchBookings();
  }

  fetchBookings(): void {
    this.api.getBookings().subscribe({
      next: (response: any[]) => {
        this.userBookings = response; // ✅ Store the fetched bookings
      },
      error: (error) => {
        console.error("Error fetching bookings:", error);
      }
    });
  }
}
