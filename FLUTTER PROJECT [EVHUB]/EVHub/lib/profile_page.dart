import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Makes AppBar blend into the background
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.black],
              ),
            ),
          ),

          // Profile Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Glassmorphic Profile Card
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15), // Glass effect
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.white.withOpacity(0.2), blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Profile Image
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white54,
                        child: Icon(Icons.person, size: 70, color: Colors.white),
                      ),
                      const SizedBox(height: 15),

                      // User Name
                      const Text(
                        "Abinaya",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 5),

                      // Email
                      Text(
                        "abinaya.162004@gmail.com",
                        style: TextStyle(color: Colors.grey[300], fontSize: 16),
                      ),
                      const SizedBox(height: 10),

                      // Achievements Badges Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildBadge("🔥 Top Contributor"),
                          const SizedBox(width: 10),
                          _buildBadge("⚡ EV Enthusiast"),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Action Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(Icons.edit, "Edit Profile", Colors.blueAccent),
                          const SizedBox(width: 10),
                          _buildButton(Icons.lock, "Change Password", Colors.redAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Recent Activity Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Recent Activity", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              _buildRecentActivity("📢 Commented on a discussion: 'Best EVs for 2025'"),
              _buildRecentActivity("⚡ Earned a new badge: 'EV Enthusiast'"),
              _buildRecentActivity("🚗 Booked an EV test drive"),
            ],
          ),
        ],
      ),
    );
  }

  // Glassmorphic Badge
  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  // Styled Button
  Widget _buildButton(IconData icon, String text, Color color) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        // Add respective navigation logic
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  // Recent Activity
  Widget _buildRecentActivity(String activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        color: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: const Icon(Icons.history, color: Colors.white),
          title: Text(activity, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}
