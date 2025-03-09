import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'wallpaper.dart';
import 'search.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController controller;
  final Map<String, String> header = {
    "Authorization": "vdFXYFKp49vJ5gv1jJN6ACAOEV1rmHTz8wohz5P9A88rswJQrKHsNXn3"
  };

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  /// **Creates API URL based on search query, page, and per_page count**
  String find(String query, int pageNo, int perPage) {
    return "https://api.pexels.com/v1/search?query=${query.trim()}&per_page=$perPage&page=$pageNo";
  }

  /// **Fetch data from API**
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(find("wallpapers", 1, 15)), headers: header);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Pexels App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          WallpaperPage(fetchData),
          SearchPage(),// Pass fetchData function instead of responseData
          // Also allow search to fetch fresh data
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(Icons.image, size: 32),
            child: Text("Wallpapers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Tab(
            icon: Icon(Icons.search, size: 32),
            child: Text("Search", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}