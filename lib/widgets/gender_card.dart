import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final Function(String) onSelect;
  final Map<String, String> imageAssetPaths;

  const GenderCard({
    required this.gender,
    required this.isSelected,
    required this.onSelect,
    required this.imageAssetPaths,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(gender),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE6F1FF) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFDDE4EE)),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: imageAssetPaths.entries.map((entry) {
                return Image.asset(entry.value, width: 116, height: 116);
              }).toList(),
            ),
            const SizedBox(height: 14),
            Text(
              gender,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
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
