import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore: must_be_immutable
class CvResumeTemplate extends StatelessWidget {
  const CvResumeTemplate({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>Navigator.pushNamed(context, AppRoutes.cvTemplateScreen)
,
      child:  SizedBox(
      width: 107.h,
      child: CustomImageView(
        imagePath: ImageConstant.imgRectangle27,
        height: 77.v,
        width: 107.h,
        radius: BorderRadius.circular(
          8.h,
        ),
      ),
    ),
    );
    
    
  }
}
