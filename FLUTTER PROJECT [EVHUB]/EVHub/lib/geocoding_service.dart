import 'dart:convert';
import 'package:http/http.dart' as http;

class GeocodingService {
  static Future<Map<String, double>?> getCoordinates(String city) async {
    final url = "https://nominatim.openstreetmap.org/search?city=$city&format=json";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        if (data.isNotEmpty) {
          return {
            "lat": double.parse(data[0]["lat"]),
            "lng": double.parse(data[0]["lon"]),
          };
        }
      }
    } catch (e) {
      print("Geocoding Error: $e");
    }
    return null;
  }
}
