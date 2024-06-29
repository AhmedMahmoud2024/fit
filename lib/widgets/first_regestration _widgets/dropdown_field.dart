import 'package:flutter/material.dart';
late String _selectedValue;
class DropdownField extends StatefulWidget {
  final String labelText;
  final String value;
  final TextEditingController controller;
  DropdownField({
    required this.controller,
    required this.labelText,
    required this.value,
  });

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {


  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF101C2D),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFDDE4EE)),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: _selectedValue,
                  icon: Icon(Icons.arrow_drop_down),
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue!;
                    });
                  },
                  items: <String>['القاهرة', 'مدينة نصر']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                  hint: Text(
                    widget.value,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF66768E),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

