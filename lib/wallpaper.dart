import 'package:flutter/material.dart';

class WallpaperPage extends StatefulWidget {
  final Future<Map<String, dynamic>> Function() fetchData; // Fetch function
  WallpaperPage(this.fetchData);

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  Map<String, dynamic>? responseData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final newData = await widget.fetchData(); // Fetch images
    setState(() {
      responseData = newData; // Update state with new images
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _loadData, // Trigger refresh when pulled down
      child: responseData == null || !responseData!.containsKey("photos")
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 images per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: responseData!["photos"].length,
          itemBuilder: (context, index) {
            var photo = responseData!["photos"][index];
            String imageUrl = photo["src"]["medium"]; // Image URL
            String photoName = photo["alt"]; // Image Name

            return Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  photoName.length > 20 ? "${photoName.substring(0, 20)}..." : photoName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
