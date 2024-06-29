import 'package:flutter/material.dart';

class TrainingStyleCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final Function(String) onSelect;
  final Color backgroundColor;

  const TrainingStyleCard({
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onSelect,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(title),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE6EFFB) : backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFDDE4EE)),
        ),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Color(0xFF101C2D),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF66768E),
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
