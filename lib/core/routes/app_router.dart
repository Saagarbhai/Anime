import '../utils/app_export.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppConstants.initialRoute: (context) => const HomeScreen(),
      AppConstants.detailsRoute: (context) => const DetailsScreen(),
    };
  }
}
