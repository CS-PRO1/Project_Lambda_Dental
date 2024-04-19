import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'.tr),
        backgroundColor: cyan200,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Case ID: '.tr + '00005'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Patient Name: '.tr + 'Leen Mashlah',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Age:'.tr + '22'),
              SizedBox(
                height: 10,
              ),
              Text('Gender: '.tr + 'Female'.tr),
              SizedBox(
                height: 10,
              ),
              Text('Creation Date: ' + '9/12/2023'),
              SizedBox(
                height: 10,
              ),
              Text('Expected Delivery Date: ' + '22/4/2024'),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Order Status: '.tr),
                  Text(
                    'In Progress..'.tr,
                    style: TextStyle(
                      color: Colors.amber[700],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/chart.jpg')),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Notes:'.tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Consectetur, assumenda porro! Iure, dolores repellat excepturi minus sapiente maxime commodi illo, mollitia modi nam praesentium aut deserunt minima velit beatae. Corporis'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Images:'.tr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/login/background.jpg',
                          fit: BoxFit.cover,
                        ),
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: Image.asset(
                          'assets/images/login/background.jpg',
                          fit: BoxFit.cover,
                        ),
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: Image.asset(
                          'assets/images/login/background.jpg',
                          fit: BoxFit.cover,
                        ),
                        width: 300,
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Comments:'.tr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  //height: 300,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit in non proident '),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
