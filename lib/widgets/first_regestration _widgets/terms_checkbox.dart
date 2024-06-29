import 'package:flutter/material.dart';

class TermsCheckbox extends StatefulWidget {
  @override
  _TermsCheckboxState createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
          activeColor: Color(0xFF0560FD),
        ),
        SizedBox(width: 8),
        Text(
          "أوافق على الشروط والأحكام",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2F3A4C),
          ),
        ),
      ],
    );
  }
}
