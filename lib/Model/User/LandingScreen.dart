import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/landing_page_controller.dart';
import 'package:project_lambda_dental/View/bill/BillsListScreen.dart';
import 'package:project_lambda_dental/View/case/CaseListScreen.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

import '../../View/basics/ProfileScreen.dart';

class LandingScreen extends GetView {
  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LandingPageController(),
        builder: (controller) {
          return SafeArea(
              top: false,
              bottom: false,
              minimum: EdgeInsets.zero,
              child: Scaffold(
                extendBody: true,
                bottomNavigationBar:
                    buildBottomNavigationMenu(context, controller),
                body: Obx(() => IndexedStack(
                      index: controller.tabIndex.value,
                      children: [
                        CaseListScreen(),
                        BillsListScreen(),
                        ProfileScreen(),
                      ],
                    )),
              ));
        });
  }

  buildBottomNavigationMenu(context, controller) {
    return Obx(() => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: ClipRRect(
            child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        cyan_navbar_600,
                        cyan_navbar_300,
                      ]),
                ),
                child: BottomNavigationBar(
                  elevation: 0,
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
                        icon: Icon(Icons.attach_money_rounded), label: 'Bills'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_rounded), label: 'Profile')
                  ],
                  showUnselectedLabels: true,
                  unselectedItemColor: white,
                  selectedItemColor: cyan600,
                  type: BottomNavigationBarType.fixed,
                  iconSize: 25,
                  landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ));
  }
}
