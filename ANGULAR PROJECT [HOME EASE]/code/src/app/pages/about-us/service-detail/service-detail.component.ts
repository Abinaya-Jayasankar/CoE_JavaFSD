import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApiService } from '../../../services/api.service';

@Component({
  selector: 'app-service-detail',
  templateUrl: './service-detail.component.html',
  styleUrls: ['./service-detail.component.css']
})
export class ServiceDetailComponent implements OnInit {
  @Output() feedbackSubmitted = new EventEmitter<{ serviceName: string; message: string }>();

  id: string = '';
  service: any = null;
  details: any = null;
  feedback: string = '';

  constructor(private route: ActivatedRoute, private api: ApiService, private router: Router) {}

  ngOnInit() {
    this.id = this.route.snapshot.paramMap.get('id') || '';

    // Fetch service details
    this.api.getDetails(this.id).subscribe(
      (data) => {
        if (data.length > 0) {
          this.details = data[0];
          this.service = { id: this.id, name: data[0].title, image: data[0].image };
        }
      },
      (error) => console.error('Error fetching details:', error)
    );
  }

  submitFeedback() {
    if (this.feedback.trim() !== '') {
      const newFeedback = { serviceName: this.service.name, message: this.feedback };

      console.log('📤 Emitting Feedback:', JSON.stringify(newFeedback));

      this.feedbackSubmitted.emit(newFeedback); // ✅ Send feedback to AboutUsComponent

      let feedbackList = JSON.parse(localStorage.getItem('feedbackMessages') || '[]');
      feedbackList.push(newFeedback);
      localStorage.setItem('feedbackMessages', JSON.stringify(feedbackList)); // ✅ Store in localStorage

      this.feedback = ''; // Clear input
      alert('Feedback submitted successfully!');

      this.router.navigate(['/about-us']); // ✅ Navigate back after submitting feedback
    }
  }
}
