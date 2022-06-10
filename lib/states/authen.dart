import 'package:flutter/material.dart';
import 'package:flutter_marketplace/utilities/my_constant.dart';
import 'package:flutter_marketplace/widgets/show_image.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size * 0.80,
          child: ShowImage(pathImage: MyConstant.image1),
        ),
      ),
    );
  }
}
