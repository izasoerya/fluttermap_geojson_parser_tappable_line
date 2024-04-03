import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';
import 'package:kunci_determinasi/src/maps_page/widget/popup_dialog.dart';

class TappablePolyline extends StatelessWidget {
  const TappablePolyline({super.key});
  final int selectFile = 2;

  @override
  Widget build(BuildContext context) {
    final GeoParser geoMap = GeoParser(file: selectFile);
    if (selectFile == 1) {
      final List<TaggedPolyline> polylines = [];
      final List<List<LatLng>> listOfLatLng = geoMap.getListOfLatLng();

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
          // TODO: Handle polyline tap
          showGeneralDialog(
              context: context,
              pageBuilder: (context, animation1, animation2) {
                return const ShowDialogPopUp();
              });
        },
      );
    }
    geoMap.getListOfLatLng();
    return PolygonLayer(polygons: polygon);

    // TODO: IMPLEMENT FILLING THE POLYLINES
  }
}
