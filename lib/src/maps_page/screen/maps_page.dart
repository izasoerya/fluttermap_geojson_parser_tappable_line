import 'package:flutter/material.dart';
import 'package:kunci_determinasi/src/maps_page/widget/maps_api.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Page'),
      ),
      body: const MapsAPI(),
    );
  }
}
