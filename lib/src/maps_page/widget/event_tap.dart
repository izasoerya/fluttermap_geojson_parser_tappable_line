import 'package:geodesy/geodesy.dart';
import 'package:kunci_determinasi/src/maps_page/widget/models.dart';

class EventTap {
  const EventTap();

  void polygonTap(LatLng point) {
    for (var element in finalData) {
      bool isGeoPointInPolygon =
          Geodesy().isGeoPointInPolygon(point, element.points);
      if (isGeoPointInPolygon == true) {
        print("pressed!");
      }
    }
  }
}
