import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String step;
  final String question;
  final String subtitle;

  CustomHeading({
    required this.step,
    required this.question,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          step,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF919FB6),
          ),
        ),
        SizedBox(height: 8),
        Text(
          question,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF101C2D),
          ),
        ),
        SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF66768E),
          ),
        ),
      ],
    );
  }
}
