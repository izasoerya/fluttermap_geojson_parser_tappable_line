import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kunci_determinasi/src/maps_page/widget/tapable_polyline.dart';
import 'package:kunci_determinasi/src/maps_page/widget/tapable_polygon.dart';

///**
/// selectFile is a variable that determines which file to be selected
/// 1 is for geojson dataSleman
/// 2 is for geojson dataDummy
///**/

enum ListGeoJSON {
  dataSleman, // (polyline)
  dataDummy, // (polygon)
}

class MapsAPI extends StatelessWidget {
  const MapsAPI({super.key});
  static const selectedFile = ListGeoJSON.dataDummy;

  @override
  Widget build(BuildContext context) {
    Widget finalData = selectedFile == ListGeoJSON.dataSleman
        ? const TappablePolyline()
        : const TappablePolygon();

    return FlutterMap(
      options: MapOptions(
        initialCenter:
            const LatLng(-7.756165, 110.375403), // Sleman, Yogyakarta
        initialZoom: 12,
        onTap: (tapPosition, point) {
          onPolygon(point);
        },
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', // NEVER MOVE THIS!
          userAgentPackageName: 'com.example.app', // NEVER MOVE THIS!
        ),
        finalData,
      ],
    );
  }
}
