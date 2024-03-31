import 'package:flutter/material.dart';
import 'package:kunci_determinasi/src/maps_page/screen/maps_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapsPage(),
    );
  }
}
