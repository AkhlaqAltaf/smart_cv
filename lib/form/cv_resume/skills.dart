import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

Widget skills(BuildContext context) {
  return Column(
    children: [
      CustomTextFormField(
          // controller: passwordController,
          hintText: "Name",
          hintStyle: CustomTextStyles.bodyLargeGray800,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v))
    ],
  );
}
