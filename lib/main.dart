import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Services/dio.dart';
import 'package:project_lambda_dental/View/basics/settings.dart';
import 'package:project_lambda_dental/View/order/AddOrderScreen.dart';
import 'package:project_lambda_dental/View/basics/LoginScreen.dart';
import 'package:project_lambda_dental/View/basics/RegisterScreen.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/View/bill/bill_details.dart';
import 'package:project_lambda_dental/View/bill/bills.dart';

import 'View/order/OrderListScreen.dart';
import 'View/order/TeethSelectionScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  //var token = CacheHelper.get('token') ?? '';
  DioHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String adultIdToString(int id) {
    final (up, left, number) = switch (id) {
      < 8 => (true, false, 8 - id),
      < 16 => (true, true, id - 8 + 1),
      < 24 => (false, true, 24 - id),
      _ => (false, false, id - 24 + 1),
    };
    return '${up ? 'up' : 'down'} ${left ? 'left' : 'right'} #$number';
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Lambda',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(1, 17, 124, 111)),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/settings', page: () => Settings()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/orderlist', page: () => OrderListScreen()),
        GetPage(name: '/addorder', page: () => AddOrderScreen()),
        GetPage(name: '/bills', page: () => Bills()),
        GetPage(name: '/billdetails', page: () => BillDetails()),
        GetPage(
            name: '/teethselect',
            page: () => TeethSelectionScreen(
                  asset: 'assets/teeth.svg',
                  idToString: adultIdToString,
                )),
      ],
    );
  }
}
