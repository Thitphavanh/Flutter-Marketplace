import 'package:flutter/material.dart';

class MyConstant {
  // General
  static String appName = 'PHENOMENAL INC.';
  static String domain = 'https://ce31-183-182-114-90.ap.ngrok.io';

  // Router
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeBuyerService = '/buyerService';
  static String routeSalerService = '/salerService';
  static String routeRiderService = '/riderService';

  // Image
  static String image1 = 'images/image1.jpg';
  static String image2 = 'images/image2.jpg';
  static String image3 = 'images/image3.jpg';
  static String image4 = 'images/image4.jpg';
  static String image5 = 'images/image5.jpg';
  static String avatar = 'images/avatar.png';
  static String avatar1 = 'images/avatar1.png';
  static String error = 'images/error.png';

  // Color
  static Color primaryWhite = const Color(0xFFFFFFFF);

  static Color primaryBlue = const Color(0xff87ceeb);
  static Color darkBlue = const Color(0xff080742);
  static Color lightBlue = const Color(0xff1e90ff);

  static Color primaryOrange = const Color(0xfff8a56c);
  static Color darkOrange = const Color(0xfff74525);
  static Color lightOrange = const Color(0xfffec58a);

  static Color primaryBlack = const Color.fromARGB(255, 5, 1, 0);
  static Color darkBlack = const Color.fromARGB(255, 32, 27, 27);
  static Color lightBlack = const Color.fromARGB(255, 51, 49, 49);

  TextStyle font1Style() => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );
  TextStyle font2Style() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
  TextStyle font3Style() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );

  TextStyle font1RedStyle() => TextStyle(
        fontSize: 24,
        color: darkBlack,
        fontWeight: FontWeight.bold,
      );
  TextStyle font2RedStyle() => TextStyle(
        fontSize: 18,
        color: darkBlack,
        fontWeight: FontWeight.w700,
      );
  TextStyle font3RedStyle() => TextStyle(
        fontSize: 14,
        color: darkBlack,
        fontWeight: FontWeight.normal,
      );

  TextStyle font1BlueStyle() => TextStyle(
        fontSize: 24,
        color: darkBlue,
        fontWeight: FontWeight.bold,
      );
  TextStyle font2BlueStyle() => TextStyle(
        fontSize: 18,
        color: darkBlue,
        fontWeight: FontWeight.w700,
      );
  TextStyle font3BlueStyle() => TextStyle(
        fontSize: 14,
        color: darkBlue,
        fontWeight: FontWeight.normal,
      );

  ButtonStyle buttonStyle() => ElevatedButton.styleFrom(
        backgroundColor: MyConstant.darkBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
      );
}
