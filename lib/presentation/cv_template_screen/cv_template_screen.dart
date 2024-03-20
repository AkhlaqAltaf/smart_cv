import 'package:smart_cv/widgets/custom_search_view.dart';
import 'package:smart_cv/widgets/custom_icon_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CvTemplateScreen extends StatelessWidget {
  CvTemplateScreen({Key? key}) : super(key: key);

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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 46.h),
                          child: Text("chosse a templates of ",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 2.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 118.h),
                          child: Text("your CV.",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 6.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup15,
                      height: 29.v,
                      width: 348.h),
                  SizedBox(height: 33.v),
                  Container(
                      height: 430.v,
                      width: 250.h,
                      decoration: AppDecoration.fillBlueGray.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder22),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgDownload1,
                          height: 430.v,
                          width: 250.h,
                          radius: BorderRadius.circular(20.h),
                          alignment: Alignment.center)),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildUser(BuildContext context) {
    return SizedBox(
        height: 181.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 9.v),
                  decoration: AppDecoration.gradientPrimaryToBlueGrayC.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL40),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 14.v),
                    Padding(
                        padding: EdgeInsets.only(left: 13.h, right: 5.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgUser,
                                  height: 18.adaptSize,
                                  width: 18.adaptSize,
                                  margin:
                                      EdgeInsets.only(top: 11.v, bottom: 15.v),
                                  onTap: () {
                                    onTapImgUser(context);
                                  }),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 13.h, top: 5.v, bottom: 9.v),
                                  child: CustomSearchView(
                                      width: 228.h,
                                      controller: searchController,
                                      hintText: "search")),
                              CustomImageView(
                                  imagePath: ImageConstant.imgEllipse15,
                                  height: 44.adaptSize,
                                  width: 44.adaptSize,
                                  radius: BorderRadius.circular(22.h),
                                  margin: EdgeInsets.only(left: 25.h))
                            ])),
                    SizedBox(height: 11.v),
                    Padding(
                        padding: EdgeInsets.only(left: 12.h),
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
                                                        onTapThirtyNine(
                                                            context);
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
                                        SizedBox(height: 12.v),
                                        Text("cover letter",
                                            style: theme.textTheme.bodySmall)
                                      ]))
                            ]))
                  ]))),
          CustomImageView(
              imagePath: ImageConstant.imgPolygon2,
              height: 17.v,
              width: 21.h,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 39.h))
        ]));
  }

  /// Navigates to the menuScreen when the action is triggered.
  onTapImgUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.menuScreen);
  }

  /// Navigates to the invitationCardScreen when the action is triggered.
  onTapThirtyNine(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.invitationCardScreen);
  }

  /// Navigates to the coverLetterScreen when the action is triggered.
  onTapBtnTelevision(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.coverLetterScreen);
  }
}
