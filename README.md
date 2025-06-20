# Anime App 📱

A modern Flutter application that provides a comprehensive anime browsing experience using the Jikan API (MyAnimeList API). The app features a clean, responsive UI with state management using BLoC pattern and follows Flutter best practices.

## 🎯 Features

### Core Features
- **Anime Discovery**: Browse and discover anime from MyAnimeList database
- **Categorized Content**: Separate sections for TV Anime, Movies, and All Anime
- **Detailed Information**: Comprehensive anime details including ratings, episodes, synopsis, and more
- **Trailer Integration**: Watch anime trailers directly within the app
- **Responsive Design**: Optimized for various screen sizes and orientations
- **Multi-language Support**: Internationalization support (currently English)
- **Offline Image Caching**: Cached network images for better performance

### UI/UX Features
- **Carousel Slider**: Featured anime showcase with auto-play functionality
- **Shimmer Effects**: Loading animations for better user experience
- **Custom Cards**: Beautiful anime cards with hover effects and shadows
- **Smooth Navigation**: Seamless transitions between screens
- **Toast Notifications**: User-friendly error and success messages
- **WebView Integration**: In-app trailer viewing experience

## 🏗️ Architecture

The app follows a clean architecture pattern with the following layers:

### 1. **Presentation Layer** (`lib/view/`)
- **Home Screen**: Main dashboard with carousel and categorized anime lists
- **Details Screen**: Comprehensive anime information display
- **WebView Screen**: In-app trailer viewing
- **Custom Widgets**: Reusable UI components

### 2. **Business Logic Layer** (`lib/viewmodel/`)
- **BLoC Pattern**: State management using flutter_bloc
- **Home Bloc**: Manages home screen data and state
- **Details Bloc**: Handles anime detail page logic
- **WebView Bloc**: Manages web view functionality

### 3. **Data Layer** (`lib/repository/`)
- **Home Repository**: Data access layer for anime information
- **API Integration**: RESTful API communication

### 4. **Core Layer** (`lib/core/`)
- **API Configuration**: HTTP client setup and endpoint management
- **Routing**: App navigation and route management
- **Theming**: Consistent design system
- **Localization**: Multi-language support
- **Utilities**: Helper functions and constants

### Home Screen
- Carousel slider with featured anime
- Categorized sections (TV Anime, Movies, All Anime)
- Horizontal scrolling anime cards
- Responsive grid layout

### Details Screen
- Large anime poster image
- Comprehensive information display
- Interactive trailer button
- Producer, genre, and theme chips
- Broadcast information
- Synopsis and background details

## 🛠️ Technology Stack

### Core Dependencies
- **Flutter**: 3.0.0+ (SDK)
- **Dart**: Latest stable version

### State Management
- **flutter_bloc**: ^9.1.1 - BLoC pattern implementation
- **bloc**: ^9.0.0 - Core BLoC functionality

### Networking & API
- **dio**: ^5.8.0+1 - HTTP client for API requests
- **pretty_dio_logger**: ^1.4.0 - API request/response logging

### UI & Design
- **flutter_screenutil**: ^5.9.3 - Responsive design utilities
- **google_fonts**: ^6.2.1 - Custom typography (Poppins)
- **shimmer**: ^3.0.0 - Loading animations
- **carousel_slider**: ^5.1.1 - Image carousel functionality
- **cached_network_image**: ^3.4.1 - Image caching
- **smooth_page_indicator**: ^1.2.1 - Carousel indicators
- **toastification**: ^3.0.3 - Toast notifications

### Navigation & Web
- **webview_flutter**: ^4.13.0 - In-app web browsing
- **url_launcher**: ^6.3.1 - External link handling

### Localization
- **flutter_localizations**: SDK - Flutter localization
- **intl**: ^0.19.0 - Internationalization utilities
- **intl_utils**: ^2.8.10 - Localization code generation

### Utilities
- **equatable**: ^2.0.7 - Value equality
- **gap**: ^3.0.1 - Spacing utilities
- **shared_preferences**: ^2.5.3 - Local data storage

## 📁 Project Structure

```
lib/
├── core/
│   ├── api_config/
│   │   ├── client/
│   │   │   └── api_client.dart          # HTTP client configuration
│   │   └── endpoint/
│   │       └── api_endpoint.dart        # API endpoints
│   ├── app/
│   │   └── my_app.dart                  # Main app configuration
│   ├── constant/
│   │   └── app_constants.dart           # App constants
│   ├── flavourconfig/
│   │   ├── env_config.dart              # Environment configuration
│   │   └── flavor_config.dart           # Build flavor settings
│   ├── generated/
│   │   └── intl/                        # Generated localization files
│   ├── l10n/
│   │   ├── intl_en.arb                  # English localization strings
│   │   ├── l10n.dart                    # Localization setup
│   │   └── language/                    # Language BLoC
│   ├── routes/
│   │   └── app_router.dart              # App routing configuration
│   ├── theme/
│   │   └── theme.dart                   # App theming
│   └── utils/
│       ├── app_export.dart              # Global exports
│       ├── app_toast.dart               # Toast utilities
│       └── bloc_status.dart             # BLoC status enums
├── model/
│   └── anime_model.dart                 # Anime data models
├── repository/
│   └── home_repositry.dart              # Data repository layer
├── view/
│   ├── custom_wiget/
│   │   ├── anime_card.dart              # Anime card widget
│   │   ├── chip.dart                    # Custom chip widget
│   │   ├── custom_row.dart              # Custom row widget
│   │   └── shimmer_effects.dart         # Loading animations
│   ├── details/
│   │   └── details_screen.dart          # Anime details screen
│   ├── home/
│   │   └── home_screen.dart             # Home screen
│   └── web_view/
│       └── web_view.dart                # Web view screen
├── viewmodel/
│   ├── details/
│   │   ├── details_bloc.dart            # Details screen BLoC
│   │   ├── details_event.dart           # Details events
│   │   └── details_state.dart           # Details states
│   ├── home/
│   │   ├── home_bloc.dart               # Home screen BLoC
│   │   ├── home_event.dart              # Home events
│   │   └── home_state.dart              # Home states
│   └── web_view/
│       ├── webview_bloc.dart            # Web view BLoC
│       ├── webview_event.dart           # Web view events
│       └── webview_state.dart           # Web view states
└── main.dart                            # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Saagarbhai/Anime.git
   cd anime
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build Instructions

#### Android APK
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

#### Web
```bash
flutter build web
```

## 🔧 Configuration

### API Configuration
The app uses the Jikan API (MyAnimeList API) for anime data:
- **Base URL**: `https://api.jikan.moe/v4`
- **Endpoints**: 
  - Anime list: `/anime`
  - Anime details: `/anime/{id}`

### Environment Setup
The app supports different build flavors for development, staging, and production environments.

### Localization
- **Supported Languages**: English (en)
- **Localization Files**: `lib/core/l10n/intl_en.arb`
- **Generated Files**: `lib/core/generated/intl/`

## 🎨 Design System

### Typography
- **Primary Font**: Poppins (Regular, Bold, Light)
- **Font Sizes**: Responsive using flutter_screenutil

### Colors
- **Primary**: Theme-based colors
- **Background**: White (#FFFFFF)
- **Text**: Black (#000000)
- **Grey**: Light grey for borders and shadows

### Components
- **Anime Cards**: Rounded corners, shadows, hover effects
- **Chips**: Interactive producer/genre/theme chips
- **Buttons**: Material design with custom styling
- **Loading**: Shimmer effects for better UX

## 📊 Data Models

### Anime Model
The app uses comprehensive data models for anime information:

```dart
class Anime {
  final int malId;
  final String url;
  final AnimeImages images;
  final AnimeTrailer trailer;
  final String title;
  final String titleJapanese;
  final String type;
  final String status;
  final double? score;
  final int? episodes;
  final String synopsis;
  final List<AnimeGenre> genres;
  final List<AnimeProducer> producers;
  // ... more properties
}
```

## 🔄 State Management

The app uses the BLoC (Business Logic Component) pattern for state management:

### Home Bloc
- **Events**: LoadHomePageData
- **States**: Loading, Success, Failure
- **Data**: Anime lists (all, TV, movies)

### Details Bloc
- **Events**: LoadAnimeDetail
- **States**: Loading, Success, Failure
- **Data**: Individual anime details

### WebView Bloc
- **Events**: LoadWebView
- **States**: Loading, Success, Failure
- **Data**: Web content

## 🌐 API Integration

### HTTP Client
- **Dio**: For HTTP requests with interceptors
- **PrettyDioLogger**: Request/response logging
- **Error Handling**: Comprehensive error management with user-friendly messages

### Endpoints
```dart
class ApiEndPoint {
  static String get baseUrl => 'https://api.jikan.moe/v4';
  static String get animeIdUrl => '$baseUrl/anime';
}
```

## 🧪 Testing

The app includes basic widget testing setup:
- **Test File**: `test/widget_test.dart`
- **Testing Framework**: Flutter Test

## 📦 Dependencies Management

### Key Dependencies
- **flutter_bloc**: State management
- **dio**: HTTP client
- **cached_network_image**: Image caching
- **carousel_slider**: Image carousel
- **shimmer**: Loading animations
- **webview_flutter**: In-app web browsing

### Development Dependencies
- **flutter_lints**: Code linting
- **intl_utils**: Localization utilities

## 🔒 Security & Performance

### Security
- HTTPS API calls
- Input validation
- Error handling without exposing sensitive data

### Performance
- Image caching
- Lazy loading
- Optimized list rendering
- Memory management

## 🚀 Deployment

### Android
- **Build Type**: APK/AAB
- **Target SDK**: Latest stable
- **Min SDK**: API 21+

### iOS
- **Deployment Target**: iOS 12.0+
- **Architecture**: ARM64

### Web
- **Framework**: Flutter Web
- **Hosting**: Any static hosting service

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- **Jikan API**: For providing MyAnimeList data
- **Flutter Team**: For the amazing framework
- **BLoC Community**: For state management patterns
- **Open Source Contributors**: For various packages used

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation

---

**Built with ❤️ using Flutter**