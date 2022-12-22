import 'package:flutter/material.dart';
import 'package:flutter_marketplace/states/authen.dart';
import 'package:flutter_marketplace/states/buyer_service.dart';
import 'package:flutter_marketplace/states/create_account.dart';
import 'package:flutter_marketplace/states/rider_service.dart';
import 'package:flutter_marketplace/states/seller_service.dart';
import 'constants/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => const Authen(),
  '/createAccount': (BuildContext context) => const CreateAccount(),
  '/buyerService': (BuildContext context) => const BuyerService(),
  '/sellerService': (BuildContext context) => const SellerService(),
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
      debugShowCheckedModeBanner: false,
      title: MyConstant.appName,
      routes: map,
      initialRoute: intialRoutes,
    );
  }
}


// https://www.youtube.com/watch?v=n7ItOrPZEXM&list=PLHk7DPiGKGNBDt1rPlVPCDVlV0ggqzbNy&index=36