import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

import '../../shared/component/constants.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    var userNameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var addressController = TextEditingController();
    var phoneNumberController = TextEditingController();
    List info = [
      {
        'text': 'Username',
        'icon': Icons.person,
        'controller': userNameController,
      },
      {
        'text': 'E-Mail',
        'icon': Icons.email,
        'controller': emailController,
      },
      {
        'text': 'Phone Number',
        'icon': Icons.phone,
        'controller': phoneNumberController,
      },
      {
        'text': 'Address',
        'icon': Icons.location_on_sharp,
        'controller': addressController,
      },
      {
        'text': 'New Password',
        'hint': 'Leave empty to keep the current password',
        'icon': Icons.password,
        'controller': passwordController,
      },
    ];

    userNameController.text = 'Dr. Kuzcko';
    emailController.text = 'myemail@example.com';
    addressController.text = 'Damascus, Jibbeh';
    phoneNumberController.text = '+963 937 438 298';

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
    return Scaffold(
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
