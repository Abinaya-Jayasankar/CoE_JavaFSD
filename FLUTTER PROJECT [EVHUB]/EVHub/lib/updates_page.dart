import 'package:flutter/material.dart';
import 'api_service.dart'; // Ensure you import the ApiService

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EV Updates & News"),
        backgroundColor: Colors.cyan[900], // Updated to match neon effect
        elevation: 5,
        shadowColor: Colors.cyanAccent.withOpacity(0.6),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.fetchEVUpdates(), // Fetch news updates from your API service
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No updates available"));
          } else {
            final updates = snapshot.data!;
            return ListView.builder(
              itemCount: updates.length,
              itemBuilder: (context, index) {
                final article = updates[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(article['urlToImage'] ?? 'https://via.placeholder.com/150'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          article['title'] ?? 'No Title',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          article['description'] ?? 'No Description',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
