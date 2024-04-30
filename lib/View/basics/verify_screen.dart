import 'package:flutter/material.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //     height: 500,
              //     width: 500,
              // child: Image(
              //   image: AssetImage('assets/images/login/email-verify.png'),
              // )),
              Text('Verify Your Email',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Text('Please enter the 6 digit code sent to'),
              Text('blabla@blablaleen.com'),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  NumInput(context),
                  NumInput(context),
                  NumInput(context),
                  NumInput(context),
                  NumInput(context),
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
                    'Resend Code',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        decoration: TextDecoration.underline),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget NumInput(BuildContext context) {
    return TextFormField(
      maxLength: 1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
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
    );
  }
}
