import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Cases/CasesController.dart';
import 'package:project_lambda_dental/Model/Cases/CaseDetailsModel.dart';
import 'package:project_lambda_dental/Model/Cases/CommentsModel.dart';
import 'package:project_lambda_dental/View/case/TeethChart.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

import '../../shared/component/ProcessTimeline.dart';

class CaseDetailsScreen extends GetView {
  CaseDetailsScreen({super.key});
  @override
  final CasesController controller = Get.put(CasesController());
  final int id = Get.arguments['id'];

  final orderdetailstitles = [
    'Patient Name',
    'Age',
    'Gender',
    'Teeth Shade',
    'Case Date',
    'Delivery Date',
    'Repeat Case?',
    'Need Trial?',
  ];

  late var orderdetailsinfo = [
    controller.caseDetailsModel!.caseDetails[0].patientName,
    controller.caseDetailsModel!.caseDetails[0].age,
    controller.caseDetailsModel!.caseDetails[0].gender,
    controller.caseDetailsModel!.caseDetails[0].shade,
    controller.caseDetailsModel!.createdAt,
    controller.caseDetailsModel!.caseDetails[0].expectDeliveryTime,
    controller.caseDetailsModel!.caseDetails[0].repeat,
    controller.caseDetailsModel!.caseDetails[0].needTrial,
  ];

  final orderdetailsicons = [
    Icon(Icons.abc),
    Icon(Icons.abc),
    Icon(Icons.abc),
  ];

  late List<Comment> comments = controller.commentsModel!.comments.where((element) => element.caseId == id).toList();

  @override
  Widget build(BuildContext context) {
    controller.getCaseDetails(id);
    return GetBuilder(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'Case #'.tr + controller.caseDetailsModel!.caseDetails[0].id.toString(),
          ),
          backgroundColor: cyan200,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              processTimeline(
                  context,
                  controller.caseDetailsModel!.caseDetails[0].status
                      ? 1
                      : controller.caseDetailsModel!.caseDetails[0].confirmDelivery
                          ? 2
                          : 0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO
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
                            orderdetailstitles.length,
                            (index) => orderdetailsCard(
                                  title: orderdetailstitles[index],
                                  description:
                                      orderdetailsinfo[index].toString(),
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
                            controller.caseDetailsModel!.caseDetails[0].notes),
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
                              child: Image.network(
                                controller.caseDetailsModel!.image[0],
                                fit: BoxFit.cover,
                              ),
                              width: 300,
                              height: 300,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Image.network(
                                controller.caseDetailsModel!.image[1],
                                fit: BoxFit.cover,
                              ),
                              width: 300,
                              height: 300,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Image.network(
                                controller.caseDetailsModel!.image[2],
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
                                    comments[0].comment),
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
