import 'package:flutter/material.dart';
import 'package:flutter_profile_app/theme.dart';
import 'package:flutter_profile_app/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

// MyApp -> MaterialApp 사용하기
class MyApp extends StatelessWidget {
  // 객체를 const 사용하려면 생성자가 const 생성자 이여야 한다.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: ProfilePage(),
    );
  }
} // end of MyApp
