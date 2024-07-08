import 'package:provider/provider.dart';
import 'package:smart_cv/provider/data_providers/auth_provider/singn_up_provider.dart';

import 'package:smart_cv/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  TextEditingController _password1 = TextEditingController();
  TextEditingController _password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        // key: localMessengerKey,
        child: SizedBox(
          // width: double.maxFinite,
          child: Consumer<SignUpDataProvider>(
            builder: (context, value, child) => SingleChildScrollView(
              child: Column(
                children: [
                  _buildNinetyFour(context),
                  SizedBox(height: 16.v),
                  Text("signup your account",
                      style: theme.textTheme.headlineLarge),
                  SizedBox(height: 30.v),
                  Padding(
                    padding: EdgeInsets.only(left: 4, right: 20.h),
                    child: TextFormField(
                      onChanged: (_value) {
                        value.username = _value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username', // Label text
                        labelStyle: CustomTextStyles
                            .bodyLargeGray800, // Label text style
                        hintText: 'Enter your username', // Hint text
                        hintStyle: CustomTextStyles
                            .bodyLargeGray800, // Hint text style
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 20.v), // Content padding
                        prefixIcon: Icon(Icons.person), // Relative icon
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.h),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.v),
                  Padding(
                    padding: EdgeInsets.only(left: 21.h, right: 20.h),
                    child: TextFormField(
                      onChanged: (_value) {
                        value.email = _value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email', // Label text
                        labelStyle: CustomTextStyles
                            .bodyLargeGray800, // Label text style
                        hintText: 'Enter your email', // Hint text
                        hintStyle: CustomTextStyles
                            .bodyLargeGray800, // Hint text style
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 20.v), // Content padding
                        prefixIcon: Icon(Icons.email),
                        // Relative icon
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.h),
                            borderSide: BorderSide.none // Default border color
                            ),
                        filled: true,
                        fillColor: theme.colorScheme.onPrimaryContainer,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.h),
                          borderSide: BorderSide(
                              color: Colors.red), // Red border color for error
                        ),
                        errorStyle:
                            TextStyle(color: Colors.red), // Error text style
                        errorText: value.email != null &&
                                value.email.isNotEmpty &&
                                !isValidEmail(value.email)
                            ? 'Enter a valid email'
                            : null, // Error message
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!isValidEmail(value)) {
                          return 'Enter a valid email';
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30.v),
                  Padding(
                    padding: EdgeInsets.only(left: 21.h, right: 20.h),
                    child: TextFormField(
                      controller: _password1,
                      decoration: InputDecoration(
                        labelText: 'Password', // Label text
                        labelStyle: CustomTextStyles
                            .bodyLargeGray800, // Label text style
                        hintText: 'Enter your password', // Hint text
                        hintStyle: CustomTextStyles
                            .bodyLargeGray800, // Hint text style
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 20.v), // Content padding
                        prefixIcon: Icon(Icons.lock), // Relative icon
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.h),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.onPrimaryContainer,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 30.v),
                  Padding(
                    padding: EdgeInsets.only(left: 21.h, right: 20.h),
                    child: TextFormField(
                      controller: _password2,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password', // Label text
                        labelStyle: CustomTextStyles.bodyLargeGray800,
                        // Label text style
                        hintStyle: CustomTextStyles
                            .bodyLargeGray800, // Hint text style
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 20.v),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.h),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.onPrimaryContainer,

                        hintText: 'Confirm your password', // Hint text
                        // Content padding
                        prefixIcon: Icon(Icons.lock), // Relative icon
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 30.v),
                  CustomElevatedButton(
                    onPressed: () async {
                      value.password = _password1.text;
                      value.password2 = _password2.text;
                      bool? isSubmitted = await value.submit_data(context);

                      if (isSubmitted!) {
                        // _password1.dispose();
                        // _password2.dispose();
                        Navigator.pushNamed(context, AppRoutes.signinScreen);
                      }
                    },
                    text: "Sign up",
                    margin: EdgeInsets.only(left: 19.h, right: 22.h),
                    buttonStyle: CustomButtonStyles.none,
                    decoration:
                        CustomButtonStyles.gradientPrimaryToTealDecoration,
                  ),
                  SizedBox(height: 30.v),
                  GestureDetector(
                    onTap: () {
                      if (value.isSuccess) {}
                      Navigator.pushNamed(context, AppRoutes.signinScreen);
                    },
                    child: Text(
                      "Already have an account ?",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: 30.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse12215x119,
                          height: 215.v,
                          width: 119.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.h, top: 2.v, bottom: 190.v),
                          child: Text(
                            "Need help ?",
                            style: CustomTextStyles.bodyLarge18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  /// Section Widget
  Widget _buildNinetyFour(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 3),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 57.v, bottom: 101.v),
                  child: Text("Welcome!", style: theme.textTheme.displaySmall)),
              CustomImageView(
                  imagePath: ImageConstant.imgGroup3,
                  height: 150,
                  width: 192.h,
                  margin: EdgeInsets.only(left: 0))
            ]));
  }

  /// Navigates to the signinScreen when the action is triggered.
}

bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&\*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  return emailRegex.hasMatch(email);
}
