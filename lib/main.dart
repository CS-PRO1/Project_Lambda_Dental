import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Services/theme/dio.dart';
import 'package:project_lambda_dental/View/basics/AboutScreen.dart';
import 'package:project_lambda_dental/View/basics/LandingScreen.dart';
import 'package:project_lambda_dental/View/basics/ProfileEditScreen.dart';
import 'package:project_lambda_dental/View/basics/ProfileScreen.dart';
import 'package:project_lambda_dental/View/basics/RegisterScreen.dart';
import 'package:project_lambda_dental/View/basics/SettingsScreen.dart';
import 'package:project_lambda_dental/View/basics/EmailVerificationScreen.dart';
import 'package:project_lambda_dental/View/case/AddOrderScreen.dart';
import 'package:project_lambda_dental/View/basics/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/View/bill/BillDetailsScreen.dart';
import 'package:project_lambda_dental/View/bill/BillsListScreen.dart';
import 'package:project_lambda_dental/View/case/CaseListScreen.dart';
import 'package:project_lambda_dental/locale/dictionary.dart';

import 'Services/Firebase/firebase_api.dart';
import 'Services/Firebase/firebase_options.dart';
import 'View/basics/WelcomeScreen.dart';
import 'View/case/OrderDetailsScreen.dart';
import 'View/case/TeethSelectionScreen.dart';
import 'locale/LocaleController.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await CacheHelper.init();
  await Firebase.initializeApp(
    name: 'LambdaDent',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'basic_notification',
        channelDescription: 'Notification channel description for basic tests',
        importance: NotificationImportance.Max,
        criticalAlerts: true,
      ),
    ],
    debug: true,
  );
  //await StorageHandler.init();
  //var token = CacheHelper.get('token') ?? '';
  DioHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  var token = CacheHelper.get('token') ?? '';
  var on_board = CacheHelper.get('on_board') ?? false;
  Widget widget;
  if (!on_board) {
    widget = WelcomeScreen();
  } else if (token == '') {
    widget = LoginScreen();
  } else {
    widget = LandingScreen();
  }

  FlutterNativeSplash.remove();
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  dynamic widget;
  MyApp(widget) {
    this.widget = widget;
  }
  
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());

    return GetMaterialApp(
      home: widget,
      debugShowCheckedModeBanner: false,
      title: 'Project Lambda',
      locale: localeController.initialLocale,
      translations: Dictionary(),
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(1, 17, 124, 111)),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => LandingScreen()),
        GetPage(name: '/settings', page: () => Settings()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/profile_edit', page: () => ProfileEditScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/orderlist', page: () => CaseListScreen()),
        GetPage(name: '/addorder', page: () => AddOrderScreen()),
        GetPage(name: '/orderdetails', page: () => OrderDetailsScreen()),
        GetPage(name: '/bills', page: () => BillsListScreen()),
        GetPage(name: '/billdetails', page: () => BillDetailsScreen()),
        GetPage(name: '/verify-email', page: () => EmailVerificationScreen()),
        GetPage(name: '/about', page: () => About()),
        GetPage(name: '/welcome', page: () => WelcomeScreen()),
        GetPage(
            name: '/teethselect',
            page: () => TeethSelectionScreen(
                  asset: 'assets/teeth.svg',
                  //idToString: generateToothId,
                )),
      ],
    );
  }
}
