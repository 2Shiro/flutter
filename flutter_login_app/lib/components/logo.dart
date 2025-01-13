import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          height: 70,
          width: 70,
          'assets/images/logo.svg',
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
