import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/User/Profile_controller.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        ? model['info'] < 0
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
      init: ProfileController(),
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
            condition: true,
            //fallback: (context) => Center(child: CircularProgressIndicator()),
            //condition: cubit.userModel?.data != null,
            builder: (context) {
              //var userData = cubit.userModel?.data;
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
                                          backgroundImage: NetworkImage(
                                              'https://media.istockphoto.com/id/1371009338/photo/portrait-of-confident-a-young-dentist-working-in-his-consulting-room.jpg?s=612x612&w=0&k=20&c=I212vN7lPpAOwGKRoEY9kYWunJaMj9vH2g-8YBGc2MI=`'),
                                          onBackgroundImageError: (exception,
                                                  stackTrace) =>
                                              Image.asset(
                                                  'assets/images/fallback/user_default.jpg'),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          //userData.name!,
                                          'Dr. Kuzcko',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        SizedBox(height: 20),
                                        ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                itemBuilder(),
                                            separatorBuilder: (context, index) =>
                                                Container(
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
