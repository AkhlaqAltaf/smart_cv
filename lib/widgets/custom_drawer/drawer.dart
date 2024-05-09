import 'package:flutter/material.dart';

import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/local_storage/auth_storage.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.8,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          curve: Curves.easeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'assets/images/logo.png',
                  //   width: 40,
                  //   height: 40,
                  // ),
                  SizedBox(width: 10),
                  Text(
                    'SmartCV',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                'Build Resume',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home, size: 24),
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          onTap: () {
            // downloadInvitationCard(context, 4);
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.list,
            size: 24,
          ),
          title: const Text(
            'Settings',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          onTap: () {
            // Navigator.pop(context);
            // Navigator.pushNamed(context, SettingsScreen.routeName);
          },
        ),
        ListTile(
          leading: const RotationTransition(
            turns: AlwaysStoppedAnimation(180 / 360),
            child: Icon(
              Icons.logout,
              color: Colors.red,
              size: 24,
            ),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Would you like to logout?'),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Logout'),
                      onPressed: () {
                        clearData();
                        Navigator.pushNamed(context, AppRoutes.signinScreen);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    ),
  );
}
