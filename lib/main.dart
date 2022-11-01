import 'package:flutter/material.dart';
import 'package:flutter_marketplace/states/authen.dart';
import 'package:flutter_marketplace/states/buyer_service.dart';
import 'package:flutter_marketplace/states/create_account.dart';
import 'package:flutter_marketplace/states/rider_service.dart';
import 'package:flutter_marketplace/states/saler_service.dart';

import 'constants/my_constant.dart';


final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => const Authen(),
  '/createAccount': (BuildContext context) => const CreateAccount(),
  '/buyerService': (BuildContext context) => const BuyerService(),
  '/salerService': (BuildContext context) => const SalerService(),
  '/riderService': (BuildContext context) => const RiderService(),
};

String? intialRoutes;

void main() {
  intialRoutes = MyConstant.routeAuthen;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: intialRoutes,
    );
  }
}


// EP12.1 วีดีโอ สอนเขียนแอพ สั่งซื้อของ ออนไลด์ เรื่อง การใช้งาน RadioListtile