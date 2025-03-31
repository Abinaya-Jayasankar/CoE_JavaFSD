import { Component, OnInit } from '@angular/core';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  homeData: any = {}; // Store hero section data

  constructor(private apiService: ApiService) {}
  ngOnInit(): void {
    this.apiService.getHomeData().subscribe(
      (data) => {
        console.log('Fetched homeData:', data); // ✅ Check API response
        this.homeData = data;
      },
      (error) => {
        console.error('Error fetching home data:', error);
      }
    );
  }
}  