import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';
import 'package:kunci_determinasi/src/maps_page/widget/popup_dialog.dart';

class TappablePolygon extends StatelessWidget {
  const TappablePolygon({super.key});
  static const GeoParser parser = GeoParser(file: 2);

  @override
  Widget build(BuildContext context) {
    final data = parser.getListOfLatLng();
    var polygons = data as List<Polygon>;

    return PolygonLayer(polygons: polygons);
  }
}
