import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jointeam/logis/providers.dart';
import 'package:jointeam/logis/views/loginScreen.dart';
import 'package:jointeam/logis/constant/appTheme.dart';
import 'package:jointeam/languages/app_localizations.dart';
import 'package:jointeam/languages/languagesSalection.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'languages/app_localizations.dart';

Future<void> main() async {
  // WebSocketChannel channel;
  // try {
  //   channel = WebSocketChannel.connect(Uri.parse('http://localhost:3000'));
  // } catch (e) {
  //   log("message${e.toString()}");
  // }
  themeDataProvider.setTheme(ThemeMode.system);
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguageProvider appLanguage = AppLanguageProvider();
  await appLanguage.fetchLocale();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeDataProvider>.value(
          value: themeDataProvider,
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    ThemeDataProvider themeDataProvider =
        Provider.of<ThemeDataProvider>(context);
    // AppLanguageProvider appLanguage = Provider.of<AppLanguageProvider>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => appLanguageProvider,
      child: Consumer<AppLanguageProvider>(
        builder: (context, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
            darkTheme: AppTheme.appThemeDark,
            themeMode: themeDataProvider.getTheme,
            home: const Languagessalection(),
            locale: model.appLocal,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
          );
        },
      ),
    );
  }
}
