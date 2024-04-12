import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:kunci_determinasi/src/database/models/dart_data_sleman.dart';
// import 'package:kunci_determinasi/src/database/models/dart_dummy.dart';
import 'package:kunci_determinasi/src/database/models/dart_semarang.dart';

final List<dynamic> geojsonProperty = [];

class GeoParser {
  const GeoParser({required this.file});
  final int file;

  static final parser = GeoJsonParser();

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
