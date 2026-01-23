# 📱 Pexel App — Wallpaper Downloader

The **Pexel App** is a Flutter-based mobile application that allows users to search, view, and download high-quality wallpapers retrieved from the **Pexels API**.  
Users can browse trending wallpapers or search by category/keyword and download them locally.

---

## ✨ Features

- ✔ Fetch high-resolution wallpapers from Pexels API  
- ✔ Search wallpapers by keywords  
- ✔ View wallpapers in fullscreen mode  
- ✔ Download images to device  
- ✔ Clean & minimal UI  

---

## 📁 Project Structure

The folder structure inside `pexel_app/lib`:

pexel_app/
└── lib/
├── dartjson.dart
├── json.json
├── main.dart
├── search.dart
└── wallpaper.dart


---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Language | Dart |
| Framework | Flutter |
| API Provider | Pexels API |
| Storage | Device file system (downloads) |

---

## 🔑 API Setup (Pexels API)

1. Create an account on **Pexels Developers**
2. Generate an API Key
3. Add your API key to request headers:


headers: {
  "Authorization": "<YOUR_PEXELS_API_KEY>"
}

---


## 🚀 Getting Started
Clone the Repository
git clone https://github.com/<your_username>/pexel_app.git
cd pexel_app

Install Dependencies
flutter pub get

Run the App
flutter run

---

## 📸 Usage Flow

1.Open the app

2.Browse trending wallpapers

3Search wallpapers using keywords (ex: "nature", "anime", "cars")

4.Tap wallpaper → View full screen

5.Tap Download button to save locally

---

## 🚧 Future Improvements

🔹 Favorites / Saved wallpapers

🔹 Dark / Light theme

🔹 Infinite scrolling

🔹 Category browsing

---
