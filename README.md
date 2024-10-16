# 🌤️ Weather_Tennis App

Welcome to the **Weather App**! This Flutter project is designed to provide real-time weather information for users around the world. This application showcases various Flutter features and best practices for app development.

## 🌟 Features

- **Real-time Weather Data**: Fetches current weather information based on user location or selected cities. 🌍
- **User-Friendly Interface**: A clean and intuitive UI for easy navigation and accessibility. 🖥️
- **Offline Storage**: Stores user preferences and favorite locations using **SharedPreferences**. 💾

## 🛠️ Technologies Used

- **Flutter**: A powerful UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. 📱
- **BLoC (Business Logic Component)**: Implements the BLoC pattern for effective state management, making the app scalable and maintainable. ⚙️
- **SharedPreferences**: Provides persistent storage for user settings and preferences. 📦
- **Git It**: A package to manage dependencies and configurations in the app, enhancing the development workflow. 🚀

## 🚀 Getting Started
CLone the repo and Local host the Ai Model by following these Instrcutions:

1-Run these commands in the terminal

python3 -m venv venv

source venv/bin/activate //MAC

source venv/Scripts/activate. // Windows

pip install Flask

pip show Flask

pip install numpy

pip install scikit-learn==1.3.2

python app.py

python app.py // to host the AI model and access it through your local host on port 5001.

2- check if your file sucess host success or not by try this IP ('http://127.0.0.1:5001') in your browser.

3- Send your list to the model using POST method use this IP : ('http://10.0.2.2:5001/predict') in your flutter app.

## 🎥 Video Tutorial



https://github.com/user-attachments/assets/6f884e55-2234-4ed0-9155-27ed23069840





To get started with this project, clone the repository and run the following commands:

```bash
# Clone the repository
git clone https://github.com/yourusername/weather_app.git

# Navigate to the project directory
cd weather_app

# Install the dependencies
flutter pub get

# Run the application
flutter run
