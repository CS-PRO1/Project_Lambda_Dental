import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:project_lambda_dental/Controller/Cases/CasesController.dart';
import 'package:project_lambda_dental/View/case/TeethChart.dart';
import 'package:project_lambda_dental/View/case/TeethSelectionScreen.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

import '../../shared/component/ProcessTimeline.dart';

const _orderdetailstitles = [
  'Patient Name',
  'Age',
  'Gender',
  'Teeth Shade',
  'Case Date',
  'Delivery Date',
  'Repeat Case?',
  'Need Trial?',
];

const _orderdetailsinfo = [
  'Leen Mashlah',
  '23',
  'Female',
  'A2',
  '9/12/2023',
  '22/4/2024',
  'No',
  'No',
];

const _orderdetailsicons = [
  Icon(Icons.abc),
  Icon(Icons.abc),
  Icon(Icons.abc),
];

class OrderDetailsScreen extends GetView {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CasesController(),
      builder: (controller) => Scaffold(
        //backgroundColor: bgdark,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'Case #'.tr + '233',
          ),
          backgroundColor: cyan200,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              processTimeline(context),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO
                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Container(
                    //         height: 300,
                    //         width: 300,
                    //         child: Image.asset('assets/chart.jpg')),
                    //   ),
                    // ),

                    SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                        childAspectRatio: 1.75,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        children: List.generate(
                            _orderdetailstitles.length,
                            (index) => orderdetailsCard(
                                  title: _orderdetailstitles[index],
                                  description: _orderdetailsinfo[index],
                                ))),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        child: TeethDisplayWidget(
                          asset: 'assets/teeth.svg',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    orderdetailsCard(
                        centertitle: false,
                        title: 'Notes: ',
                        description:
                            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Consectetur, assumenda porro! Iure, dolores repellat excepturi minus sapiente maxime commodi illo, mollitia modi nam praesentium aut deserunt minima velit beatae. Corporis'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Images:'.tr,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
      ),
    );
  }
}
