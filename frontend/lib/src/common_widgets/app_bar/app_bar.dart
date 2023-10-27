import 'package:flutter/material.dart';
import 'package:frontend/src/constants/colors.dart';
import 'package:frontend/src/utils/shared_service.dart';
import 'package:get/get.dart';

AppBar appBar(String title, BuildContext context) {
  return AppBar(
    leading: const Padding(
      padding: EdgeInsets.all(12.0),
      child: Icon(
        Icons.abc,
      ),
    ),
    title: Text(
      title,
    ),
    actions: [
      PopupMenuButton<int>(
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<int>(
              value: 1,
              child: Text('setting'.tr),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Text('logout'.tr),
            ),
          ];
        },
        onSelected: (int value) async {
          // Handle the selected option here
          if (value == 1) {
            Navigator.of(context).pushNamed('/language_selection');
          } else if (value == 2) {
            await SharedService.logout(context);
          }
        },
        child: Icon(
          Icons.settings,
        ),
      ),
      const SizedBox(width: 15),
    ],
  );
}
