import 'package:flutter/material.dart';
import 'package:flutter_marketplace/utilities/my_constant.dart';

class ShowImage extends StatelessWidget {
  final String pathImage;
  const ShowImage({Key? key, required this.pathImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(pathImage);
  }
}
