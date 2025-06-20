import '../utils/app_export.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppConstants.initialRoute: (context) => const HomeScreen(),
      AppConstants.detailsRoute: (context) {
        final args = ModalRoute.of(context)?.settings.arguments;
        final id = (args is int) ? args : 0;
        return DetailsScreen(id: id);
      },
      AppConstants.webViewRoute: (context) {
        final args = ModalRoute.of(context)?.settings.arguments;
        final url = (args is String) ? args : '';
        return WebViewScreen(url: url);
      },
      AppConstants.searchRoute: (context) {
        return SearchScreen();
      },
    };
  }
}
