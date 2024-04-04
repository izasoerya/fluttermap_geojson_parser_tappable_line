import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geodesy/geodesy.dart';

import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';
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

List<dynamic> finalData = [];
void onPolygon(LatLng point) {
  finalData.forEach((element) {
    bool isGeoPointInPolygon =
        Geodesy().isGeoPointInPolygon(point, element.points);
    if (isGeoPointInPolygon == true) {
      print("pressed!");
    }
  });
}

class MapsAPI extends StatelessWidget {
  const MapsAPI({super.key});
  static const selectedFile = ListGeoJSON.dataDummy;

  @override
  Widget build(BuildContext context) {
    Widget finalWidget;
    switch (selectedFile) {
      case ListGeoJSON.dataSleman:
        finalData = const GeoParser(file: 1).getListOfLatLng();
        finalWidget = TappablePolyline(
          data: finalData,
        );
        break;
      case ListGeoJSON.dataDummy:
        finalData = const GeoParser(file: 2).getListOfLatLng();
        finalWidget = TappablePolygon(
          data: finalData,
        );
        break;
    }

    return FlutterMap(
      options: MapOptions(
        initialCenter:
            const LatLng(-7.756165, 110.375403), // Sleman, Yogyakarta
        initialZoom: 12,
        onTap: (tapPosition, point) {
          if (finalWidget is TappablePolygon) {
            onPolygon(point);
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', // NEVER MOVE THIS!
          userAgentPackageName: 'com.example.app', // NEVER MOVE THIS!
        ),
        finalWidget,
      ],
    );
  }
}
