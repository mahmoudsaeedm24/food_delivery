# 📱 Flutter Food Delivery App

## 🚀 Overview

This is a **full-stack food delivery application** built with:

- **Flutter** (frontend)  
- **Node.js + Express** (backend)  
- **MongoDB Atlas** (cloud database)  
- **Hive** (local database for offline support)  

The app follows **Clean Architecture + MVVM** and uses **Cubit** for state management.  
It works seamlessly in **online/offline modes**, syncing data whenever the internet connection is restored.

---

## ✨ Features

- 🔐 **Authentication** with JWT  
- 📡 **Online Database**: MongoDB + REST API  
- 🗂️ **Offline Support** with Hive  
- 🏗️ **Clean Architecture + MVVM**  
- ⚙️ **State Management**: Cubit  
- 🔍 **Search functionality**  
- 🌐 Works in **both online & offline modes**  

---

## 🛠 Installation Guide

### 1. Clone the repository

```bash
git clone https://github.com/mahmoudsaeedm24/food_delivery
cd food_delivery
```

### 2. Backend Setup (Node.js + Express + MongoDB)

#### 📌 Requirements

- [Node.js](https://nodejs.org/) (LTS recommended)
- MongoDB (local or [MongoDB Atlas](https://www.mongodb.com/atlas))

#### ▶️ Setup

```bash
cd backend
npm install
```

Create a `.env` file inside `/backend` and add:

```env
PORT=3000
MONGO_DB=<your_mongo_connection_string>
USER_DB=<your_database_username>
PASS_DB=<your_database_password>
DB_NAME=<your_database_name>

JWT_EXPIRES_IN=1d
SECRET_KEY=<your_secret_key>
```

Run the backend in **development** mode:

```bash
npm run dev
```

Or in **production**:

```bash
npm start
```

👉 The backend will run on:  
`http://<YOUR_PC_IP>:3000/`

⚠️ **Note:**  
Since you are creating a **new database** (with your own credentials), you will **not find pre-existing data**.  
You need to insert your own collections/documents (e.g., users, categories, products) into MongoDB before testing.

---

### 3. Frontend Setup (Flutter App)

#### 📌 Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable)
- Android Studio / VS Code with Flutter & Dart plugins
- Emulator (Android/iOS) or physical device

#### ▶️ Setup

```bash
cd frontend
flutter pub get
```

---

### 🔧 Configure API Base URL (PC IP)

To connect the mobile app with the backend, set your **PC’s IP address** in the `api_constants.dart` file.

1. Open:

```bash
    lib/core/utils/network/api_constants.dart
    ```
    
2. Replace the `baseUrl` with your PC’s **local IP**:
    
    ```dart
    class ApiConstants {
      // Change this to your PC IP address
      static const String baseUrl = "192.168.1.5";
    }
    ```
    
3. Ensure your **PC and mobile device** are connected to the **same Wi-Fi network**.
    
4. Restart the app. ✅
    

⚠️ Note: Every time your **PC IP changes**, update this value in `api_constants.dart`.  
👉 To find your IP, run `ipconfig` (Windows) or `ifconfig` (Mac/Linux).

---

### 4. Run the App

Run in **debug mode**:

```bash
flutter run
```

Build a **release APK**:

```bash
flutter build apk --release
```

---

### 5. Local Database (Hive)

Hive is initialized automatically when the Flutter app runs.  
Make sure all adapters are registered (see `main.dart`).

---

## Troubleshooting

- ❌ **App cannot connect to backend**  
    ✅ Make sure your **PC and mobile device** are on the same Wi-Fi.  
    ✅ Check your **PC IP address** and update it in `api_constants.dart`.

- ❌ **Still can’t connect from mobile device**  
    ✅ Windows Defender Firewall may be blocking the connection.  
    👉 Temporarily **turn off Windows Defender Firewall** or create a firewall rule to allow traffic on port `3000`.

- ❌ **MongoDB connection issues**  
    ✅ Verify your `.env` credentials and whitelist your IP in MongoDB Atlas.
    ✅ Remember: your database starts **empty** — add collections and seed data before testing.

---

### 🎉 Done

- **Backend:** runs at `http://<YOUR_PC_IP>:3000/`

- **Frontend:** communicates with backend & MongoDB

- **Offline mode:** works automatically using Hive