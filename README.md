📱 Pexel App — Wallpaper Downloader

The Pexel App is a Flutter-based mobile application that allows users to search, view, and download high-quality wallpapers retrieved from the Pexels API.
Users can browse trending wallpapers or search by category/keyword and download them locally.

✨ Features

✔ Fetch high-resolution wallpapers from Pexels API
✔ Search wallpapers by keywords
✔ View wallpaper previews in full screen
✔ Download images to device
✔ Clean & minimal UI

🗂 Project Structure

The folder structure inside pexel_app/lib:

pexel_app/
└── lib/
    ├── dartjson.dart       # JSON model for API response
    ├── json.json           # Sample JSON dataset (for testing/mock)
    ├── main.dart           # App entry point (UI + routing)
    ├── search.dart         # Search screen for querying wallpapers
    ├── wallpaper.dart      # Full-screen wallpaper viewer + download

🛠 Tech Stack

Layer	Technology
Language	Dart
Framework	Flutter
API Provider	Pexels API
Device Storage	File download (for wallpapers)

🔑 API Setup (Pexels API)

1.Create an account on Pexels Developers
2.Generate an API key
3.Add your key to API header in your request:
headers: {
  "Authorization": "<YOUR_PEXELS_API_KEY>"
}

🚀 Getting Started

1. Clone the Repository
git clone https://github.com/<your_username>/pexel_app.git
cd pexel_app

2. Install Dependencies
flutter pub get

3. Run the App
flutter run

📸 Usage Overview

Launch the app
Browse trending wallpapers
Use search bar to explore categories (e.g. cars, nature, anime)
Tap any wallpaper → view fullscreen
Tap download icon to save locally

🎯 Future Improvements 

🔹 Add categories page
🔹 Dark / Light theme switch
🔹 Favorites / Liked wallpapers list
🔹 Pagination for endless scrolling


