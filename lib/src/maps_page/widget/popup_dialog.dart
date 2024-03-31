import 'package:flutter/material.dart';

class ShowDialogPopUp extends StatelessWidget {
  const ShowDialogPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Polyline Tapped'),
      content: const Text('Polyline tapped'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
