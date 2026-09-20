# 🛒 Super Market

A modern **Flutter e-commerce application** built with a clean and scalable architecture.
The app provides a complete shopping experience including authentication, product browsing, search, categories, brands, favorites, cart management, profile management, and theme switching.

## ✨ Features

### 🔐 Authentication

* User registration
* Login
* Forgot password flow
* Verification code
* Create new password
* Authentication state persistence
* Automatic route protection

### 🏠 Home

* Browse product categories
* Browse brands
* View products
* Product pagination
* Promotional sections
* Quick access to different store sections

### 🔎 Search

* Search for products
* Paginated search results
* Debounced search input

### 📦 Products

* Product listing
* Product details
* Product images
* Product ratings
* Product reviews
* Product information

### 🛍️ Shopping

* Add products to cart
* Remove products from cart
* Update cart quantities
* Add/remove favorites
* Persist cart and favorites locally

### 👤 Profile

* View cached user information
* Edit profile
* Logout
* Profile-related dialogs and states

### 🎨 UI & Experience

* Light and Dark themes
* Responsive UI using `flutter_screenutil`
* Reusable custom widgets
* Loading and shimmer states
* Error and empty states
* Centralized colors, text styles, assets, and constants

---

## 🏗️ Architecture

The project follows a **Feature-based Clean Architecture** approach.

Each major feature is separated into:

```text
feature/
├── data/
│   ├── data_source/
│   ├── models/
│   └── repository/
│
├── domain/
│   ├── repositories/
│   └── usecases/
│
└── presentation/
    ├── view/
    ├── widgets/
    └── view_model/
```

### Core Layer

Shared application-level functionality is placed inside `core/`:

```text
core/
├── common/
├── constants/
├── di/
├── errors/
├── network/
├── routing/
├── services/
├── themes/
├── usecase/
└── utils/
```

This keeps reusable infrastructure separate from business features.

---

## 🧩 State Management

The project uses **Flutter BLoC/Cubit** for state management.

Different features have dedicated ViewModels/Cubits, for example:

* `HomeViewModel`
* `LoginViewModel`
* `SignUpViewModel`
* `SearchViewModel`
* `ProductDetailsViewModel`
* `ProfileViewModel`
* `OnboardingViewModel`
* `StoreCubit`

Application dependencies and repositories are provided through `MultiRepositoryProvider`.

---

## 🌐 Networking

The application communicates with a REST API using:

* **Dio**
* Custom `ApiClient`
* `ApiConsumer` abstraction
* Centralized API handling
* Request/response interception
* Bearer token authentication

The API layer is separated from feature business logic through repositories and remote data sources.

---

## 💾 Local Storage

The app uses **SharedPreferences** for local persistence.

Stored information includes:

* Authentication token
* Cached user information
* Onboarding completion status
* Favorite product IDs
* Cart quantities
* Cached store products
* Theme preference

This allows important application state to survive app restarts.

---

## 🧭 Navigation

Navigation is handled using **GoRouter**.

The project includes:

* Centralized route definitions
* Named routes
* Authentication-based redirects
* Protected routes
* Splash and onboarding flow

Main navigation paths include:

```text
Splash
   ↓
Onboarding
   ↓
Authentication
   ↓
Home
   ├── Categories
   ├── Brands
   ├── Search
   ├── Product Details
   ├── Cart
   ├── Favorites
   └── Profile
```

---

## 📁 Project Structure

```text
lib/
│
├── app/
│   └── app.dart
│
├── core/
│   ├── common/
│   ├── constants/
│   ├── di/
│   ├── errors/
│   ├── network/
│   ├── routing/
│   ├── services/
│   ├── themes/
│   ├── usecase/
│   └── utils/
│
├── features/
│   ├── authentication/
│   ├── category/
│   ├── home/
│   ├── onboarding/
│   ├── product_details/
│   ├── profile/
│   ├── search/
│   ├── splash/
│   └── store/
│
└── main.dart
```

---

## 🛠️ Technologies & Packages

The project is built using:

* **Flutter**
* **Dart**
* **flutter_bloc**
* **Dio**
* **GoRouter**
* **SharedPreferences**
* **Dartz**
* **Flutter ScreenUtil**

### Main concepts used

* Clean Architecture
* Feature-based project structure
* Repository Pattern
* Use Case Pattern
* Dependency Injection
* Cubit / ViewModel state management
* REST API integration
* Local persistence
* Pagination
* Debouncing
* Responsive UI
* Light/Dark Theme

---

## 🚀 Getting Started

### Prerequisites

Make sure you have installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* An Android/iOS emulator or physical device

### Installation

Clone the repository:

```bash
git clone <repository-url>
```

Navigate to the project:

```bash
cd super_market
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## 🔄 Application Flow

```text
App Launch
    │
    ▼
   Splash
    │
    ├── First Launch ──► Onboarding
    │                         │
    │                         ▼
    │                      Login/Sign Up
    │
    └── Existing User ───────► Home
                                  │
                                  ├── Browse Products
                                  ├── Search
                                  ├── Categories
                                  ├── Brands
                                  ├── Product Details
                                  ├── Favorites
                                  ├── Cart
                                  └── Profile
```

---

