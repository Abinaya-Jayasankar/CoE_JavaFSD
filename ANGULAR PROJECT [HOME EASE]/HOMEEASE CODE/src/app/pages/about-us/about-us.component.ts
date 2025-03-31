import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-about-us',
  templateUrl: './about-us.component.html',
  styleUrls: ['./about-us.component.css']
})
export class AboutUsComponent implements OnInit {
  services: any[] = []; // List of services
  feedbackMessages: { serviceName: string; message: string }[] = []; // Stores feedback

  constructor(private apiService: ApiService, private router: Router) {}

  ngOnInit(): void {
    this.loadServicesAndFeedback();

    // ✅ Listen for navigation changes to refresh feedback when returning from ServiceDetailComponent
    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd && event.url === '/about-us') {
        console.log('🔄 Navigated back to About Us - Reloading Feedback');
        this.loadServicesAndFeedback();
      }
    });
  }

  loadServicesAndFeedback() {
    this.apiService.getServices().subscribe(
      (data) => {
        this.services = data;
      },
      (error) => {
        console.error('Error fetching services:', error);
      }
    );

    const storedFeedback = localStorage.getItem('feedbackMessages');
    if (storedFeedback) {
      this.feedbackMessages = JSON.parse(storedFeedback);
    }
  }

  handleFeedbackReceived(feedback: { serviceName: string; message: string }) {
    console.log('📩 Received Feedback in Parent:', feedback);

    if (!feedback) {
      console.error('❌ No feedback received');
      return;
    }

    this.feedbackMessages.push(feedback);
    console.log('Updated Feedback List:', this.feedbackMessages);

    // ✅ Save to Local Storage for persistence
    localStorage.setItem('feedbackMessages', JSON.stringify(this.feedbackMessages));
  }

  viewServiceDetails(service: any) {
    this.router.navigate(['/service-details', service.id]);
  }
}
