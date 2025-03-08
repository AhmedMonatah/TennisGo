<p align="center">
  <img src="your_image_url" width="150" style="border-radius: 50%; border: 4px solid;" alt="https://github.com/user-attachments/assets/182450ef-9a43-416b-8362-d822efa1d07d">
</p>
# 🎾 TennisGo App

Welcome to **TennisGo**! This Flutter application helps tennis players check real-time weather conditions and determine whether they can train. The app also includes AI-powered features for weather analysis and predictions.

## 🌟 Features

- **Real-time Weather Data**: Get accurate weather updates based on your location or selected cities. 🌍
- **AI-Powered Predictions**: Uses a trained model to suggest whether conditions are suitable for tennis training. 🎾
- **User-Friendly Interface**: A clean and intuitive UI for seamless navigation. 🖥️
- **Offline Storage**: Saves user preferences and favorite locations using **SharedPreferences**. 💾

## 🛠️ Technologies Used

- **Flutter**: A powerful UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. 📱
- **BLoC (Business Logic Component)**: Implements the BLoC pattern for state management. ⚙️
- **SharedPreferences**: Provides persistent storage for user settings. 📦
- **Flask API**: Hosts an AI model for weather-based training recommendations. 🚀

## 🚀 Getting Started

Follow these steps to set up the project and host the AI model locally:

### 1. Set Up and Run the AI Model

```bash
# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate  # macOS/Linux
source venv/Scripts/activate  # Windows

# Install dependencies
pip install Flask numpy scikit-learn==1.3.2

# Run the AI model
python app.py
```

### 2. Verify the AI Model Hosting
Check if the model is hosted successfully by visiting:
```
http://127.0.0.1:5001
```

### 3. Connect Your Flutter App to the AI Model
Use the following endpoint in your Flutter app to send data to the AI model:
```
http://10.0.2.2:5001/predict
```

## 📸 Screenshots

<table align="start">
  <tr>
    <th>Splash Screen</th>
    <th>Onboarding 1</th>
    <th>Onboarding 2</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/15f77474-d9f2-4f70-934a-7a7d9b18376f" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/49e1cb8f-501a-48e7-a2a1-9ec92afc1e59" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/daeadbc2-3532-4d5c-b934-c4a070156643" width="200"></td>
  </tr>
  <tr>
    <th>Onboarding 3</th>
    <th>Sign-In</th>
    <th>Sign-Up</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/5f30fc1b-dc25-4afd-ade0-f357f812826b" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/5cfa36c6-f0e4-4675-951c-993c5a1b26e6" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/0849916f-f1e0-4ffe-81a8-9f809e0ac99b" width="200"></td>
  </tr>
  <tr>
    <th>Search</th>
    <th>Weather</th>
    <th>Favorite City</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/21b40f41-da80-4e01-b7b3-ad77c6cb968a" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/7ae648f5-0e37-4ca7-ab53-cde138891525" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/00e614de-8726-4690-9212-8dbf9a74663d" width="200"></td>
  </tr>
  <tr>
    <th>Graph</th>
    <th>AI Model Check</th>
    <th>AI Model Check 2</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/6d1887c0-1d89-4e62-9e0c-ac3988cd87c3" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/6ca3cd50-26d0-4862-b235-3a00ffdfea2a" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/ddf7b87a-969a-434c-8554-f16ced1253be" width="200"></td>
  </tr>
</table>

## 🎾 Get Started with Flutter

```bash
# Clone the repository
git clone https://github.com/yourusername/TennisGo.git

# Navigate to the project directory
cd TennisGo

# Install dependencies
flutter pub get

# Run the application
flutter run
```

Enjoy using **TennisGo** and take your tennis training to the next level! 🚀

