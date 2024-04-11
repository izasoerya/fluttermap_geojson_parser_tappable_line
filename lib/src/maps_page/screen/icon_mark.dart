import 'package:flutter/material.dart';

class MapMarkIcon extends StatelessWidget {
  const MapMarkIcon({
    super.key,
    required this.animation,
  });
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_on,
      color: Colors.white,
      size: 50 * animation.value,
      shadows: const [
        Shadow(color: Colors.black, blurRadius: 10),
      ],
    );
  }
}
