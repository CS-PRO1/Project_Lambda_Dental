import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: cyan500,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              'Settings'.tr,
                              style: TextStyle(
                                color: cyan600,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Get.toNamed('/settings')),
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: cyan500,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              'About'.tr,
                              style: TextStyle(
                                color: cyan600,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Get.toNamed('/about')),
                ]),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[cyan400, cyan100]),
          ),
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text('About'.tr),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            // image: DecorationImage(
            //   image: AssetImage("images/login_image.jpg"),
            //   fit: BoxFit.fitHeight,
            // ),
          ),
          child: Center(
            child: Container(
              height: 900,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 400),
                  child: Container(
                    child: Text(
                      'This app is special for you........................... ',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
