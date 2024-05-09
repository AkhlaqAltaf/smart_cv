import 'package:flutter/material.dart';
import 'package:smart_cv/theme/theme_helper.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final LinearGradient gradient;
  final double height;
  final BuildContext context;

  GradientAppBar({
    required this.title,
    required this.gradient,
    this.height = kToolbarHeight,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: gradient,
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0, // Remove elevation
              title: title,
              centerTitle: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height + 20 + MediaQuery.of(context).padding.top);
}

/// Section Widget
PreferredSizeWidget customAppBar(BuildContext context, String title) {
  return GradientAppBar(
    title: Text(title),
    context: context,
    gradient: LinearGradient(
      begin: Alignment(0, 0.57),
      end: Alignment(1, 0.63),
      colors: [
        theme.colorScheme.primary,
        appTheme.blueGray500C6,
      ],
    ),
  );
}
