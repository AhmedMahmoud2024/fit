import 'package:flutter/material.dart';

import 'blocs/screens/multistep.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Step Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiStepForm(),
    );
  }
}