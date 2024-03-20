import 'package:smart_cv/widgets/app_bar/custom_app_bar.dart';
import 'package:smart_cv/widgets/app_bar/appbar_leading_image.dart';
import 'package:smart_cv/widgets/app_bar/appbar_title_searchview.dart';
import 'package:smart_cv/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:smart_cv/widgets/custom_icon_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class InvitationCardScreen extends StatelessWidget {
  InvitationCardScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildUser(context),
                  SizedBox(height: 13.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 48.h),
                              child: Column(children: [
                                Text("Choose your favourite  ",
                                    style: theme.textTheme.headlineSmall),
                                SizedBox(height: 1.v),
                                Text("invitation card.",
                                    style: theme.textTheme.headlineSmall),
                                SizedBox(height: 67.v),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder22),
                                    child: Column(children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.img5f094aeb0b84433,
                                          height: 429.v,
                                          width: 264.h,
                                          radius: BorderRadius.circular(20.h)),
                                      SizedBox(height: 121.v),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgClassicNewYea,
                                          height: 429.v,
                                          width: 264.h,
                                          radius: BorderRadius.circular(20.h)),
                                      SizedBox(height: 121.v),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgElegantGrandO,
                                          height: 429.v,
                                          width: 264.h,
                                          radius: BorderRadius.circular(20.h)),
                                      SizedBox(height: 121.v),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgPreview1,
                                          height: 429.v,
                                          width: 264.h,
                                          radius: BorderRadius.circular(20.h))
                                    ]))
                              ]))))
                ]))));
  }

  /// Section Widget
  Widget _buildUser(BuildContext context) {
    return SizedBox(
        height: 181.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.v),
                  decoration: AppDecoration.gradientPrimaryToBlueGrayC.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL40),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 13.v),
                    CustomAppBar(
                        leadingWidth: 37.h,
                        leading: AppbarLeadingImage(
                            imagePath: ImageConstant.imgUser,
                            margin: EdgeInsets.only(
                                left: 19.h, top: 12.v, bottom: 14.v),
                            onTap: () {
                              onTapUser(context);
                            }),
                        title: AppbarTitleSearchview(
                            margin: EdgeInsets.only(left: 14.h),
                            hintText: "search",
                            controller: searchController),
                        actions: [
                          AppbarTrailingCircleimage(
                              imagePath: ImageConstant.imgEllipse15,
                              margin: EdgeInsets.symmetric(horizontal: 12.h))
                        ]),
                    SizedBox(height: 11.v),
                    Padding(
                        padding: EdgeInsets.only(left: 19.h, right: 8.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(children: [
                                SizedBox(
                                    height: 67.adaptSize,
                                    width: 67.adaptSize,
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: 66.adaptSize,
                                                  width: 66.adaptSize,
                                                  decoration: BoxDecoration(
                                                      color: theme.colorScheme
                                                          .onPrimaryContainer,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              33.h)))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 6.h,
                                                      vertical: 3.v),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: fs.Svg(
                                                              ImageConstant
                                                                  .imgGroup45),
                                                          fit: BoxFit.cover)),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        SizedBox(height: 49.v),
                                                        Container(
                                                            height:
                                                                12.adaptSize,
                                                            width: 12.adaptSize,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.h),
                                                            decoration: AppDecoration
                                                                .fillSecondaryContainer
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .circleBorder6),
                                                            child: CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgPlus,
                                                                height: 10
                                                                    .adaptSize,
                                                                width: 10
                                                                    .adaptSize,
                                                                alignment:
                                                                    Alignment
                                                                        .center))
                                                      ])))
                                        ])),
                                SizedBox(height: 4.v),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(" CV/resume",
                                        style: theme.textTheme.bodySmall))
                              ]),
                              Spacer(flex: 55),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 61.adaptSize,
                                        width: 61.adaptSize,
                                        margin: EdgeInsets.only(left: 3.h),
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      height: 58.adaptSize,
                                                      width: 58.adaptSize,
                                                      decoration: BoxDecoration(
                                                          color: appTheme
                                                              .blueGray100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      29.h)))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        onTapTwentyTwo(context);
                                                      },
                                                      child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.h,
                                                                  vertical:
                                                                      2.v),
                                                          decoration: AppDecoration
                                                              .gradientGrayToBlueGray
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder30),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                SizedBox(
                                                                    height:
                                                                        14.v),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgSettings,
                                                                    height:
                                                                        26.v,
                                                                    width:
                                                                        40.h),
                                                                SizedBox(
                                                                    height:
                                                                        4.v),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Container(
                                                                        height: 12
                                                                            .adaptSize,
                                                                        width: 12
                                                                            .adaptSize,
                                                                        padding:
                                                                            EdgeInsets.all(1
                                                                                .h),
                                                                        decoration: AppDecoration.fillSecondaryContainer.copyWith(
                                                                            borderRadius: BorderRadiusStyle
                                                                                .circleBorder6),
                                                                        child: CustomImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgPlus,
                                                                            height: 10.adaptSize,
                                                                            width: 10.adaptSize,
                                                                            alignment: Alignment.center)))
                                                              ]))))
                                            ])),
                                    SizedBox(height: 10.v),
                                    Text("invitation card",
                                        style: theme.textTheme.bodySmall)
                                  ]),
                              Spacer(flex: 44),
                              Padding(
                                  padding: EdgeInsets.only(top: 3.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 57.v,
                                            width: 58.h,
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomRight,
                                                children: [
                                                  CustomIconButton(
                                                      height: 57.adaptSize,
                                                      width: 57.adaptSize,
                                                      padding:
                                                          EdgeInsets.all(9.h),
                                                      alignment:
                                                          Alignment.center,
                                                      onTap: () {
                                                        onTapBtnTelevision(
                                                            context);
                                                      },
                                                      child: CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgTelevision)),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Container(
                                                          height: 12.adaptSize,
                                                          width: 12.adaptSize,
                                                          margin: EdgeInsets.only(
                                                              bottom: 4.v),
                                                          padding: EdgeInsets.all(
                                                              1.h),
                                                          decoration: AppDecoration
                                                              .fillSecondaryContainer
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder6),
                                                          child: CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgPlus,
                                                              height:
                                                                  10.adaptSize,
                                                              width:
                                                                  10.adaptSize,
                                                              alignment: Alignment
                                                                  .center)))
                                                ])),
                                        SizedBox(height: 11.v),
                                        Text("cover letter",
                                            style: theme.textTheme.bodySmall)
                                      ]))
                            ]))
                  ]))),
          CustomImageView(
              imagePath: ImageConstant.imgPolygon2,
              height: 17.v,
              width: 21.h,
              alignment: Alignment.bottomCenter)
        ]));
  }

  /// Navigates to the menuScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.menuScreen);
  }

  /// Navigates to the cvTemplateScreen when the action is triggered.
  onTapTwentyTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cvTemplateScreen);
  }

  /// Navigates to the coverLetterScreen when the action is triggered.
  onTapBtnTelevision(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.coverLetterScreen);
  }
}
