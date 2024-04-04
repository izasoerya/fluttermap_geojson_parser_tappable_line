import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geodesy/geodesy.dart';
import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';

var dataPolygon = const GeoParser(file: 2).getListOfLatLng();

void onPolygon(LatLng point) {
  dataPolygon.forEach((element) {
    bool isGeoPointInPolygon =
        Geodesy().isGeoPointInPolygon(point, element.points);
    if (isGeoPointInPolygon == true) {
      print("pressed!");
    }
  });
}

class TappablePolygon extends StatefulWidget {
  const TappablePolygon({super.key, required this.data});
  final List<dynamic> data;

  @override
  State<TappablePolygon> createState() => _TappablePolygonState();
}

class _TappablePolygonState extends State<TappablePolygon> {
  @override
  Widget build(BuildContext context) {
    const GeoParser parser = GeoParser(file: 2);
    final dataPolygon = parser.getListOfLatLng();

    var polygons = dataPolygon as List<Polygon>;

    return PolygonLayer(polygons: polygons);
  }
}
