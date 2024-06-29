import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String unit;
  final TextEditingController controller;

  CustomInput({
    required this.label,
    required this.unit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFDDE4EE)),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xFF66768E),
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 24),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'ادخل ${label}ك',
              suffixText: unit,
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
