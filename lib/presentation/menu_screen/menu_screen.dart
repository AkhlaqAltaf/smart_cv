import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 235.h,
          child: CustomImageView(
            imagePath: ImageConstant.imgFrame7,
            height: 800.v,
            width: 235.h,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
