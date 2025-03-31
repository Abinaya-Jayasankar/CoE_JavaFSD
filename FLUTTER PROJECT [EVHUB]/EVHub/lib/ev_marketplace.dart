import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EVMarketplace extends StatefulWidget {
  @override
  _EVMarketplaceState createState() => _EVMarketplaceState();
}

class _EVMarketplaceState extends State<EVMarketplace> {
  List<dynamic> evData = [];
  List<dynamic> filteredEVData = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    loadEVData();
  }

  Future<void> loadEVData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data/ev_data.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      setState(() {
        evData = List<dynamic>.from(jsonData["data"] ?? []);
        filteredEVData = List.from(evData);
      });
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  void filterEVs(String query) {
    setState(() {
      searchQuery = query;
      filteredEVData = evData.where((ev) {
        return ev["model"].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void showEVDetails(BuildContext context, dynamic ev) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.black,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blueAccent, width: 2),
              boxShadow: [
                BoxShadow(color: Colors.blueAccent.withOpacity(0.6), blurRadius: 20, spreadRadius: 5)
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (ev["id"] == "6033b26c-1b3c-441b-9f78-7b7cd5512051" ||
                    ev["id"] == "1c9126d4-24d6-4e9f-a49d-15813fa49728")
                  Image.asset("assets/images/${ev["id"]}.png", height: 150),
                SizedBox(height: 10),
                Text(
                  "${ev["brand"]} ${ev["model"]}",
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, shadows: [
                    Shadow(color: Colors.blueAccent, blurRadius: 10)
                  ]),
                ),
                SizedBox(height: 8),
                Divider(color: Colors.blueAccent),
                Text("Battery: ${ev["usable_battery_size"]} kWh", style: TextStyle(color: Colors.blueAccent, fontSize: 16)),
                Text("Type: ${ev["vehicle_type"]}", style: TextStyle(color: Colors.white, fontSize: 16)),
                Text("Year: ${ev["release_year"]}", style: TextStyle(color: Colors.white70, fontSize: 16)),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EV Marketplace")),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search by Model",
                prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white24,
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: filterEVs,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEVData.length,
              itemBuilder: (context, index) {
                var ev = filteredEVData[index];
                return Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(ev["brand"][0], style: TextStyle(color: Colors.white)),
                    ),
                    title: Text("${ev["brand"]} ${ev["model"]}", style: TextStyle(color: Colors.white)),
                    subtitle: Text("Battery: ${ev["usable_battery_size"]} kWh", style: TextStyle(color: Colors.blueAccent)),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onTap: () => showEVDetails(context, ev),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}