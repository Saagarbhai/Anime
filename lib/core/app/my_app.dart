import 'package:anime/core/utils/app_export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc()),
        BlocProvider(create: (context) => HomeBloc()..add(LoadHomePageData())),
        BlocProvider(create: (context) => DetailBloc()),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          final locale = Locale('en');
          return ScreenUtilInit(
            designSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                title: AppConstants.appName,
                themeMode: ThemeMode.system,
                locale: locale,
                supportedLocales: const [
                  Locale('en'), // English
                ],
                localizationsDelegates: localizationDelegates,
                initialRoute: AppConstants.initialRoute,
                routes: AppRoutes.routes,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
