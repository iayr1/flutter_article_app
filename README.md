<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flutter Article App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0 auto;
            max-width: 800px;
            padding: 20px;
        }
        h1 {
            font-size: 2.5em;
            color: #333;
        }
        h2 {
            font-size: 1.8em;
            color: #444;
            margin-top: 1.5em;
        }
        strong {
            font-weight: bold;
        }
        small {
            font-size: 0.85em;
            color: #666;
        }
        pre {
            background: #f4f4f4;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1em 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background: #f4f4f4;
        }
        ul, ol {
            margin: 1em 0;
            padding-left: 2em;
        }
    </style>
</head>
<body>
    <h1>Flutter Article App</h1>
    <p><strong>A modern Flutter application</strong> designed using Clean Architecture principles and powered by BLoC for robust state management. Users can seamlessly view, add, update, and delete articles, all within a beautiful and responsive UI.</p>

    <h2>Features</h2>
    <ul>
        <li><strong>View all articles</strong></li>
        <li><strong>Add new articles</strong></li>
        <li><strong>Edit existing articles</strong></li>
        <li><strong>Delete articles</strong></li>
        <li><strong>Clean and scalable architecture</strong></li>
        <li><strong>Reactive state management</strong> using BLoC</li>
        <li><strong>Elegant and responsive UI</strong></li>
        <li><strong>Feedback via success and error SnackBars</strong></li>
        <li><strong>Offline storage</strong> using shared_preferences</li>
    </ul>

    <h2>Getting Started</h2>
    <h2>Clone the Repository</h2>
    <pre><code>git clone https://github.com/iayr1/flutter_article_app.git
cd flutter_article_app</code></pre>

    <h2>Install Dependencies</h2>
    <pre><code>flutter pub get</code></pre>

    <h2>Run the App</h2>
    <pre><code>flutter run</code></pre>

    <h2>Project Structure</h2>
    <pre><code>lib/
├── core/                 # Utilities, themes, constants
├── features/
│   └── posts/
│       ├── data/         # Data sources, models, repositories
│       ├── domain/       # Entities, use cases, abstractions
│       └── presentation/ # Blocs, events, states, UI widgets & pages
├── locator.dart          # Dependency injection setup
└── main.dart             # App entry point</code></pre>

    <h2>Tech Stack</h2>
    <table>
        <tr>
            <th>Layer</th>
            <th>Package</th>
        </tr>
        <tr>
            <td>UI</td>
            <td>Flutter SDK</td>
        </tr>
        <tr>
            <td>State Management</td>
            <td>flutter_bloc</td>
        </tr>
        <tr>
            <td>Architecture</td>
            <td>Clean Architecture</td>
        </tr>
        <tr>
            <td>Networking</td>
            <td>http</td>
        </tr>
        <tr>
            <td>Dependency Injection</td>
            <td>get_it</td>
        </tr>
        <tr>
            <td>Code Utilities</td>
            <td>equatable</td>
        </tr>
        <tr>
            <td>Offline Storage</td>
            <td>shared_preferences</td>
        </tr>
    </table>

    <h2>State Management</h2>
    <p>This app uses the <strong>BLoC pattern</strong> (<code>flutter_bloc</code>) to handle all UI-related state changes:</p>
    <ul>
        <li>Events triggered by user interaction are passed to BLoCs.</li>
        <li>BLoCs call Use Cases to execute business logic.</li>
        <li>States are emitted in response to success or failure, updating the UI reactively.</li>
    </ul>
    <p><small>This ensures a clear separation of concerns and maintainable, testable code.</small></p>

    <h2>Testing</h2>
    <p>To run unit and widget tests:</p>
    <pre><code>flutter test</code></pre>
    <p><small>Tests can be added to verify BLoC logic, use cases, and UI components.</small></p>

    <h2>Limitations / To-Do</h2>
    <ul>
        <li><strong>No pagination</strong> in article list</li>
        <li><strong>No backend integration</strong> (ready for REST API)</li>
        <li><strong>Authentication</strong> not yet implemented</li>
    </ul>

    <h2>Screenshots</h2>
    <p><small>Coming soon</small></p>

    <h2>Contributing</h2>
    <p><strong>We welcome contributions!</strong> <small>Please follow clean code practices and use meaningful naming conventions.</small></p>

    <h2>License</h2>
    <p>This project is licensed under the <strong>MIT License</strong>.</p>
    <p><small>Made with Flutter</small></p>
</body>
</html>
