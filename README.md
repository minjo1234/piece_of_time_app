## 📁 Project Structure

```bash
/piece_of_time_app
├── data
│   └── classes/
│       ├── notifiers.dart
│       └── constants.dart
├── pages/
├── widgets/
├── appBar/
├── main.dart
└── README.md

```

----
## 🔤 Naming Convention

| Element       | Style                  | Example                     |
| ------------- | ---------------------- | --------------------------- |
| Files/Folders | `snake_case`           | `main_frame.dart`           |
| Functions     | `lowerCamelCase`       | `loadUserData()`            |
| Variables     | `lowerCamelCase`       | `userName`, `itemCount`     |
| Classes       | `UpperCamelCase`       | `UserProfile`, `MainScreen` |
| Constants     | `SCREAMING_SNAKE_CASE` | `MAX_USERS`                 |

🔗 [Reference - Naming Guide](https://dalgonakit.tistory.com/115)


## Source file structure


---
## 🔀 Git Flow

- Branch name should match the ticket/task
- Assign a reviewer when creating a merge request
- Resolve all merge conflicts before submitting
---
## 🔧 How to run code 


---
## 🌐 Libraries Used

| Purpose      | Libraries                     |
| ------------ | ----------------------------- |
| Localization | `flutter_localizations`       |
| User State   | `shared_preferences`          |
| Calendar UI  | `syncfusion_flutter_calendar` |

---


🚀 MVP Features

### 1. 📅 Schedule Management

- Create, update, and delete plans
- View schedules by day, week, or month

### 2. 🗓️ Calendar Interface

- Display user schedules
- Add plans via modal dialog
- Choose custom colors for plans

### 3. 👥 Schedule Sharing

- Share schedules with friends or family
- View shared calendars

### 4. 🌗 Appearance Settings

- Light and dark mode support

### 5. ⏰ Notifications & Widgets

- Periodic alarms/reminders
- iOS and Android home screen widgets
- 
