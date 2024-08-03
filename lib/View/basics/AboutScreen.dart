import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [cyan600, cyan100, cyan500],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text(
              'About',
              style: TextStyle(color: white),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: white,
              ),
              onPressed: () {
                Get.back();
              },
            )),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    'assets/logo_v2.png',
                  ),
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '1.0.0',
                  style: TextStyle(color: cyan500),
                ),
                SizedBox(
                  height: 140,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.phone_circle_fill,
                        color: cyan100,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'contact us'.tr,
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.facebook,
                        color: cyan100,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Follow us on facebook'.tr,
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //height: 200,
        ),
      ),
    );
  }
}
