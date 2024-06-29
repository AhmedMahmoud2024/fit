import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String level;
  final String description;
  final bool isSelected;
  final Function(String) onSelect;
  final Color selectedBackgroundColor;
  final Color selectedBorderColor;

  const SkillCard({
    required this.level,
    required this.description,
    required this.isSelected,
    required this.onSelect,
    this.selectedBackgroundColor = const Color(0xFFE6F1FF),
    this.selectedBorderColor = const Color(0xFFDDE4EE),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(level),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? selectedBackgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? selectedBorderColor : Color(0xFFDDE4EE)),
        ),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              level,
              style: const TextStyle(
                fontSize: 24,
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
