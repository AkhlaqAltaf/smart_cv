import 'package:smart_cv/widgets/custom_text_form_field.dart';
import 'package:smart_cv/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);

  // TextEditingController emailController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();

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
                      _buildWelcome(context),
                      SizedBox(height: 26.v),
                      Text("login your account",
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 53.v),
                      Padding(
                          padding: EdgeInsets.only(left: 23.h, right: 19.h),
                          child: CustomTextFormField(
                              // controller: emailController,
                              hintText: "Email",
                              hintStyle: CustomTextStyles.bodyLargeGray800,
                              textInputType: TextInputType.emailAddress,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.h, vertical: 20.v))),
                      SizedBox(height: 28.v),
                      Padding(

                          padding: EdgeInsets.only(left: 23.h, right: 19.h),
                          child:
                          
                           CustomTextFormField(
                              // controller: passwordController,
                              hintText: "Password",
                              hintStyle: CustomTextStyles.bodyLargeGray800,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.h, vertical: 18.v)
                                  )
                                  ),
                      SizedBox(height: 27.v),
                      CustomElevatedButton(
                          text: "Log IN",
                          margin: EdgeInsets.only(left: 21.h, right: 22.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientPrimaryToTealDecoration,
                          onPressed: () {
                            onTapLogIN(context);
                          }),
                      SizedBox(height: 8.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 9.h),
                              child: Text("forget password?",
                                  style: theme.textTheme.titleSmall))),
                      SizedBox(height: 31.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtIfYouHaveNot(context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(left: 45.h),
                                  child: Text(
                                      "If you have not any account signup.",
                                      style: theme.textTheme.titleSmall)))),
                      SizedBox(height: 46.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgEllipse12,
                          height: 215.v,
                          width: 119.h,
                          alignment: Alignment.centerLeft)
                    ]))))));
  }

  /// Section Widget
  Widget _buildWelcome(BuildContext context) {
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

  /// Navigates to the homeScreen when the action is triggered.
  onTapLogIN(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtIfYouHaveNot(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }
}
