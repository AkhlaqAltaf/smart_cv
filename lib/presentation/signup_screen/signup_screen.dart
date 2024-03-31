import 'package:provider/provider.dart';
import 'package:smart_cv/provider/data_providers/auth_provider/singn_up_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';
import 'package:smart_cv/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  // TextEditingController phoneNumberController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();

  // TextEditingController confirmpasswordController = TextEditingController();

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
                    child: Consumer<SignUpDataProvider>(
                      builder: (context, value, child) => SingleChildScrollView(
                          child: Column(children: [
                        _buildNinetyFour(context),
                        SizedBox(height: 16.v),
                        Text("signup your account",
                            style: theme.textTheme.headlineLarge),
                        SizedBox(height: 33.v),
                        Padding(
                            padding: EdgeInsets.only(left: 21.h, right: 20.h),
                            child: CustomTextFormField(
                                initialText: value.email,
                                onChange: (_value) {
                                  value.email = _value;
                                },
                                hintText: "Email or phone number",
                                textInputType: TextInputType.emailAddress)),
                        SizedBox(height: 29.v),
                        Padding(
                            padding: EdgeInsets.only(left: 21.h, right: 20.h),
                            child: CustomTextFormField(
                                onChange: (_value) {
                                  value.password = _value;
                                },
                                hintText: "password",
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true)),
                        SizedBox(height: 29.v),
                        Padding(
                            padding: EdgeInsets.only(left: 21.h, right: 20.h),
                            child: CustomTextFormField(
                                // controller: confirmpasswordController,
                                hintText: "confirm Password",
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true)),
                        SizedBox(height: 27.v),
                        CustomElevatedButton(
                            text: "Sign up",
                            margin: EdgeInsets.only(left: 19.h, right: 22.h),
                            buttonStyle: CustomButtonStyles.none,
                            decoration: CustomButtonStyles
                                .gradientPrimaryToTealDecoration),
                        SizedBox(height: 27.v),
                        GestureDetector(
                            onTap: () {
                              value.submit_data();
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
                      ])),
                    )))));
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

  /// Navigates to the signinScreen when the action is triggered.
}
