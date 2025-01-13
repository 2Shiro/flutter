import 'package:flutter/material.dart';

// 프로필 카운트포인트 위젯 만들기
class ProfileCountInfo extends StatelessWidget {
  const ProfileCountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfo('10', 'Posts'),
        _buildLine(),
        _buildInfo('24', 'Likes'),
        _buildLine(),
        _buildInfo('2', 'Share'),
      ],
    );
  }

  Widget _buildInfo(String count, String title) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 15)),
        const SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 15)),
      ],
    );
  }

  Widget _buildLine() {
    return Container(width: 2, height: 60, color: Colors.blue);
  }
}
