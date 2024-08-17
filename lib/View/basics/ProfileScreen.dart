import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Controller/User/Profile_controller.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    print(CacheHelper.get('token'));
    controller.getProfile();
    
    itemBuilder(model) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                model['icon'],
                color: Colors.blueGrey,
              ),
            ),
            Text(model['title'],
                style: TextStyle(
                  fontSize: 20,
                  color: cyan600,
                )),
            Text(model['info'].toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: model['title'] == 'Credit: '
                        ? controller.profileModel!.wallet < 0
                            ? Colors.red
                            : Colors.green
                        : Colors.blueGrey[300]
                    //color: Colors.blueGrey,
                    )),
          ],
        ),
      );
    }

    return GetBuilder(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: bglight,
        appBar: MyAppBar(
          title: ' Profile',
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/profile_edit');
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: BuildCondition(
            condition: controller.profileModel?.firstName != null,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) {
              List userInfo = [
                {
                  'title': 'Name: ',
                  'info': controller.profileModel!.firstName +
                      controller.profileModel!.lastName,
                  'icon': Icons.person,
                },
                {
                  'title': 'Phone:',
                  'info': controller.profileModel!.phoneNumber,
                  'icon': CupertinoIcons.phone_circle_fill,
                },
                {
                  'title': 'Credit: ',
                  'info': controller.profileModel!.wallet,
                  'icon': Icons.credit_card_rounded,
                },
              ];
              return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 80,
                                          backgroundImage: NetworkImage(''),
                                          onBackgroundImageError: (exception,
                                                  stackTrace) =>
                                              Image.asset(
                                                  'assets/images/fallback/user_default.jpg'),
                                        ),
                                        SizedBox(height: 20),
                                        ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                itemBuilder(userInfo[index]),
                                            separatorBuilder:
                                                (context, index) => Container(
                                                      height: 1,
                                                      color: Colors.grey,
                                                    ),
                                            itemCount: userInfo.length),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ])),
                            )
                          ])));
            }),
      ),
    );
  }
}
