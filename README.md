# Anime App

A modern Flutter application for browsing and discovering anime content using the Jikan API (MyAnimeList.net unofficial API).

## Features

- **Home Screen**
  - Carousel slider showcasing featured anime
  - Categorized sections for TV shows and movies
  - Complete anime listing with search functionality
  - Beautiful card-based UI with anime thumbnails and ratings

- **Details Screen**
  - High-quality anime cover images
  - Comprehensive anime information including:
    - Title (English and Japanese)
    - Episodes count
    - Score and ranking
    - Airing dates
    - Type (TV, Movie, OVA)
    - Status (Airing, Finished)
    - Rating (PG, R, etc.)
    - Source material
    - Duration
    - Synopsis and background information
    - Genres and themes
    - Studios and producers

- **WebView Integration**
  - In-app browser for external links
  - Seamless viewing of related content

## Technical Details

### Architecture
- **MVVM Architecture** (Model-View-ViewModel) with BLoC pattern
- Clean separation of UI, business logic, and data layers

### State Management
- **BLoC Pattern** with Flutter BLoC library
- Event-driven architecture with clear state management

### API Integration
- Integration with **Jikan API v4** (https://api.jikan.moe/v4)
- Efficient data fetching and caching

### UI Components
- Responsive design using Flutter ScreenUtil
- Custom shimmer loading effects
- Carousel sliders with smooth page indicators
- Custom fonts (Poppins)

### Dependencies
- **bloc & flutter_bloc**: State management
- **dio**: HTTP client for API requests
- **cached_network_image**: Efficient image loading and caching
- **carousel_slider**: Image carousels
- **flutter_screenutil**: Responsive UI
- **webview_flutter**: In-app web browser
- **shared_preferences**: Local storage
- **shimmer**: Loading effects
- **toastification**: Toast notifications

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/anime-app.git
```

2. Navigate to the project directory
```bash
cd anime-app
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   ├── api_config/      # API configuration and endpoints
│   ├── app/             # App initialization
│   ├── constant/        # App constants
│   ├── flavourconfig/   # Environment configuration
│   ├── generated/       # Generated files
│   ├── l10n/            # Localization
│   ├── routes/          # App routes
│   └── utils/           # Utility functions
├── model/               # Data models
├── repository/          # Data repositories
├── view/                # UI components
│   ├── custom_wiget/    # Reusable widgets
│   ├── details/         # Anime details screen
│   ├── home/            # Home screen
│   └── web_view/        # WebView screen
├── viewmodel/           # BLoC classes
│   ├── details/         # Details screen BLoC
│   ├── home/            # Home screen BLoC
│   └── web_view/        # WebView BLoC
└── main.dart            # Entry point
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- [Jikan API](https://jikan.moe/) for providing the anime data
- [MyAnimeList](https://myanimelist.net/) as the original data source
- Flutter team for the amazing framework