import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // 🔋 API Key for Open Charge Map (Charging Stations)
  static const String chargeApiKey = "9407238a-d482-406d-9265-a51e2782a36d";
  static const String chargeBaseUrl = "https://api.openchargemap.io/v3/poi/";

  // 📰 API Key for NewsAPI (EV News & Updates) – 
  static const String newsApiKey = "aaa6fc0dcd2247f78b7d2a4c660ffb7a";  // Make sure to put your actual NewsAPI key here
  static const String newsBaseUrl = "https://newsapi.org/v2/everything";

  // ⚡ Fetch EV Charging Stations
  static Future<List<dynamic>> fetchChargingStations(double latitude, double longitude) async {
    final String url = "$chargeBaseUrl?key=$chargeApiKey&output=json&latitude=$latitude&longitude=$longitude&maxresults=10";
    print("Fetching data from: $url");

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"User-Agent": "Mozilla/5.0 (Linux; Android 10; Mobile)"},
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to load charging stations. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  // 🔥 Fetch Latest EV News & Updates
  static Future<List<dynamic>> fetchEVUpdates() async {
    final String url = "$newsBaseUrl?q=electric%20vehicle%20launches%20OR%20EV%20news&sortBy=publishedAt&apiKey=$newsApiKey";  // Use newsApiKey here
    print("Fetching EV news from: $url");

    try {
      final response = await http.get(Uri.parse(url));

      print("NewsAPI Response status: ${response.statusCode}");
      print("NewsAPI Response body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data["articles"];
      } else {
        throw Exception("Failed to load EV updates. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching EV updates: $e");
    }
  }
}
