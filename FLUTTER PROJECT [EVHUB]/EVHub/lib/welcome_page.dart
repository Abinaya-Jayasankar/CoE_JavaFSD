import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'home_page.dart';
import 'updates_page.dart';
import 'contact_page.dart';
import 'profile_page.dart';
import 'charging_cost_estimator.dart';
//import 'ev_dashboard.dart';
import 'fuel_vs_ev_comparison.dart';
import 'community_forum.dart';
import 'ev_marketplace.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Row(
          children: [
            Icon(Icons.electric_car, color: theme.primaryColor),
            const SizedBox(width: 8),
            const Text(
              "EVHub",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(theme.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.language), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person), onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );}),
          IconButton(icon: const Icon(Icons.phone), onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactPage(onLocaleChange: (Locale locale) {})),

        //  MaterialPageRoute(builder: (context) => ContactPage()),
        );}),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const NetworkImage(
                   "https://thumbs.dreamstime.com/b/electric-vehicle-ev-connected-to-charging-station-representing-future-sustainable-transportation-ai-generated-274092283.jpg",// "https://assets-global.website-files.com/63ce503ba9b7eb367b63c343/65536e8ed4bbed2a44322f7e_discogram11.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
              child: Column(
                children: [
                  const Text(
                    "Welcome to EVHub!",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.8,
                      shadows: [Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 5)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your one-stop app to find nearby charging stations, track updates, and make your EV experience seamless!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      shadows: [const Shadow(color: Colors.black, offset: Offset(0.5, 0.5), blurRadius: 5)],
                    ),
                  ),
                  const SizedBox(height: 30),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildNavItem(context, "Find Nearby Stations", Icons.ev_station, HomePage()),
                       _buildNavItem(context, "Fuel vs EV Comparison", Icons.compare, FuelVsEVComparisonPage()),
                      _buildNavItem(context, "EV Updates", Icons.local_offer, UpdatesPage()),
                    //  _buildNavItem(context, "Contact Us", Icons.contact_page, ContactPage()),
                   //   _buildNavItem(context, "Profile", Icons.person, ProfilePage()),
                      _buildNavItem(context, "Cost Estimator", Icons.calculate, ChargingCostEstimatorPage()),
                   //   _buildNavItem(context, "EV Dashboard", Icons.dashboard, EVDashboardScreen()),
                     // _buildNavItem(context, "Fuel vs EV Comparison", Icons.compare, FuelVsEVComparisonPage()),
                      _buildNavItem(context, "Community Forum", Icons.forum, CommunityForumPage()),
                      _buildNavItem(context, "EV Marketplace", Icons.electric_car, EVMarketplace()),


                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Card(
        color: Colors.black.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}