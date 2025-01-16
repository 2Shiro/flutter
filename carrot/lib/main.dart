import 'package:carrot/theme.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(CarrotUI());
}

class CarrotUI extends StatelessWidget {
  const CarrotUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'carrot_ui',
      debugShowCheckedModeBanner: false,
      theme: mTheme(),
      home: MainScreen(),
    );
  }
}
