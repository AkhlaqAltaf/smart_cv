import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore: must_be_immutable
class SeventysixItemWidget extends StatelessWidget {
  const SeventysixItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 107.h,
      child: CustomImageView(
        imagePath: ImageConstant.imgRectangle27,
        height: 77.v,
        width: 107.h,
        radius: BorderRadius.circular(
          8.h,
        ),
      ),
    );
  }
}
