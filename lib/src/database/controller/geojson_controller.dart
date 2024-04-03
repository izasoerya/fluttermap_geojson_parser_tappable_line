import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:kunci_determinasi/src/database/models/dart_data_sleman.dart';
import 'package:kunci_determinasi/src/database/models/dart_dummy.dart';

class GeoParser {
  const GeoParser({required this.file});
  final int file;

  static final parser = GeoJsonParser();
  List<dynamic> getListOfLatLng() {
    // dynamic is either polyline or polygon
    switch (file) {
      case 1:
        parser.parseGeoJsonAsString(dataSleman);
        return parser.polylines;
      case 2:
        parser.parseGeoJsonAsString(dataDummy);
        return parser.polygons;
    }
    return parser.polylines; // should not be reached
  }
}
