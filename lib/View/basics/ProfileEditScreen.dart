import 'dart:io';

import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/User/Profile_controller.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

import '../../shared/component/constants.dart';

class ProfileEditScreen extends GetView {
  ProfileEditScreen({super.key});
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    //var passwordController = TextEditingController();
    //var addressController = TextEditingController();
    var phoneNumberController = TextEditingController();
    List info = [
      {
        'text': 'First Name',
        'icon': Icons.person,
        'controller': firstNameController,
      },
      {
        'text': 'Last Name',
        'icon': Icons.person_2,
        'controller': lastNameController,
      },
      {
        'text': 'Phone Number',
        'icon': Icons.phone,
        'controller': phoneNumberController,
      },
      // {
      //   'text': 'Address',
      //   'icon': Icons.location_on_sharp,
      //   'controller': addressController,
      // },
      // {
      //   'text': 'New Password',
      //   'hint': 'Leave empty to keep the current password',
      //   'icon': Icons.password,
      //   'controller': passwordController,
      // },
    ];

    firstNameController.text = controller.profileModel!.firstName;
    lastNameController.text = controller.profileModel!.lastName;
    phoneNumberController.text = controller.profileModel!.phoneNumber;

    //addressController.text = 'Damascus, Jibbeh';
    // userNameController.text = cubit.userModel?.data?.name as String;
    // emailController.text = cubit.userModel?.data?.email as String;
    // phoneNumberController.text = cubit.userModel?.data?.phone as String;

    /*Older stuff*/
    //cubit.getProfile();
    //var userData = cubit.userModel?.data;
    // List userInfo = [
    //   {
    //     'text': userData?.name,
    //     'icon': Icons.person_rounded,
    //   },
    //   {
    //     'text': userData?.email,
    //     'icon': Icons.email,
    //   },
    //   {
    //     'text': userData?.phone,
    //     'icon': Icons.phone,
    //   },
    //   {
    //     'text': 'Points: ' + userData!.points!.toString(),
    //     'icon': Icons.insert_chart_outlined_rounded,
    //   },
    //   {
    //     'text': 'Credit: ' + userData.credit!.toString(),
    //     'icon': Icons.credit_card,
    //   },
    //];
    return GetBuilder(
      
      init: ProfileController(),
      builder: (controller) => Scaffold(
        backgroundColor: bglight,
        appBar: MyAppBar(title: 'Edit Profile'),
        body: BuildCondition(
            fallback: (context) => Center(child: CircularProgressIndicator()),
            //condition: cubit.userModel?.data != null,
            condition: true,
            builder: (context) {
              return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Column(
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
                                                'https://media.istockphoto.com/id/1371009338/photo/portrait-of-confident-a-young-dentist-working-in-his-consulting-room.jpg?s=612x612&w=0&k=20&c=I212vN7lPpAOwGKRoEY9kYWunJaMj9vH2g-8YBGc2MI='),
                                            onBackgroundImageError: (exception,
                                                    stackTrace) =>
                                                Image.asset(
                                                    'images/fallback/user_default.jpg')),
                                        SizedBox(height: 20),
                                        Form(
                                          key: formkey,
                                          child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  itemBuilder(info[index]),
                                              itemCount: info.length),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        defaultButton(
                                            text: 'Save',
                                            function: () {
                                              controller.updateProfile(
                                                  firstNameController.text,
                                                  lastNameController.text,
                                                  phoneNumberController.text);
                                                  controller.getProfile();
                                                  sleep(Duration(seconds: 3));
                                              Get.offAndToNamed('/home');
                                            })
                                        // TextButton(
                                        //     onPressed: () {
                                        //       // cubit.updateProfile(
                                        //       //     userNameController.text,
                                        //       //     emailController.text,
                                        //       //     phoneNumberController.text,
                                        //       //     passwordController.text);
                                        //       Get.offAndToNamed('/profile');
                                        //     },
                                        //     child: Container(
                                        //         decoration: BoxDecoration(
                                        //             color: Theme.of(context)
                                        //                 .primaryColor,
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     30)),
                                        //         width: double.infinity,
                                        //         padding: EdgeInsets.all(15),
                                        //         child:
                                        //             // state
                                        //             //         is! AppProfileUpdateLoadingState
                                        //             //     ?
                                        //             Text(
                                        //           'Save Changes',
                                        //           textAlign: TextAlign.center,
                                        //           style: TextStyle(
                                        //               fontSize: 20,
                                        //               color: Colors.white),
                                        //         )
                                        // : Center(
                                        //     child:
                                        //         CircularProgressIndicator(
                                        //       color: Colors.white,
                                        //     ),
                                        //   )
                                        //)),
                                      ])),
                            )
                          ])));
            }),
      ),
    );
  }
}

itemBuilder(model) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    // child: Row(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Icon(
    //         model['icon'],
    //         color: Colors.blueGrey,
    //       ),
    //     ),
    //     Text(model['text'],
    //         style: TextStyle(
    //           fontSize: 20,
    //           color: Colors.blueGrey,
    //         )),
    //   ],
    // ),
    child: TextFormField(
      onFieldSubmitted: (value) {
        model['controller'].text = value;
      },
      controller: model['controller'],
      decoration: InputDecoration(
          label: Text(model['text']),
          prefixIcon: Icon(model['icon']),
          helperText: model['hint'],
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              model['controller'].text = '';
            },
            child: Icon(
              Icons.clear_rounded,
            ),
          )),
    ),
  );
}
