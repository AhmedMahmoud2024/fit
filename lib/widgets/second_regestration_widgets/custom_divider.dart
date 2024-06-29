import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xFFDDE4EE),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "أو",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF595D62),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xFFDDE4EE),
          ),
        ),
      ],
    );
  }
}
