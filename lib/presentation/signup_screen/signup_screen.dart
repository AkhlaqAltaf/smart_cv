import 'package:smart_cv/widgets/custom_text_form_field.dart';
import 'package:smart_cv/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      _buildNinetyFour(context),
                      SizedBox(height: 16.v),
                      Text("signup your account",
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 33.v),
                      _buildPhoneNumber(context),
                      SizedBox(height: 29.v),
                      _buildPassword(context),
                      SizedBox(height: 29.v),
                      _buildConfirmpassword(context),
                      SizedBox(height: 27.v),
                      _buildSignUp(context),
                      SizedBox(height: 27.v),
                      GestureDetector(
                          onTap: () {
                            onTapTxtConfirmation(context);
                          },
                          child: Text("Already have an account ?",
                              style: theme.textTheme.titleSmall)),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgEllipse12215x119,
                                    height: 215.v,
                                    width: 119.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.h, top: 2.v, bottom: 190.v),
                                    child: Text("Need help ?",
                                        style: CustomTextStyles.bodyLarge18))
                              ]))
                    ]))))));
  }

  /// Section Widget
  Widget _buildNinetyFour(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 11.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 57.v, bottom: 101.v),
                  child: Text("Welcome!", style: theme.textTheme.displaySmall)),
              CustomImageView(
                  imagePath: ImageConstant.imgGroup3,
                  height: 199.v,
                  width: 192.h,
                  margin: EdgeInsets.only(left: 4.h))
            ]));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 21.h, right: 20.h),
        child: CustomTextFormField(
            controller: phoneNumberController,
            hintText: "Email or phone number",
            textInputType: TextInputType.emailAddress));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 21.h, right: 20.h),
        child: CustomTextFormField(
            controller: passwordController,
            hintText: "password",
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 21.h, right: 20.h),
        child: CustomTextFormField(
            controller: confirmpasswordController,
            hintText: "confirm Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: "Sign up",
        margin: EdgeInsets.only(left: 19.h, right: 22.h),
        buttonStyle: CustomButtonStyles.none,
        decoration: CustomButtonStyles.gradientPrimaryToTealDecoration);
  }

  /// Navigates to the signinScreen when the action is triggered.
  onTapTxtConfirmation(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signinScreen);
  }
}
