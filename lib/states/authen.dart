import 'package:flutter/material.dart';
import 'package:flutter_marketplace/widgets/show_image.dart';
import 'package:flutter_marketplace/widgets/show_title.dart';

import '../constants/my_constant.dart';

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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            children: [
              const SizedBox(height: 120.0),
              buildImage(size),
              const SizedBox(height: 30.0),
              buildAppName(),
              const SizedBox(height: 10.0),
              buildEmail(size),
              buildPassword(size),
              const SizedBox(height: 60.0),
              buildLogin(size),
              buildCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'None Have Acount?',
          textStyle: MyConstant().font3Style(),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(
            context,
            MyConstant.routeCreateAccount,
          ),
          child: Text(
            'Create Acount',
            style: TextStyle(color: MyConstant.darkOrange),
          ),
        ),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // margin: const EdgeInsets.symmetric(vertical: 30),
          width: size * 0.9,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyConstant.darkBlack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {},
            child: const Text('LOGIN'),
          ),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size * 0.9,
          child: ShowImage(
            pathImage: MyConstant.image1,
          ),
        ),
      ],
    );
  }

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          // ignore: sort_child_properties_last
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'email',
              icon: Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8.0,
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
          // ignore: sort_child_properties_last
          child: TextFormField(
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(Icons.remove_red_eye, color: MyConstant.darkBlack)
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: MyConstant.darkBlack,
                      ),
              ),
              border: InputBorder.none,
              hintText: 'password',
              icon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8.0,
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
          textStyle: MyConstant().font1RedStyle(),
        ),
      ],
    );
  }
}
