import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaApiService {
  static const String apiKey = "DEMO_KEY"; // Replace with your NASA API key

  // Fetch Astronomy Picture of the Day (APOD)
  static Future<Map<String, dynamic>> fetchAPOD() async {
    final response = await http.get(Uri.parse("https://api.nasa.gov/planetary/apod?api_key=hb5ctDOymgf0PQVdFChcZf71hbftE6BaH8GKTKfE"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load APOD data");
    }
  }

  // Fetch Mars Rover Photos
  static Future<List<dynamic>> fetchMarsPhotos() async {
    final response = await http.get(Uri.parse("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=hb5ctDOymgf0PQVdFChcZf71hbftE6BaH8GKTKfE"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['photos'];
    } else {
      throw Exception("Failed to load Mars photos");
    }
  }

  // Fetch NASA News (Using NASA Image and Video Library)
  static Future<List<dynamic>> fetchNasaNews() async {
    final response = await http.get(Uri.parse("https://images-api.nasa.gov/search?q=space"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['collection']['items'];
    } else {
      throw Exception("Failed to load NASA news");
    }
  }
}
