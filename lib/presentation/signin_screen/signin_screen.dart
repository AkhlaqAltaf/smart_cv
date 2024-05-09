import 'package:provider/provider.dart';
import 'package:smart_cv/provider/data_providers/auth_provider/signin_data_provider.dart';
import 'package:smart_cv/provider/data_providers/error_display_provider/error_provider.dart';
import 'package:smart_cv/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

// ignore_for_file: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      // key: globalMessengerKey,
      body: Form(
          // key: globalMessengerKey,
          child: SizedBox(
              width: double.maxFinite,
              child: Consumer<SignInDataProvider>(
                  builder: (context, value, child) => SingleChildScrollView(
                          child: Column(children: [
                        _buildWelcome(context),
                        SizedBox(height: 26.v),
                        Text("login your account",
                            style: theme.textTheme.headlineLarge),
                        SizedBox(height: 53.v),
                        Padding(
                          padding: EdgeInsets.only(left: 23.h, right: 19.h),
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
                                  borderSide:
                                      BorderSide.none // Default border color
                                  ),
                              filled: true,
                              fillColor: theme.colorScheme.onPrimaryContainer,
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.h),
                                borderSide: BorderSide(
                                    color: Colors
                                        .red), // Red border color for error
                              ),
                              errorStyle: TextStyle(
                                  color: Colors.red), // Error text style
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
                        SizedBox(height: 28.v),
                        Padding(
                          padding: EdgeInsets.only(left: 23.h, right: 19.h),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Password",
                              labelStyle: CustomTextStyles.bodyLargeGray800,
                              hintStyle: CustomTextStyles.bodyLargeGray800,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.h, vertical: 20.v),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.h),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.onPrimaryContainer,
                              prefixIcon: Icon(Icons.password), // Relative icon
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password.';
                              } else if (!isValidPassword(value)) {
                                return 'Password must be at least 6 characters long.';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 27.v),
                        CustomElevatedButton(
                            text: "Log IN",
                            margin: EdgeInsets.only(left: 21.h, right: 22.h),
                            buttonStyle: CustomButtonStyles.none,
                            decoration: CustomButtonStyles
                                .gradientPrimaryToTealDecoration,
                            onPressed: () async {
                              value.password = passwordController.text;

                              bool isSubmitted =
                                  await value.submit_data(context);

                              if (isSubmitted) {
                                passwordController.dispose();
                              }
                              if (value.isSuccess) {
                                onTapLogIN(context);
                              }
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
                      ]))))),
    ));
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

bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&\*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  return emailRegex.hasMatch(email);
}

bool isValidPassword(String password) {
  // Check if the password meets your criteria (e.g., minimum length)
  return password.length >=
      6; // Example: Minimum password length of 6 characters
}
