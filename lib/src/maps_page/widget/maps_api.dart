import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geodesy/geodesy.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';

import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';
import 'package:kunci_determinasi/src/maps_page/widget/tapable_polyline.dart';
import 'package:kunci_determinasi/src/maps_page/widget/tapable_polygon.dart';
import 'package:kunci_determinasi/src/maps_page/widget/event_tap.dart';
import 'package:kunci_determinasi/src/maps_page/screen/icon_mark.dart';
import 'package:kunci_determinasi/src/maps_page/widget/models.dart';

///**
/// selectFile is a variable that determines which file to be selected
/// 1 is for geojson dataSleman
/// 2 is for geojson dataSemarang
///**

class MapsAPI extends StatefulWidget {
  const MapsAPI({super.key});
  static const selectedFile = ListGeoJSON.dataSemarang;

  @override
  State<MapsAPI> createState() => _MapsAPIState();
}

class _MapsAPIState extends State<MapsAPI> with TickerProviderStateMixin {
  final mapController = MapController();
  LatLng initPoint = const LatLng(-7.120362, 110.36734);
  late final _animatedMapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 750),
    curve: Curves.easeInOut,
  );

  bool polygonTap(LatLng point) {
    for (var element in finalData) {
      bool isGeoPointInPolygon =
          Geodesy().isGeoPointInPolygon(point, element.points);
      if (isGeoPointInPolygon == true) {
        print("pressed!");
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget finalWidget = Container();
    switch (MapsAPI.selectedFile) {
      case ListGeoJSON.dataSleman:
        finalData = const GeoParser(file: 1).getListOfLatLng();
        finalWidget = TappablePolyline(
          data: finalData,
        );
        break;
      case ListGeoJSON.dataSemarang:
        finalData = const GeoParser(file: 2).getListOfLatLng();
        finalWidget = TappablePolygon(
          data: finalData,
        );
        print(geojsonProperty);
        break;
    }

    return FlutterMap(
      mapController: _animatedMapController.mapController,
      options: MapOptions(
        onMapReady: () {
          mapController.mapEventStream.listen((event) {});
        },
        initialCenter: finalWidget is TappablePolyline
            ? const LatLng(-7.756165, 110.375403) // Sleman, Yogyakarta
            : const LatLng(-7.098634, 110.269314), // Semarang
        initialZoom: 12,
        onTap: (tapPosition, point) {
          initPoint = point;
          if (finalWidget is TappablePolygon && polygonTap(point)) {
            _animatedMapController.animateTo(
              zoom: 12,
              rotation: 0,
              dest: LatLng(point.latitude - 0.1, point.longitude),
            );
            handleTap(context);
            setState(() {});
          }
          if (finalWidget is TappablePolyline) {
            // TODO: IMPLEMENT TAP FOR POLYLINE
          }
        },
      ),
      children: [
        //**
        //  Don't move TileLayer class, keep it on TOP OF CHILDREN!
        //  if it not rendered first, the other will overlap
        // */
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        finalWidget,
        AnimatedMarkerLayer(markers: [
          AnimatedMarker(
              point: initPoint,
              builder: (_, animation) {
                return MapMarkIcon(animation: animation);
              }),
        ]),
      ],
    );
  }
}
