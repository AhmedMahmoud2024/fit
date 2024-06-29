import 'package:flutter/material.dart';

class PhoneInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String prefixText;
  final TextEditingController controller;

  PhoneInputField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF101C2D),
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Container(
              height: 56,
              padding: EdgeInsets.only(left: 12, right: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFDDE4EE),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  prefixText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF101C2D),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color(0xFFDDE4EE),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
