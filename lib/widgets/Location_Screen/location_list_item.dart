import 'package:flutter/material.dart';

class LocationListItem extends StatelessWidget {
  final String locationName;
  final bool isSelected;
  final ValueChanged<String> onChanged;

  LocationListItem({
    required this.locationName,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(locationName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Radio<String>(
              value: locationName,
              groupValue: isSelected ? locationName : null,
              onChanged: (value) {
                onChanged(locationName);
              },
              activeColor: Color(0xFF0560FD),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                locationName,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF101C2D),
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
