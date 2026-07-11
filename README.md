# Task Manager — Dart & Flutter

A simple, clean Task Manager application built with **Dart** and **Flutter**, developed for the CPL (Concepts of Programming Languages) course at Beirut Arab University. The project demonstrates core programming constructs — variables, lists, classes, functions, and object-oriented design — first in a logic-only Dart implementation, then expanded into a polished, mobile-friendly Flutter UI.

## Overview

The app lets users add, view, mark as done, and delete tasks, with each task automatically assigned a unique ID. Every task can also be flagged as **urgent** and assigned a **category** (Work, Personal, Study, Shopping, Other), giving the list a bit of real-world structure beyond a plain to-do list.

## Features

- **Add tasks** — enter a title, mark it as urgent, and assign it a category
- **Task list** — displays all tasks in a modern, card-based UI with shadows and rounded corners
- **Mark as done** — check off tasks, which strikes through the title
- **Delete tasks** — remove any task with a single tap
- **Urgent highlighting** — urgent task titles are shown in red for quick visual scanning
- **Empty state** — a friendly "No tasks yet 🚀" message when the list is empty
- **Automatic ID assignment** — every task gets a unique, auto-incrementing ID

## Project Structure

```
lib/
├── main.dart          # App entry point and Flutter UI (StatefulWidget, layout, styling)
├── task.dart          # Task model class (id, title, isUrgent, category, isDone)
└── task_manager.dart  # Business logic: add, delete, and toggle tasks
```

## Architecture

The project follows a clean separation between **logic** and **presentation**:

- **`Task`** — a simple data model representing a single task
- **`TaskManager`** — owns the in-memory list of tasks and exposes `addTask()`, `deleteTask()`, and `toggleDone()`
- **`TaskApp`** — a `StatefulWidget` that renders the UI and calls into `TaskManager`, using `setState()` to refresh the screen whenever tasks change

This mirrors the project's original development path: the task logic was written and tested as a Dart console app first, then wrapped in a Flutter interface without changing the underlying data model.

## Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- Dart SDK (bundled with Flutter)
- Android Studio, VS Code, or any Flutter-compatible IDE
- An emulator or physical device to run the app

## Setup & Run

1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   cd task-manager
   ```
2. Get the dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Dart vs. Java

Part of this project involved comparing Dart to Java, a language studied earlier in the course:

| Aspect | Dart | Java |
|---|---|---|
| Readability | Cleaner, less boilerplate | More verbose but structured |
| Writability | Quicker to write, optional typing | Requires more setup (classes, types) |
| Reliability | Reliable, more flexible | Strong compile-time checking |
| Speed | Optimized for UI/mobile (via Flutter) | Typically faster for backend systems |

## Challenges & Solutions

- **Class recognition issues**: `Task` wasn't recognized at first — resolved by placing `task.dart` and `task_manager.dart` inside the `lib/` directory, as required by Flutter's project structure.
- **UI design**: the first UI pass looked too plain, so it was refined using `Card()` widgets, a styled `AppBar()`, consistent spacing via `Padding()`/`SizedBox()`, and custom button styling with `ElevatedButton.styleFrom()`.
- **State management**: learning how `setState()` triggers UI rebuilds when tasks are added, completed, or removed.

## Authors

- Hana Kaikati
- Ghida Bahlawan

**Course:** CPL — Beirut Arab University
**Instructors:** D. Lama, Miss Sarah Jrad

## Possible Improvements

- Persist tasks locally (e.g., with `shared_preferences` or a local database) so they survive app restarts
- Add task editing, due dates, and sorting/filtering by category or urgency
- Migrate state management to `Provider`, `Riverpod`, or `Bloc` for larger-scale growth

## License

Add your preferred license here (e.g., MIT).
