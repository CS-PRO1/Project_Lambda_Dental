import 'package:flutter/material.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                defaultButton(text: 'Confirm', function: () {}),
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
    );
  }

  Widget NumInput(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 70,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
        maxLength: 1,
        maxLines: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5),
          counterText: '',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
              borderRadius: BorderRadius.circular(10.0)),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (value) => nextFocus(context),
      ),
    );
  }

  void nextFocus(BuildContext context) {
    FocusScope.of(context).nextFocus();
  }
}
