import 'package:flutter/material.dart';
import 'custom_search_field.dart';
import 'location_list_item.dart';

class LocationBottomSheet extends StatefulWidget {
  @override
  _LocationBottomSheetState createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  String? _selectedLocation;

  final List<String> _locations = [
    "القاهرة", "القليوبية", "الجيزة", "المنوفية", "قنا",
    "الأسكندرية", "طنطا", "كفر الشيخ", "اسيوط",
    "الأقصر", "أسوان", "الوادي الجديد"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            color: Colors.grey[300],
          ),
          SizedBox(height: 12),
          Text(
            'إختر المحافظة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF101C2D),
            ),
          ),
          SizedBox(height: 12),
          CustomSearchField(hintText: 'بحث'),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) {
                return LocationListItem(
                  locationName: _locations[index],
                  isSelected: _selectedLocation == _locations[index],
                  onChanged: (value) {
                    setState(() {
                      _selectedLocation = value;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
