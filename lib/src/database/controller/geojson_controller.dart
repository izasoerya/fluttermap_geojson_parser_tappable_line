import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:kunci_determinasi/src/database/models/dart_data_sleman.dart';
import 'package:kunci_determinasi/src/database/models/dart_semarang.dart';

Map<int, Map<String, dynamic>> geojsonProperty = {};
int uidPolygon = 0;

class GeoParser {
  const GeoParser({required this.file});
  final int file;

  static final parser = GeoJsonParser(
    polygonCreationCallback: (points, holePointsList, properties) {
      geojsonProperty[uidPolygon] = properties;
      uidPolygon++;
      return Polygon(
        points: points,
        holePointsList: holePointsList,
        borderColor: Colors.black.withOpacity(0.8),
        color: Colors.black.withOpacity(0.1),
        isFilled: true,
        borderStrokeWidth: 1.0,
      );
    },
  );

  List<dynamic> getListOfLatLng() {
    // dynamic is ALWAYS either polyline or polygon
    switch (file) {
      case 1:
        parser.parseGeoJsonAsString(dataSleman);
        return parser.polylines;
      case 2:
        parser.parseGeoJsonAsString(dataSemarang);
        return parser.polygons;
    }
    return parser.polylines; // should not be reached
  }
}
