# RemoteRecruit - Job Browser App
A modern iOS application built with SwiftUI that allows users to browse remote job listings using the Remotive API. The project demonstrates scalable architecture, dependency injection, async networking, search functionality, coordinator-based navigation, and comprehensive unit testing.

## ✨ Features

- 🔍 Browse remote job listings
- 🔎 Search by title, company, or category
- 📄 View detailed job information
- 🌐 Render HTML job descriptions
- ⚡ Async/Await networking
- 🧩 Dependency Injection
- 🧭 Coordinator-based navigation
- 🧪 Unit Testing
- ✅ 70%+ Code Coverage

---

## 🏗️ Architecture

This project follows **Clean Architecture** with the **MVVM** pattern.

```text
                    ┌────────────────────────┐
                    │     SwiftUI Views      │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │      ViewModels        │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │       Use Cases        │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │ Repository Protocol    │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │ Repository Implementation│
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │    Network Client      │
                    └──────────┬─────────────┘
                               │
                               ▼
                         🌐 Remotive API
```

---

# 📂 Project Structure

```text
RemoteRecruit
│
├── App
│
├── Coordinators
│
├── Core
│   ├── Configuration
│   ├── Networking
│   ├── Services
│   └── Utilities
│
├── DI
│
├── Domain
│   ├── Models
│   ├── Repository
│   └── UseCases
│
├── Presentation
│   ├── Views
│   ├── Components
│   └── ViewModels
│
├── Extensions
│
└── Resources
```

---

# 🧱 Layers

## Presentation

Responsible for the UI.

- SwiftUI Views
- ViewModels
- Coordinator Navigation

The ViewModels handle presentation logic while Views remain lightweight.

---

## Domain

Contains the business logic.

- Models
- Repository Protocols
- Use Cases

The Domain layer is completely independent of UI and networking.

---

## Data

Responsible for data retrieval.

```text
Repository
      │
      ▼
NetworkClient
      │
      ▼
Remotive API
```

Responsibilities

- API Requests
- JSON Decoding
- Error Handling
- Repository Implementation

---

# 💉 Dependency Injection

Dependencies are managed through a dedicated `DependencyContainer`.

```text
DependencyContainer
      │
      ├── NetworkClient
      ├── JobRepository
      ├── GetJobsUseCase
      └── ViewModels
```

### Benefits

- Loose Coupling
- Easy Testing
- Mock Implementations
- Better Maintainability

---

# 🧭 Coordinator Pattern

Navigation is separated from Views.

```text
Job List
    │
    ▼
Job Detail
```

### Benefits

- Centralized Navigation
- Better Separation of Concerns
- Improved Scalability

---

# 🌐 Networking

The networking layer is fully reusable.

### Components

- NetworkClient
- Endpoint
- Environment
- ConnectivityMonitor
- NetworkError

### Features

- Async/Await
- Generic Requests
- Codable Support
- Internet Connectivity Monitoring
- Custom Error Handling

---

# 🔄 MVVM Flow

```text
View
 │
 ▼
ViewModel
 │
 ▼
UseCase
 │
 ▼
Repository
 │
 ▼
NetworkClient
 │
 ▼
REST API
```

---

# 🛠️ Technologies

| Technology | Usage |
|------------|-------|
| Swift 5 | Language |
| SwiftUI | UI Framework |
| MVVM | Architecture |
| Clean Architecture | Project Structure |
| Coordinator Pattern | Navigation |
| Async/Await | Concurrency |
| URLSession | Networking |
| Codable | JSON Parsing |
| XCTest | Unit Testing |

---

# ⚠️ Error Handling

The application gracefully handles:

- No Internet Connection
- Invalid URL
- Server Errors
- Decoding Errors
- Unknown Errors

using a custom `NetworkError`.

---

# 🔍 Search

Supports searching by:

- Job Title
- Company

Filtering is performed locally after the initial API fetch for a fast and responsive user experience.

---

# 🌐 HTML Rendering

Job descriptions are rendered using a reusable `HTMLTextView` component that converts HTML into an attributed string for display in SwiftUI.

---

# 🧪 Testing

Unit tests cover:

- ✅ NetworkClient
- ✅ Repository
- ✅ Use Cases
- ✅ ViewModels
- ✅ Models
- ✅ Endpoint
- ✅ NetworkError

### Test Structure

```text
RemoteRecruitTests
│
├── EndpointTests
├── NetworkClientTests
├── NetworkErrorTests
├── JobRepositoryTests
├── JobModelTests
├── JobListViewModelTests
├── JobDetailViewModelTests
│
├── Mocks
│   ├── MockNetworkClient
│   ├── MockNetworkSession
│   ├── MockRepository
│   └── MockUseCase
```

---

# 🎯 Design Principles

- SOLID Principles
- MVVM
- Clean Architecture
- Dependency Injection
- Protocol-Oriented Programming
- Composition over Inheritance
- Separation of Concerns

---

# 🚀 Future Improvements
- Server-side (Remote) Search using API query parameters
- Infinite Pagination
- Pull to Refresh
- Favorites
- Job Sharing
- Advanced Filters
- Image Caching
- Offline Storage (SwiftData/Core Data)
- Snapshot Testing
- Firebase Analytics
- Firebase Crashlytics
- Push Notifications
- User Authentication
- Dark Mode Support

---

# 👨‍💻 Author

**Kinjal Ughreja**
Senior iOS Developer

Repository : https://github.com/ksanandiya/RemoteRecruit
