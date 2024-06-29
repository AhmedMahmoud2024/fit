import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isPhoneField;
  final String? prefixText;
  final bool obscureText;

  CustomInputField({
    required this.labelText,
    required this.hintText,
    this.isPhoneField = false,
    this.prefixText,
    this.obscureText = false,
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
        TextField(
          obscureText: obscureText,
          keyboardType: isPhoneField ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            prefixText: prefixText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0xFFDDE4EE),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
        ),
      ],
    );
  }
}
