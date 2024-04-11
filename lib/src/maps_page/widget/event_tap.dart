import "package:flutter/material.dart";
import "package:kunci_determinasi/src/maps_page/screen/popup_dialog.dart";

void handleTap(BuildContext context) async {
  await showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ShowDialogPopUp(),
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.transparent,
  );
}
