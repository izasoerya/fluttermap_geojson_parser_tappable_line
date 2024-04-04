import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';

class TappablePolygon extends StatelessWidget {
  const TappablePolygon({
    super.key,
    required this.data,
    this.onPressed,
  });
  final List<dynamic> data;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    const GeoParser parser = GeoParser(file: 2);
    final dataPolygon = parser.getListOfLatLng();

    var polygons = dataPolygon as List<Polygon>;

    return PolygonLayer(polygons: polygons);
  }
}
