import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jaytextile/providers/app_provider.dart';
import 'package:jaytextile/util/const.dart';
import 'package:jaytextile/screens/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
          // home: SplashScreen(),
          home: Home(),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => new Home(),
          },
        );
      },
    );
  }
}
