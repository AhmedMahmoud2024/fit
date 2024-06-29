import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PreviousButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back,
        color: Color(0xFF2F3A4C),
        size: 18,
      ),
      label: const Text(
        'السابق',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF2F3A4C),
        ),
      ),
    );
  }
}
