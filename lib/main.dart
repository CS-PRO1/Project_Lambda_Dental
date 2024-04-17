import 'package:flutter/material.dart';
import 'package:flutter_application_3_getx/Cache/CacheHelper.dart';
import 'package:flutter_application_3_getx/Services/dio.dart';
import 'package:flutter_application_3_getx/View/LoginScreen.dart';
import 'package:flutter_application_3_getx/View/RegisterScreen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  //var token = CacheHelper.get('token') ?? '';
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emall-GetX',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(1, 17, 124, 111)),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen())
      ],
    );
  }
}
