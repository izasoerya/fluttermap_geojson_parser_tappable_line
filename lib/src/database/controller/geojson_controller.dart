import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:kunci_determinasi/src/database/models/dart_data_sleman.dart';

class GeoJSONParser {
  const GeoJSONParser();

  List<List<LatLng>> getListOfLatLng() {
    List<List<LatLng>> listOfLineString = [];
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
          final lineString = _convertPolygon(coordinates[0]);
          listOfLineString.add(lineString);
          break;
        case 'LineString':
          final lineString = _convertLineString(coordinates);
          listOfLineString.add(lineString);
          break;
        default:
          // Handle unknown geometry types or other cases
          break;
      }
    }

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
