import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_marketplace/constants/my_constant.dart';
import 'package:flutter_marketplace/widgets/show_image.dart';
import 'package:flutter_marketplace/widgets/show_title.dart';
import 'package:geolocator/geolocator.dart';

class MyDialog {
  Future<void> alertLocationService(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: ListTile(
            leading: ShowImage(pathImage: MyConstant.avatar1),
            title: ShowTitle(
              title: 'Location service close!',
              textStyle: MyConstant().font2Style(),
            ),
            subtitle: ShowTitle(
              title: 'Please open your location service',
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
}
