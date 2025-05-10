📰 Flutter Article App
A modern Flutter application designed using Clean Architecture principles and powered by BLoC for robust state management. Users can seamlessly view, add, update, and delete articles, all within a beautiful and responsive UI.

🚀 Features
📝 View all articles

➕ Add new articles

✏️ Edit existing articles

❌ Delete articles

🧱 Clean and scalable architecture

🔄 Reactive state management using BLoC

💡 Elegant and responsive UI

🔔 Feedback via success and error SnackBars

📲 Getting Started
1. Clone the repository
   bash
   Copy
   Edit
   git clone https://github.com/iayr1/flutter_article_app.git
   cd flutter_article_app
2. Install dependencies
   bash
   Copy
   Edit
   flutter pub get
3. Run the app
   bash
   Copy
   Edit
   flutter run
   🧱 Project Structure
   bash
   Copy
   Edit
   lib/
   ├── core/                    # Utilities, themes, constants
   ├── features/
   │   └── posts/
   │       ├── data/            # Data sources, models, repositories
   │       ├── domain/          # Entities, use cases, abstractions
   │       └── presentation/    # Blocs, events, states, UI widgets & pages
   ├── locator.dart             # Dependency injection setup
   └── main.dart                # App entry point
   ⚙️ Tech Stack
   Layer	Package
   UI	Flutter SDK
   State Management	flutter_bloc
   Architecture	Clean Architecture
   Networking	http
   Dependency Injection	get_it
   Code Utilities	equatable

🧠 State Management
This app uses the BLoC pattern (flutter_bloc) to handle all UI-related state changes.

Events triggered by user interaction are passed to BLoCs.

BLoCs call Use Cases to execute business logic.

States are emitted in response to success or failure, updating the UI reactively.

This ensures a clear separation of concerns and maintainable, testable code.

🧪 Testing
To run unit and widget tests:

bash
Copy
Edit
flutter test
Tests can be added to verify BLoC logic, use cases, and UI components.

⚠️ Limitations / To-Do
❌ No offline support (can be added with hive)

🔄 No pagination in article list

🌐 No backend integration (ready for REST API)

🔐 Authentication not yet implemented

📸 Screenshots
<!-- Add screenshots below --> <!-- ![Home Screen](assets/screenshot1.png) -->
🤝 Contributing
We welcome contributions! Please follow clean code practices and use meaningful naming conventions.

📄 License
This project is licensed under the MIT License.

Made with ❤️ using Flutter