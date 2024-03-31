import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kunci_determinasi/src/maps_page/widget/tapable_polyline.dart';

class MapsAPI extends StatefulWidget {
  const MapsAPI({super.key});

  @override
  State<MapsAPI> createState() => _MapsAPIState();
}

class _MapsAPIState extends State<MapsAPI> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(-7.756165, 110.375403), // Sleman, Yogyakarta
        initialZoom: 12,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        const TappablePolyline(),
        RichAttributionWidget(attributions: [
          TextSourceAttribution('© OpenStreetMap contributors',
              onTap: () => 'https://www.openstreetmap.org/copyright'),
        ]),
      ],
    );
  }
}
