import { Component } from '@angular/core';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-providers',
  templateUrl: './providers.component.html',
  styleUrls: ['./providers.component.css']
})
export class ProvidersComponent {
  providerList: any[] = [];
  allProviders: any[] = [];
  serviceCategories: string[] = ['All', 'Plumbing', 'Electrical', 'Cleaning', 'Carpentry', 'Painting'];
  selected: string = 'All';
  showBookingForm: boolean = false;
  bookingData: any = {
    name: '',
    email: '',
    providerName: '',
    service: '',
    location: '',
    experience: '',
    rating: '',
    date: '',
    instructions: ''
  };

  constructor(private api: ApiService) {}

  ngOnInit(): void {
    this.api.getProviders().subscribe({
      next: (response: any[]) => {
        this.allProviders = response;
        this.providerList = [...this.allProviders];
      },
      error: (error: any) => {
        console.log("Error fetching providers", error);
      }
    });
  }

  filterProviders(): void {
    if (this.selected === 'All') {
      this.providerList = [...this.allProviders];
    } else {
      this.providerList = this.allProviders.filter(p => p.service === this.selected);
    }
  }

  openBookingForm(provider: any) {
    this.bookingData = {
      name: '',
      email: '',
      providerName: provider.name,
      service: provider.service,
      location: provider.location,
      experience: provider.experience,
      rating: provider.rating,
      date: '',
      instructions: ''
    };
    this.showBookingForm = true;
  }

  closeBookingForm() {
    this.showBookingForm = false;
  }

  submitBooking() {
    this.api.addBooking(this.bookingData).subscribe({
      next: () => {
        alert("Booking Confirmed!");
        this.closeBookingForm();
      },
      error: () => {
        alert("Error! Booking failed.");
      }
    });
  }
}
