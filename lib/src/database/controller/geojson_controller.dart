import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:kunci_determinasi/src/database/models/dart_data_sleman.dart';
import 'package:kunci_determinasi/src/database/models/dart_dummy.dart';

String dataGeoJSON = '';
List<Polygon> polygon = [];

class GeoParser {
  const GeoParser({required this.file});
  final int file;

  static final parser = GeoJsonParser();

  List<List<LatLng>> getListOfLatLng() {
    List<List<LatLng>> listOfLineString = [];
    switch (file) {
      case 1:
        dataGeoJSON = dataSleman;
        break;
      case 2:
        dataGeoJSON = dataDummy;
        parser.parseGeoJsonAsString(dataGeoJSON);
        break;
    }
    if (file == 1) {
      final parsedJSON = jsonDecode(dataGeoJSON) as Map<String, dynamic>;
      final features = parsedJSON['features'] as List;

      for (final feature in features) {
        final geometry = feature['geometry'];
        final geometryType = geometry['type'].toString();
        final coordinates = geometry['coordinates'];

        switch (geometryType) {
          case 'MultiLineString':
            for (final line in coordinates) {
              final lineString = _convertLineString(line);
              listOfLineString.add(lineString);
            }
            break;
          case 'Polygon':
            break;
          case 'LineString':
            final lineString = _convertLineString(coordinates);
            listOfLineString.add(lineString);
            break;
          default:
            break;
        }
      }
    }
    polygon = parser.polygons;

    return listOfLineString;
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
