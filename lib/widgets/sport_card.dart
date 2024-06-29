import 'package:flutter/material.dart';

class SportCard extends StatelessWidget {
  final String sport;
  final bool isSelected;
  final Function(String) onSelect;
  final String iconPath;
  final Color backgroundColor;

  const SportCard({
    required this.sport,
    required this.isSelected,
    required this.onSelect,
    required this.iconPath,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(sport),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE6EFFB) : backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFDDE4EE)),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 48, height: 48),
            const SizedBox(height: 8),
            Text(
              sport,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF101C2D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
