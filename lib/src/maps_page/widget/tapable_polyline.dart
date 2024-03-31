import 'package:flutter/material.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:latlong2/latlong.dart';
import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';

class TappablePolyline extends StatelessWidget {
  const TappablePolyline({super.key});

  @override
  Widget build(BuildContext context) {
    const GeoJSONParser geoMap = GeoJSONParser();
    final List<List<LatLng>> listOfLatLng = geoMap.getListOfLatLng();
    final List<TaggedPolyline> polylines = [];

    for (int i = 0; i < listOfLatLng.length; i++) {
      final List<LatLng> coordinates = listOfLatLng[i];
      polylines.add(
        TaggedPolyline(
          points: coordinates,
          color: Colors.blue,
          strokeWidth: 2.5,
        ),
      );
    }

    return TappablePolylineLayer(
      polylines: polylines,
      onTap: (polylines, tapPosition) {
        print('Polyline tapped');
      },
    );
  }
}
