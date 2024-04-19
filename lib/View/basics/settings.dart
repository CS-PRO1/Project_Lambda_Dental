import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Services/theme/theme_service.dart';
import 'package:project_lambda_dental/locale/LocaleController.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';
//import 'package:testp1/shared/component/components.dart';
//import 'package:testp1/theme_service.dart';

//import 'locale/change_language.dart';
//import 'locale/local_controller.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var emailController = TextEditingController();
  LocaleController localeController = Get.find();
  var passwordController = TextEditingController();
  bool notify = false;
  var language;
  @override
  Widget build(BuildContext context) {
    // MyLocalController controllerlang = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: cyan100,
        title: Text(
          "Settings".tr,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose Language : '.tr,
                style: TextStyle(
                  color: cyan600,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Arabic'.tr,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  Radio(
                      activeColor: cyan400,
                      value: ('Arabic'),
                      groupValue: language,
                      onChanged: (val) {
                        setState(() {
                          language = val;
                          print(language);
                          localeController.changelocale('ar');
                        });
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'English'.tr,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Radio(
                      activeColor: cyan400,
                      value: ('English'),
                      groupValue: language,
                      onChanged: (val) {
                        setState(() {
                          language = val;
                          print(language);
                          //controllerlang.changelange("en");
                          localeController.changelocale('en');
                        });
                      }),
                ],
              ),
              Divider(
                color: cyan500,
                thickness: 2,
                height: 60,
              ),
              SwitchListTile(
                  title: Text(
                    'Dark Mode'.tr,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  activeColor: cyan600,
                  activeTrackColor: cyan400,
                  inactiveTrackColor: cyan200,
                  inactiveThumbColor: cyan300,
                  value: notify,
                  onChanged: (val) {
                    setState(() {
                      ThemeService().changeTheme();
                      notify = val;
                      print(notify);
                    });
                  }),
              Divider(
                color: cyan500,
                thickness: 2,
                height: 60,
              ),
              defaultButton(
                width: double.infinity,
                heigh: 55,
                text: 'LOG OUT'.tr,
                function: () {
                  print(emailController.text);
                  print(passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
