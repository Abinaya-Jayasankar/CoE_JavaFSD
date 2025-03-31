import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutUsComponent } from './pages/about-us/about-us.component';
import { BookingsComponent } from './pages/bookings/bookings.component';
import { ContactComponent } from './pages/contact/contact.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { ProvidersComponent } from './pages/providers/providers.component';
import { QueriesComponent } from './pages/queries/queries.component';
import { LoginComponent } from './common/login/login.component';
import { HomeComponent } from './pages/home/home.component';
import { AuthGuard } from './guards/auth.guard'; // Import Auth Guard
import { CommonModule } from '@angular/common';
import { ServiceDetailComponent } from './pages/about-us/service-detail/service-detail.component'; // ✅ Import this
const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] }, // Protect Dashboard
  { path: 'about-us', component: AboutUsComponent,canActivate: [AuthGuard] },
  { path: 'bookings', component: BookingsComponent,canActivate: [AuthGuard] },
  { path: 'contact', component: ContactComponent },
  { path: 'providers', component: ProvidersComponent ,canActivate: [AuthGuard]},  // Dynamic route for providers
  { path: 'queries', component: QueriesComponent },
  { path: 'service-details/:id', component: ServiceDetailComponent, canActivate: [AuthGuard] }, // Protected Route
  { path: 'home', component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes),CommonModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
