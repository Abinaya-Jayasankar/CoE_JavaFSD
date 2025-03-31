import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'nasa_api_service.dart';

class MarsPhotosScreen extends StatefulWidget {
  @override
  _MarsPhotosScreenState createState() => _MarsPhotosScreenState();
}

class _MarsPhotosScreenState extends State<MarsPhotosScreen> {
  List<dynamic> photos = [];

  @override
  void initState() {
    super.initState();
    fetchMarsPhotos();
  }

  void fetchMarsPhotos() async {
    try {
      final data = await NasaApiService.fetchMarsPhotos();
      setState(() {
        photos = data;
      });
    } catch (e) {
      print("Error fetching Mars photos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mars Rover Photos 🚜")),
      body: photos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(imageUrl: photos[index]['img_src'], fit: BoxFit.cover);
              },
            ),
    );
  }
}
