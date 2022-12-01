import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_marketplace/constants/my_constant.dart';
import 'package:flutter_marketplace/widgets/show_image.dart';
import 'package:flutter_marketplace/widgets/show_title.dart';
import 'package:geolocator/geolocator.dart';

class MyDialog {
  Future<void> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: ListTile(
            leading: ShowImage(pathImage: MyConstant.avatar1),
            title: ShowTitle(
              title: title,
              textStyle: MyConstant().font2Style(),
            ),
            subtitle: ShowTitle(
              title: message,
              textStyle: MyConstant().font3Style(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
                exit(0);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(pathImage: MyConstant.error),
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().font2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyConstant().font3Style(),
          ),
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: TextStyle(color: MyConstant.darkBlack),
            ),
          ),
        ],
      ),
    );
  }
}
