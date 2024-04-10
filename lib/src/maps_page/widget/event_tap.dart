import "package:flutter/material.dart";
import "package:kunci_determinasi/src/maps_page/screen/popup_dialog.dart";

void handleTap(BuildContext context) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ShowDialogPopUp(),
  );
}
