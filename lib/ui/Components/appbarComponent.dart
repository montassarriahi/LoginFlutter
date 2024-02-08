import 'package:flutter/material.dart';

class AppbarTheme extends StatefulWidget {
  const AppbarTheme({super.key});

  @override
  State<AppbarTheme> createState() => _AppbarThemeState();
}

class _AppbarThemeState extends State<AppbarTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Colors.white,
      )),
    );
  }
}
