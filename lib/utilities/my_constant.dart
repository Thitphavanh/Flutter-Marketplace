import 'package:flutter/material.dart';

class MyConstant {
  // General
  static String appName = 'MarketPlace';

  // Router
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeBuyerService = 'buyerService';
  static String routeSalerService = 'salerService';
  static String routeRiderService = 'riderService';

  // Image
  static String image1 = 'images/image1.jpg';
  static String image2 = 'images/image2.jpg';
  static String image3 = 'images/image3.jpg';
  static String image4 = 'images/image4.jpg';
  static String image5 = 'images/image5.jpg';

  // Color
  static Color primaryBlue = const Color(0xff87ceeb);
  static Color darkBlue = const Color(0xff080742);
  static Color lightBlue = const Color(0xff1e90ff);

  static Color primaryRed = const Color(0xffd21502);
  static Color darkRed = const Color(0xff4c0805);
  static Color lightRed = const Color(0xff7f1019);

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
        color: darkRed,
        fontWeight: FontWeight.bold,
      );
  TextStyle font2RedStyle() => TextStyle(
        fontSize: 18,
        color: darkRed,
        fontWeight: FontWeight.w700,
      );
  TextStyle font3RedStyle() => TextStyle(
        fontSize: 14,
        color: darkRed,
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
}
