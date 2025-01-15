import 'package:flutter/material.dart';
import 'package:flutter_carrot_app/carrot_market_ui_01/theme.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(CarrotMarketUI());
}

class CarrotMarketUI extends StatelessWidget {
  const CarrotMarketUI({super.key});

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
