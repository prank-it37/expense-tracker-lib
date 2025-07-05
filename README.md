# GDGC Submission

This repo contains only the `lib\` folder and README file, which holds the Dart source code for the project.
I couldn't add rest of the folders due to some GitHub error which I wasn't able to resolve even after multiple attempts.


Flutter Expense Tracker with Google Sheets Integration

Overview:

This project is a lightweight, cross-platform expense tracking application developed using Flutter. It utilizes the Google Sheets API as a backend, enabling users to record, view, and manage their expenses without a dedicated server.
The application is built with a simplified Neumorphic user interface and is compatible with both Android and Windows platforms.


Technologies Used:

- Flutter (Dart)
- Google Sheets API
- gsheets (Flutter package)
- Android Studio


Live Demo:

Google Sheets (Demo Spreadsheet):
https://docs.google.com/spreadsheets/d/1p8_zkzSauxerh0Fxb-_2vdITEVe87AqDHq8Z4bITUhY/edit?gid=0#gid=0

You may use the provided spreadsheet or configure your own by linking it to the application.

How to configure google_sheets_api.dart file (recommended):
https://youtu.be/ZSSERiYLv3c?si=5uZnmH9YVOIuw3zw

Features:

- Record daily expenses with description and amount
- Store and sync data directly to Google Sheets
- Minimalist, Neumorphic UI design
- Cross-platform support (Android and Windows)
- No backend infrastructure required


Planned Updates:

- Add light/dark mode toggle within the app
- Enable in-app deletion of expense records


Setup Instructions:

1. Clone the repository:
   git clone https://github.com/your-username/flutter-expense-tracker.git
   cd flutter-expense-tracker

2. Install dependencies:
   flutter pub get

3. Set up Google Sheets API:
    - Enable the Google Sheets API in Google Cloud Console
    - Create credentials (service account) and download the JSON key file
    - Add the spreadsheet ID and credentials to the configuration file in the project
    - Share the Google Sheet with the service account email

4. Run the application:
    - For Android:
      flutter run
    - For Windows:
      flutter run -d windows


Project Purpose:

The purpose of this project is to provide a simple expense tracking solution using Flutter and a Google Sheets-based backend. It is ideal for users who prefer not to manage a server or database and want full transparency over their data.


Contact:

For questions or suggestions, feel free to open an issue in the repository or reach out directly.
