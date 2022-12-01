import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/widgets/show_image.dart';
import 'package:flutter_marketplace/widgets/show_progress.dart';
import 'package:flutter_marketplace/widgets/show_title.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/my_constant.dart';
import '../utils/my_dialog.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
  File? file;
  double? lat, lng;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  Future<void> checkPermission() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          // ignore: use_build_context_synchronously
          MyDialog().alertLocationService(
              context,
              'Unable to access your location',
              'Please to share your location');
        } else {
          findLaLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          // ignore: use_build_context_synchronously
          MyDialog().alertLocationService(
              context,
              'Unable to access your location',
              'Please to share your location');
        } else {
          findLaLng();
        }
      }
    } else {
      // ignore: use_build_context_synchronously
      MyDialog().alertLocationService(context, 'Location service close!',
          'Please open your location service');
    }
  }

  Future<void> findLaLng() async {
    // print('findLaLng ==> work');
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      // print('lat = $lat, lng = $lng');
    });
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          buildIconButtonSave(),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: MyConstant.primaryWhite,
        foregroundColor: MyConstant.primaryBlack,
        title: const Text('Create New Account'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('ຂໍ້ມູນທົ່ວໄປ:', size),
                buildImageProfile(size),
                const SizedBox(height: 8.0),
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
                buildTitle('ຊະນິດຂອງຜູ້ໃຊ້:', size),
                buildRadioBuyer(),
                buildRadioSeller(),
                buildRadioRider(),
                buildTitle('ສະແດງທີ່ຢູ່ຂອງທ່ານ:', size),
                buildMap(size),
                const SizedBox(height: 50.0),
                buildButtonSave(size),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildIconButtonSave() {
    return IconButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (typeUser == null) {
            MyDialog().normalDialog(
                context, 'ທ່ານຍັງບໍ່ໄດ້ເລືອກ', 'ກະລຸນາເລືອກ ຊະນິດຜູ້ໃຊ້ງານ');
          } else {
            // print('Process insert to database');
          }
        }
      },
      icon: const Icon(Icons.file_download_outlined),
    );
  }

  SizedBox buildButtonSave(double size) {
    return SizedBox(
      width: size * 0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyConstant.darkBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (typeUser == null) {
              print('Non choose type user');
              MyDialog().normalDialog(
                  context, 'ທ່ານຍັງບໍ່ໄດ້ເລືອກ', 'ກະລຸນາເລືອກ ຊະນິດຜູ້ໃຊ້ງານ');
            } else {
              // print('Process insert to database');
            }
          }
        },
        child: const Text('SAVE'),
      ),
    );
  }

  Set<Marker> setMarker() => <Marker>{
        Marker(
          markerId: const MarkerId('id'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(
            title: 'ທີ່ຢູ່ຂອງທ່ານ',
            snippet: 'Lat = $lat, Lng = $lng',
          ),
        ),
      };

  Widget buildMap(double size) => SizedBox(
        width: size * 0.9,
        // color: Colors.grey,

        height: 250,
        child: lat == null
            ? const ShowProgress()
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat!, lng!),
                  zoom: 16.0,
                ),
                onMapCreated: (controller) {},
                markers: setMarker(),
              ),
      );

  Future<void> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {
      print(e);
    }
  }

  Row buildImageProfile(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: const Icon(
            Icons.add_a_photo,
            size: 28,
            color: Colors.black,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          width: size * 0.3,
          child: file == null
              ? ShowImage(pathImage: MyConstant.avatar)
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: const Icon(
            Icons.add_photo_alternate,
            size: 28,
            color: Colors.black,
          ),
        ),
      ],
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
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'ກະລຸນາຕື່ມ ຊື່ຂອງທ່ານ';
              } else {}
            },
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
            keyboardType: TextInputType.streetAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'ກະລຸນາຕື່ມ ທີ່ຢູ່ຂອງທ່ານ';
              } else {}
            },
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
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'ກະລຸນາຕື່ມ ທີ່ຢູ່ອີເມລ໌ຂອງທ່ານ';
              } else {}
            },
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
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'ກະລຸນາຕື່ມ ເບີໂທລະສັບຂອງທ່ານ';
              } else {}
            },
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
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(left: 20.0),
          width: size * 0.9,
          // ignore: sort_child_properties_last
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value!.isEmpty) {
                return 'ກະລຸນາຕື່ມ ລະຫັດຜ່ານຂອງທ່ານ';
              } else {}
            },
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

  Container buildTitle(String title, double size) {
    return Container(
      width: size * 0.9,
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().font3Style(),
      ),
    );
  }
}
