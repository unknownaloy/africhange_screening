import 'package:africhange_screening/data/repository/currency_repository.dart';
import 'package:africhange_screening/features/home/screen/home.dart';
import 'package:africhange_screening/features/home/view_model/home_view_model.dart';
import 'package:africhange_screening/themes/light_theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(
        currencyRepository: CurrencyRepository(
          client: http.Client(),
        ),
      ),
      child: MaterialApp(
        title: 'Currency Converter',
        theme: lightTheme(),
        home: const Home(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
