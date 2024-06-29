import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String location;
  final bool isSelected;
  final Function(String) onSelect;
  final Color selectedBackgroundColor;
  final Color selectedBorderColor;

  const LocationCard({
    required this.location,
    required this.isSelected,
    required this.onSelect,
    this.selectedBackgroundColor = const Color(0xFFE6EFFB),
    this.selectedBorderColor = const Color(0xFFDDE4EE),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(location),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? selectedBackgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? selectedBorderColor : Color(0xFFDDE4EE)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Center(
          child: Text(
            location,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF101C2D),
            ),
          ),
        ),
      ),
    );
  }
}
