import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_screen.dart';
import 'theme_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.electric_car, color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            const Text("EVHub⚡", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {}, // Language selection (to be implemented)
          ),
          IconButton(
            icon: const Icon(Icons.person), // Profile Icon
            onPressed: () {
              // Navigate to Profile Page (To be implemented)
            },
          ),
          IconButton(
            icon: const Icon(Icons.phone), // Contact Icon
            onPressed: () {
              // Navigate to Contact Page (To be implemented)
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://hickoryhillsil.org/wp-content/uploads/2023/09/ELECTRIC-CAR.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: Colors.black.withOpacity(0.1),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "EVHub⚡",
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Driving the future with seamless EV access, innovation, and sustainability.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.cyanAccent),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AuthScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        child: const Text("Get Started", style: TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: _buildInfoCard(context, "Our Mission", "To make EV charging accessible, affordable, and reliable for everyone.")),
                Flexible(child: _buildInfoCard(context, "Our Vision", "A future where electric mobility is the norm, making the world greener.")),
              ],
            ),
            const SizedBox(height: 20),
            _buildTrustedBySection(context),
            _buildFollowUsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String content) {
    return Card(
      color: const Color(0xFF505050),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
            const SizedBox(height: 5),
            Text(content, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
  Widget _buildTrustedBySection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF0F9D58), Color(0xFF00BFA5)],
      ),
    ),
    child: Column(
      children: [
        const Text(
          "EVHub is Trusted By",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatCard(context, "500K+", "Happy Customers"),
            _buildStatCard(context, "50K+", "Charging Stations"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatCard(context, "24/7", "Customer Support"),
            _buildStatCard(context, "1M+", "App Downloads"),
          ],
        ),
      ],
    ),
  );
}

Widget _buildStatCard(BuildContext context, String number, String label) {
  return Expanded(
    child: Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildFollowUsSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Follow Us", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                onPressed: () {},
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.blueGrey),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}