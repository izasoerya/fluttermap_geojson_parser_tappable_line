import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:kunci_determinasi/src/database/models/dart_data_sleman.dart';
import 'package:kunci_determinasi/src/database/models/dart_dummy.dart';

class GeoParser {
  const GeoParser({required this.file});
  final int file;

  static final parser = GeoJsonParser();

  List<dynamic> getListOfLatLng() {
    switch (file) {
      case 1:
        parser.parseGeoJsonAsString(dataSleman);
        return parser.polylines;
      case 2:
        parser.parseGeoJsonAsString(dataDummy);
        return parser.polygons;
    }
    return parser.polylines;
  }

  List<LatLng> _convertLineString(List<dynamic> coordinates) {
    return coordinates
        .map((coords) => LatLng(coords[1] as double, coords[0] as double))
        .toList();
  }

  List<LatLng> _convertPolygon(List<dynamic> coordinates) {
    return coordinates
        .map((coords) => LatLng(coords[1] as double, coords[0] as double))
        .toList();
  }
}
