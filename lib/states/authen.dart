import 'package:flutter/material.dart';
import 'package:flutter_marketplace/utilities/my_constant.dart';
import 'package:flutter_marketplace/widgets/show_image.dart';
import 'package:flutter_marketplace/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            buildImage(size),
            const SizedBox(height: 16.0),
            buildAppName(),
            const SizedBox(height: 10.0),
            buildUser(size),
            buildPassword(size),
          ],
        ),
      ),
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.9,
          child: ShowImage(pathImage: MyConstant.image1),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'User',
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 2.0,
                blurRadius: 15.0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          child: TextFormField(
            obscureText: statusRedEye,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              icon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 2.0,
                blurRadius: 15.0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: MyConstant.appName,
          textStyle: MyConstant().font1redstyle(),
        ),
      ],
    );
  }
}
