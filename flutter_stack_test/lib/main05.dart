import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(400, 400),
                painter: CirclePainter(),
              ),
              Text(
                '2:55:10',
                style: TextStyle(fontSize: 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // 선의 색상
      ..style = PaintingStyle.stroke // 선 스타일
      ..strokeWidth = 2.0; // 선 두께

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2), // 원의 중심
      size.width / 2, // 원의 반지름
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
