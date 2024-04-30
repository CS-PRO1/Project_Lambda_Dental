import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'About'),
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
