import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/landing_page_controller.dart';
import 'package:project_lambda_dental/View/bill/bills.dart';
import 'package:project_lambda_dental/View/order/OrderListScreen.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

import '../../Controller/login_controller.dart';
import 'ProfileScreen.dart';

class LandingScreen extends GetView {
  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LandingPageController(),
        builder: (controller) {
          return SafeArea(
              top: false,
              child: Scaffold(
                bottomNavigationBar:
                    buildBottomNavigationMenu(context, controller),
                body: Obx(() => IndexedStack(
                      index: controller.tabIndex.value,
                      children: [
                        OrderListScreen(),
                        Bills(),
                        ProfileScreen(),
                      ],
                    )),
              ));
        });
  }

  buildBottomNavigationMenu(context, controller) {
    return Obx(() => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: BottomNavigationBar(
            currentIndex: controller.tabIndex.value,
            onTap: (value) {
              controller.changeTabIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: 'Cases',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.monetization_on_rounded), label: 'Bills'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded), label: 'Profile')
            ],
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed,
            iconSize: 25,
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          ),
        ));
  }
}
