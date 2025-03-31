import 'package:flutter/material.dart';
import 'apod_screen.dart';
import 'mars_photos_screen.dart';
import 'news_screen.dart';

class HomeScreen extends StatelessWidget {
  final String backgroundImage =
      "https://png.pngtree.com/thumb_back/fw800/background/20230722/pngtree-d-rendering-of-an-astronaut-conducting-a-spacewalk-in-open-space-image_3771074.jpg"; // 🌟 New NASA HD Background

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            backgroundImage,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                "https://wallpaperaccess.com/full/1596.jpg",
                fit: BoxFit.cover,
              );
            },
          ),
          Container(color: Colors.black.withOpacity(0.5)), // Dark overlay for contrast
          
          // Content Positioned Below
          Positioned(
            bottom: 40, // Adjust this value as needed
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "🚀 Explore the Universe",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(blurRadius: 10, color: Colors.blueAccent),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildStyledButton(
                  text: "👨‍🚀 Astronomy Picture of the Day",
                  color: Colors.indigoAccent,
                  context: context,
                  screen: ApodScreen(),
                ),
                SizedBox(height: 10),
                _buildStyledButton(
                  text: "🚜 Mars Rover Photos",
                  color: Colors.redAccent,
                  context: context,
                  screen: MarsPhotosScreen(),
                ),
                SizedBox(height: 10),
                _buildStyledButton(
                  text: "📰 NASA News",
                  color: Colors.blueAccent,
                  context: context,
                  screen: NewsScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🌟 Reusable Styled Button
  Widget _buildStyledButton({required String text, required Color color, required BuildContext context, required Widget screen}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
      child: Text(text),
    );
  }
}
