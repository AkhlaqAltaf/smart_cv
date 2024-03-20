import 'package:smart_cv/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CvEducationsScreen extends StatelessWidget {
  CvEducationsScreen({Key? key}) : super(key: key);

  TextEditingController austabbottabadController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController associateofscienceController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      _buildEight(context),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text("Indicates a required field.",
                              style: CustomTextStyles.titleLarge22)),
                      SizedBox(height: 44.v),
                      Padding(
                          padding: EdgeInsets.only(left: 60.h),
                          child: Text("school name",
                              style: theme.textTheme.titleLarge)),
                      _buildAustabbottabad(context),
                      SizedBox(height: 32.v),
                      Padding(
                          padding: EdgeInsets.only(left: 60.h),
                          child: Text("school location",
                              style: theme.textTheme.titleLarge)),
                      SizedBox(height: 3.v),
                      _buildLocation(context),
                      SizedBox(height: 47.v),
                      Padding(
                          padding: EdgeInsets.only(left: 60.h),
                          child: Text("Degree",
                              style: theme.textTheme.titleLarge)),
                      _buildAssociateofscience(context),
                      SizedBox(height: 43.v),
                      Padding(
                          padding: EdgeInsets.only(left: 58.h),
                          child: Text("start date",
                              style: theme.textTheme.titleLarge)),
                      SizedBox(height: 2.v),
                      _buildDate(context),
                      SizedBox(height: 2.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 3.v),
        decoration: AppDecoration.gradientCyanToBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgArrowLeft,
                            height: 16.v,
                            width: 12.h,
                            margin: EdgeInsets.only(top: 15.v, bottom: 23.v),
                            onTap: () {
                              onTapImgArrowLeft(context);
                            }),
                        CustomImageView(
                            imagePath: ImageConstant.imgJ8p3lf1hro2qmkk54x54,
                            height: 54.adaptSize,
                            width: 54.adaptSize,
                            margin: EdgeInsets.only(left: 121.h))
                      ])),
              SizedBox(height: 9.v),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 20.v,
                        width: 37.h,
                        margin: EdgeInsets.only(bottom: 1.v),
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  decoration: BoxDecoration(
                                      color:
                                          theme.colorScheme.onPrimaryContainer,
                                      borderRadius:
                                          BorderRadius.circular(10.h)))),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 8.v),
                                  child:
                                      SizedBox(width: 20.h, child: Divider()))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 7.h),
                                  child: Text("1",
                                      style: theme.textTheme.labelLarge)))
                        ])),
                    Text("Headings", style: theme.textTheme.bodyLarge),
                    Container(
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.only(bottom: 1.v),
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  decoration: BoxDecoration(
                                      color:
                                          theme.colorScheme.onPrimaryContainer,
                                      borderRadius:
                                          BorderRadius.circular(10.h)))),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.v),
                                  child: Text("2",
                                      style: theme.textTheme.labelLarge)))
                        ])),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.v),
                        child: SizedBox(width: 10.h, child: Divider())),
                    Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text("Work history",
                            style: theme.textTheme.bodyLarge)),
                    Container(
                        height: 20.v,
                        width: 33.h,
                        margin: EdgeInsets.only(bottom: 1.v),
                        child:
                            Stack(alignment: Alignment.bottomLeft, children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  decoration: BoxDecoration(
                                      color:
                                          theme.colorScheme.onPrimaryContainer,
                                      borderRadius:
                                          BorderRadius.circular(10.h)))),
                          CustomImageView(
                              imagePath: ImageConstant.imgVector,
                              height: 13.adaptSize,
                              width: 13.adaptSize,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(left: 3.h, bottom: 2.v)),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 8.v),
                                  child:
                                      SizedBox(width: 14.h, child: Divider())))
                        ])),
                    Padding(
                        padding: EdgeInsets.only(top: 2.v, bottom: 4.v),
                        child:
                            Text("Education", style: theme.textTheme.bodySmall))
                  ]),
              SizedBox(height: 19.v),
              Padding(
                  padding: EdgeInsets.only(right: 11.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(bottom: 2.v),
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 20.adaptSize,
                                          width: 20.adaptSize,
                                          decoration: BoxDecoration(
                                              color: theme.colorScheme
                                                  .onPrimaryContainer,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.h)))),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text("4",
                                              style:
                                                  theme.textTheme.labelLarge)))
                                ])),
                        Padding(
                            padding: EdgeInsets.only(top: 10.v, bottom: 11.v),
                            child: SizedBox(width: 24.h, child: Divider())),
                        Padding(
                            padding: EdgeInsets.only(left: 2.h, bottom: 2.v),
                            child: Text("Skills",
                                style: theme.textTheme.bodyLarge)),
                        Container(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(left: 2.h, bottom: 2.v),
                            child:
                                Stack(alignment: Alignment.topLeft, children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      decoration: BoxDecoration(
                                          color: theme
                                              .colorScheme.onPrimaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(10.h)))),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 6.h, top: 1.v),
                                      child: Text("5",
                                          style: theme.textTheme.labelLarge)))
                            ])),
                        Padding(
                            padding: EdgeInsets.only(top: 10.v, bottom: 11.v),
                            child: SizedBox(width: 24.h, child: Divider())),
                        Padding(
                            padding: EdgeInsets.only(left: 3.h, top: 2.v),
                            child: Text("Summary",
                                style: theme.textTheme.bodyLarge)),
                        Container(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(left: 8.h, bottom: 2.v),
                            child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 20.adaptSize,
                                          width: 20.adaptSize,
                                          decoration: BoxDecoration(
                                              color: theme.colorScheme
                                                  .onPrimaryContainer,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.h)))),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 5.h),
                                          child: Text("6",
                                              style:
                                                  theme.textTheme.labelLarge)))
                                ])),
                        Padding(
                            padding: EdgeInsets.only(top: 10.v, bottom: 11.v),
                            child: SizedBox(width: 24.h, child: Divider())),
                        Padding(
                            padding: EdgeInsets.only(left: 7.h, bottom: 2.v),
                            child: Text("Finalize",
                                style: theme.textTheme.bodyLarge))
                      ])),
              SizedBox(height: 43.v)
            ]));
  }

  /// Section Widget
  Widget _buildAustabbottabad(BuildContext context) {
    return CustomTextFormField(
        width: 245.h,
        controller: austabbottabadController,
        hintText: "Aust abbottabad",
        alignment: Alignment.center,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 12.v, 11.h, 14.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgGroup20,
                height: 26.adaptSize,
                width: 26.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 52.v),
        contentPadding: EdgeInsets.only(left: 14.h, top: 17.v, bottom: 17.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return CustomTextFormField(
        width: 245.h,
        controller: locationController,
        hintText: "Abbottabad",
        alignment: Alignment.center,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 12.v, 9.h, 14.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgGroup20,
                height: 26.adaptSize,
                width: 26.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 52.v),
        contentPadding: EdgeInsets.only(left: 16.h, top: 17.v, bottom: 17.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildAssociateofscience(BuildContext context) {
    return CustomTextFormField(
        width: 245.h,
        controller: associateofscienceController,
        hintText: "associate of science",
        alignment: Alignment.center,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 13.v, 9.h, 13.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgGroup20,
                height: 26.adaptSize,
                width: 26.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 52.v),
        contentPadding: EdgeInsets.only(left: 17.h, top: 17.v, bottom: 17.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return CustomTextFormField(
        width: 245.h,
        controller: dateController,
        hintText: "month",
        textInputAction: TextInputAction.done,
        alignment: Alignment.center,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 13.v, 9.h, 13.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgGroup20,
                height: 26.adaptSize,
                width: 26.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 52.v),
        contentPadding: EdgeInsets.only(left: 17.h, top: 17.v, bottom: 17.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        fillColor: appTheme.gray50);
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
