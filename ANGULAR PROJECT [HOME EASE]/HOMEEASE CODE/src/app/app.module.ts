import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';  // Ensure the routing module exists
import { AppComponent } from './app.component';
import { HomeComponent } from './pages/home/home.component';
import { AboutUsComponent } from './pages/about-us/about-us.component';
import { BookingsComponent } from './pages/bookings/bookings.component';
import { ContactComponent } from './pages/contact/contact.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { ProvidersComponent } from './pages/providers/providers.component';
import { QueriesComponent } from './pages/queries/queries.component';
import { MenuBarComponent } from './common/menu-bar/menu-bar.component';
import { FilterservicePipe } from './pipes/filterservice.pipe';
import { FormsModule } from '@angular/forms';
import { LoginComponent } from './common/login/login.component';
import { ServiceDetailComponent } from './pages/about-us/service-detail/service-detail.component';
@NgModule({
  declarations: [
    FilterservicePipe,
    LoginComponent,
    AppComponent,
    MenuBarComponent,
    HomeComponent,
    AboutUsComponent,
    BookingsComponent,
    ContactComponent,
    DashboardComponent,
    ProvidersComponent,
    QueriesComponent,
    ServiceDetailComponent,
    
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,  // Ensure routing module is imported
    FormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
