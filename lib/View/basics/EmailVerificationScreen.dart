import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/User/Auth_controller.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class EmailVerificationScreen extends GetView {
  EmailVerificationScreen({super.key});

  TextEditingController codecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: cyan100,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            color: bglight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: 250,
                      child: Image(
                        image: AssetImage('assets/images/login/email-verify.png'),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Verify Your Email',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Please enter the 6 digit code sent to'),
                  Text('blabla@blablaleen.com'),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumInput(context, controller: codecontroller),
                      SizedBox(
                        width: 10,
                      ),
                      NumInput(context),
                      SizedBox(
                        width: 10,
                      ),
                      NumInput(context),
                      SizedBox(
                        width: 10,
                      ),
                      NumInput(context),
                      SizedBox(
                        width: 10,
                      ),
                      NumInput(context),
                      SizedBox(
                        width: 10,
                      ),
                      NumInput(context),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(text: 'Confirm', function: () {
                    controller.emailverification('email', codecontroller.text);
                  }),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change Email',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
