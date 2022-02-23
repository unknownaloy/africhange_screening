import 'package:africhange_screening/features/home/home.dart';
import 'package:africhange_screening/themes/light_theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: const Home(),
      themeMode: ThemeMode.light,
    );
  }
}