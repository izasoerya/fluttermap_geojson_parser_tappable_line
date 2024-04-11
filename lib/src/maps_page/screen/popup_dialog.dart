import 'dart:math';
import 'package:flutter/material.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // final radius = size.height / 2;
    // final center = Offset(0, size.height / 2);
    // path.arcTo(Rect.fromCircle(center: center, radius: radius), -1.5 * pi,
    //     1 * pi, false);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ShowDialogPopUp extends StatelessWidget {
  const ShowDialogPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(top: 110),
      shadowColor: Colors.black,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipPath(
          clipper: HalfCircleClipper(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is a dialog'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
