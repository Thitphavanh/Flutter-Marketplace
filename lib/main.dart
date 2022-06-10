import 'package:flutter/material.dart';
import 'package:flutter_marketplace/states/authen.dart';
import 'package:flutter_marketplace/states/buyer_service.dart';
import 'package:flutter_marketplace/states/create_account.dart';
import 'package:flutter_marketplace/states/rider_service.dart';
import 'package:flutter_marketplace/states/saler_service.dart';
import 'package:flutter_marketplace/utilities/my_constant.dart';


final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  'buyerService': (BuildContext context) => BuyerService(),
  'salerService': (BuildContext context) => SalerService(),
  'riderService': (BuildContext context) => RiderService(),
};

String? intialRoutes;

void main() {
  intialRoutes = MyConstant.routeAuthen;
  runApp(MyApp());
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
