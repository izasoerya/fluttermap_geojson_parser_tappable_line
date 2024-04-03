import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';
import 'package:kunci_determinasi/src/maps_page/widget/popup_dialog.dart';

class TappablePolyline extends StatelessWidget {
  const TappablePolyline({super.key});
  final int selectFile = 1;

  @override
  Widget build(BuildContext context) {
    final GeoParser parser = GeoParser(file: selectFile);
    if (selectFile == 1) {
      List<TaggedPolyline> polylines = [];

      final dataPolyline = parser.getListOfLatLng();
      for (var i = 0; i < dataPolyline.length; i++) {
        final polyline = dataPolyline[i] as Polyline;
        polylines.add(TaggedPolyline(
          color: Colors.blue,
          points: polyline.points,
        ));
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
    var data = parser.getListOfLatLng();
    var polygons = data.cast<Polygon>().toList();
    return PolygonLayer(polygons: polygons);

    // TODO: IMPLEMENT FILLING THE POLYLINES
  }
}
