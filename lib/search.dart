import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  SearchPage({super.key}); // Remove responseData from the constructor

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> searchResults = [];
  bool isLoading = false;

  final Map<String, String> headers = {
    "Authorization": "vdFXYFKp49vJ5gv1jJN6ACAOEV1rmHTz8wohz5P9A88rswJQrKHsNXn3"
  };

  Future<void> searchWallpapers(String query) async {
    if (query.isEmpty) return;
    setState(() => isLoading = true);

    final response = await http.get(
      Uri.parse("https://api.pexels.com/v1/search?query=${query.trim()}&per_page=50"),
      headers: headers,
    );

    final data = jsonDecode(response.body);
    setState(() {
      searchResults = data['photos'] ?? [];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
              ),
              onFieldSubmitted: (query) => searchWallpapers(query),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : searchResults.isEmpty
                ? Center(child: Text("No results found"))
                : GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                var photo = searchResults[index];
                String imageUrl = photo["src"]["medium"];

                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
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
