import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

class CvResumeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 3.v),
          decoration: AppDecoration.gradientCyanToBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 9.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: _buildNumberedBadge(context, "1", "Personal"),
                  ),
                  Flexible(
                    child: _buildNumberedBadge(context, "2", "Work"),
                  ),
                  Flexible(
                    child: _buildNumberedBadge(context, "4", "Skills"),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: _buildNumberedBadge(context, "5", "Summary"),
                  ),
                  Flexible(
                    child: _buildNumberedBadge(context, "6", "Finalize"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNumberedBadge(BuildContext context, String number, String text) {
    return TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Icon(Icons.add)
          ],
        ));
  }
}
