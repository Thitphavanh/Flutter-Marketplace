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
  static Color primaryblue = const Color(0xff87ceeb);
  static Color darkblue = const Color(0xff080742);
  static Color lightlue = const Color(0xff1e90ff);

  static Color primaryred = const Color(0xffd21502);
  static Color darkred = const Color(0xff4c0805);
  static Color lightred = const Color(0xff7f1019);

  TextStyle font1style() => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );
  TextStyle font2style() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
  TextStyle font3style() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );

  TextStyle font1redstyle() => TextStyle(
        fontSize: 24,
        color: darkred,
        fontWeight: FontWeight.bold,
      );
  TextStyle font2redstyle() => TextStyle(
        fontSize: 18,
        color: darkred,
        fontWeight: FontWeight.w700,
      );
  TextStyle font3redstyle() => TextStyle(
        fontSize: 14,
        color: darkred,
        fontWeight: FontWeight.normal,
      );

  TextStyle font1bluestyle() => TextStyle(
        fontSize: 24,
        color: darkred,
        fontWeight: FontWeight.bold,
      );
  TextStyle font2bluestyle() => TextStyle(
        fontSize: 18,
        color: darkred,
        fontWeight: FontWeight.w700,
      );
  TextStyle font3bluestyle() => TextStyle(
        fontSize: 14,
        color: darkred,
        fontWeight: FontWeight.normal,
      );
}
