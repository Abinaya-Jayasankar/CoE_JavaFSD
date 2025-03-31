import { Component } from '@angular/core';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-queries',
  templateUrl: './queries.component.html',
  styleUrls: ['./queries.component.css']
})
export class QueriesComponent {
  inquiryData = {
    name: '',
    email: '',
    subject: '',
    message: ''
  };

  constructor(private api: ApiService) {}

  submitInquiry() {
    if (!this.inquiryData.name || !this.inquiryData.email || !this.inquiryData.subject || !this.inquiryData.message) {
      alert('Please fill in all required fields.');
      return;
    }

    this.api.submitInquiry(this.inquiryData).subscribe({
      next: () => {
        alert('Inquiry submitted successfully!');
        this.inquiryData = { name: '', email: '', subject: '', message: '' }; // Reset form
      },
      error: () => {
        alert('Something went wrong. Please try again.');
      }
    });
  }
}
