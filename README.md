# 📝 Task Manager App - Flutter

A clean and maintainable **Task Manager** application built with **Flutter**, following principles of **Clean Architecture**, **SOLID**, and using advanced layering for scalability.

---

## 📱 Features

- Add new tasks with title and description(optional) 
- View a list of tasks
- Edit existing tasks by swipe
- Delete tasks by swipe
- Local storage using **Hive**

---

## 📁 Project Structure

```
lib/
│
├── core/                         # Core utilities shared across the app
│   ├── di/                       # Dependency Injection setup (GetIt)
│   ├── style/                    #  colors, text styles
│   ├── utils/                    # Helper functions, constants, validators
│   └── routes/                   # App routing and navigation
│
├── features/                     # Task feature module
│   ├── data/                     # Data layer
│   │   ├── datasources/          # Local data  (e.g., Hive)
│   │   ├── mappers/              # Convert between model <-> entity
│   │   ├── models/               # Data models for storage
│   │   └── repositories/         # Repository implementations
│   │
│   ├── domain/                   # Business logic
│   │   ├── entities/             # TaskEntity and base domain models
│   │   ├── repositories/         # Abstract repository interfaces
│   │   └── usecases/             # Use case classes (AddTask, DeleteTask, EditTask ,viewTask)
│   │
│   └── presentation/             # UI Layer
│       ├── view/                 # Screens and pages (e.g., TaskListView)
│       ├── view_model/           # Cubit/Bloc classes for managing state
│       └── widgets/              # Reusable components (e.g., TaskItem)
│
├── main.dart                     # App entry point
└── task_manager_app.dart         # Root widget of the application
```

---

## 🧠 Architecture

This project implements **Clean Architecture**, ensuring separation of concerns and maintainability:

- **Core Layer** – Shared utilities and DI setup
- **Features Layer** – Fully encapsulated task module
    - **Data Layer** – Responsible for accessing and converting data
    - **Domain Layer** – Defines business rules, entities, and use cases
    - **Presentation Layer** – UI, state management (Bloc/Cubit)

---

## ⚙️ Key Concepts & Tools Used

| Concept/Tool         | Description                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Bloc / Cubit**     | Used for reactive and testable state management. It helps in maintaining clean and manageable states across the application by separating business logic from UI code. Cubit simplifies testing and makes state transitions more predictable. By using doAction within the Cubit, actions like add, edit, and delete tasks can be executed centrally, improving code maintainability and ensuring each action is isolated for easy unit testing. 
| **GetIt**            | Service locator for dependency injection It facilitates handling dependencies between different application components, and allows services to be created only when needed, which helps reduce resource consumption.                                                                                                                                                                                                                                                                                                                                                                                                      |
| **Hive**             | Fast & lightweight local data storage                                                                                                                                                                                                                                                                                                                                                                                                           |
| **Clean Architecture** | For scalable and testable code organization and makes it easier to test each layer of the application independently.                                                                                                                                                                                                                                                                                                                            |
| **SOLID Principles** | Reduce duplication system while making it easier to add new features or modify quality without improving the system.                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **OOP Principles**   | The system becomes more scalable and modifiable, with the ability to handle complex code.                                                                                                                                                                                                                                                                                                                                                                                           |

---

## 🧱 Clean Architecture in Action

Each user action (Add, Edit, Delete) is handled using:

- **Presentation Layer** – Calls Cubit (e.g., `TaskCubit`)
- **Use Case Layer** – Handles business logic (e.g., `AddTaskUseCase`)
- **Repository Interface** – Defined in domain, implemented in data
- **Data Layer** – Saves data using Hive via a `LocalDataSource`

---

## 🧪 Use Cases

Each action is mapped to a use case for reusability:

- `GetAllTasksUseCase`
- `AddTaskUseCase`
- `EditTaskUseCase`
- `DeleteTaskUseCase`

---

## 💉 Dependency Injection with GetIt

Dependencies like repositories, data sources, and Cubits are injected using **GetIt**, improving testability and decoupling


---

## 💾 Local Database: Hive

The app uses **Hive** as the local NoSQL database:

- All task data is saved in a Hive box as `TaskModel`
- Data is accessed in `TaskLocalDataSourceImpl`
- `TaskMapper` handles conversion between domain entities and Hive models

This provides fast local storage without the need for internet connection.

---

## 🎯 SOLID Principles

| Principle                  | Applied In                                                                                                                                                     |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **S - Single Responsibility** | `TaskCubit` only manages state, `UseCases`encapsulate business logic, and `Repositories` handle data access. Each class has a single, clear responsibility     |
| **O - Open/Closed**           | Used `TaskDataSource` abstraction in `TaskRepositoryImpl`, allowing new data source (e.g., TaskRemoteDataSourceImpl) can be added without modifying existing code |
| **L - Liskov Substitution**   | Any class implementing `TaskRepository` or `TaskDataSource` can replace the original without breaking the application.|
| **I - Interface Segregation** | Interfaces are well-separated and specific. For example, `TaskDataSource` defines only the task-related methods needed.|
| **D - Dependency Inversion**  | High-level modules like `Cubit` and `UseCases` depend on abstractions (interfaces), not concrete implementations, using GetIt for injection.|

---

## 🧠 OOP Principles

| Principle      | Implementation                                                                                                                                                               |
|----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Encapsulation** | Logic is encapsulated within classes like `TaskCubit`, `TaskRepositoryImpl`, `UseCases`,hiding the details of data manipulation and state management from the outside world. |
| **Inheritance**   | `TaskAction` serves as a base class for specific actions like `AddTask`, `DeleteTask` allowing for polymorphic behavior based on the action type                             |
| **Polymorphism**  | The system supports multiple implementations of `TaskRepository`, `TaskDataSource`, (e.g., `TaskLocalDataSourceImpl`, `TaskRemoteDataSourceImpl`), allowing dynamic behavior at runtime    |
| **Abstraction**  |	The use of interfaces like `TaskDataSource` abstracts data access details, allowing the higher layers of the application (like `TaskRepositoryImpl` and `TaskCubit`) to interact with data sources without knowing their specific implementations. This creates flexibility and decouples implementation from usage.|


---

## 📈 Scalability Ready

With its modular and layered structure, this app can be easily extended to:

- Add filters or sorting
- Integrate with Firebase or REST APIs
- Add task notifications or alarms
