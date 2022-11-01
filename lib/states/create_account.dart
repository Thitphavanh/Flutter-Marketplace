import 'package:flutter/material.dart';
import 'package:flutter_marketplace/widgets/show_image.dart';
import 'package:flutter_marketplace/widgets/show_title.dart';

import '../constants/my_constant.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: MyConstant.primaryWhite,
        foregroundColor: MyConstant.primaryBlack,
        title: const Text('Create New Account'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          children: [
            buildTitle('ຂໍ້ມູນທົ່ວໄປ:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_a_photo,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  width: size * 0.3,
                  child: ShowImage(pathImage: MyConstant.avatar),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_photo_alternate,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            buildName(size),
            const SizedBox(height: 8.0),
            buildEmail(size),
            const SizedBox(height: 8.0),
            buildPassword(size),
            const SizedBox(height: 8.0),
            buildPhone(size),
            const SizedBox(height: 8.0),
            buildAddress(size),
            const SizedBox(height: 16.0),
            buildTitle('ຊະນິດຂອງຜູ້ໃຊ້:'),
            buildRadioBuyer(),
            buildRadioSeller(),
            buildRadioRider(),
          ],
        ),
      ),
    );
  }

  RadioListTile<String> buildRadioBuyer() {
    return RadioListTile(
      value: 'buyer',
      groupValue: typeUser,
      onChanged: (value) {
        setState(
          () {
            typeUser = value;
          },
        );
      },
      title: ShowTitle(
        title: 'ຜູ້ຊຶ້',
        textStyle: MyConstant().font3Style(),
      ),
      activeColor: Colors.deepOrange,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }

  RadioListTile<String> buildRadioSeller() {
    return RadioListTile(
      value: 'seller',
      groupValue: typeUser,
      onChanged: (value) {
        setState(() {
          typeUser = value;
        });
      },
      title: ShowTitle(
        title: 'ຜູ້ຂາຍ',
        textStyle: MyConstant().font3Style(),
      ),
      activeColor: Colors.deepOrange,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }

  RadioListTile<String> buildRadioRider() {
    return RadioListTile(
      value: 'rider',
      groupValue: typeUser,
      onChanged: (value) {
        setState(() {
          typeUser = value;
        });
      },
      title: ShowTitle(
        title: 'ຜູ້ສົ່ງ',
        textStyle: MyConstant().font3Style(),
      ),
      activeColor: Colors.deepOrange,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          // ignore: sort_child_properties_last
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'name',
              labelStyle: TextStyle(color: Colors.black),
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

  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          // ignore: sort_child_properties_last
          child: TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'address',
              labelStyle: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.home,
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

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          // ignore: sort_child_properties_last
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'email',
              labelStyle: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.email,
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

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          // ignore: sort_child_properties_last
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'phone',
              labelStyle: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.phone,
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
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          // ignore: sort_child_properties_last
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'password',
              labelStyle: TextStyle(color: Colors.black),
              icon: Icon(
                Icons.password,
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

  Container buildTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().font3Style(),
      ),
    );
  }

  buildAvatar() {}
}
