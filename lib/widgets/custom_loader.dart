import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/provider/data_providers/loder_provider.dart';

void displayLoader(BuildContext context) {
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry? overlayEntry;

  overlayEntry = OverlayEntry(builder: (context) {
    return Consumer<LoaderProvider>(builder: (context, value, child) {
      return value.isLoading
          ? Center(
              child: _buildDefaultIndicator(),
            )
          : SizedBox();
    });
  });

  void hideLoader(OverlayEntry? overlayEntry) {
    if (overlayEntry != null) {}
  }
}

Widget _buildDefaultIndicator() {
  return Container(
    width: 40.0,
    height: 40.0,
    child: CircularProgressIndicator(
      strokeWidth: 3.0,
    ),
  );
}
