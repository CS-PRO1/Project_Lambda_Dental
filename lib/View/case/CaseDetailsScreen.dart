import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Cases/CasesController.dart';
import 'package:project_lambda_dental/Model/Cases/CommentsModel.dart';
import 'package:project_lambda_dental/View/case/TeethChart.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

import '../../shared/component/ProcessTimeline.dart';

class CaseDetailsScreen extends StatefulWidget {
  CaseDetailsScreen({super.key});

  @override
  _CaseDetailsScreenState createState() => _CaseDetailsScreenState();
}

class _CaseDetailsScreenState extends State<CaseDetailsScreen> {
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
    controller.caseDetailsModel!.caseDetails![0].patientName,
    controller.caseDetailsModel!.caseDetails![0].age,
    controller.caseDetailsModel!.caseDetails![0].gender,
    controller.caseDetailsModel!.caseDetails![0].shade,
    controller.caseDetailsModel!.caseDetails![0].createdAt!.substring(0, 10),
    controller.caseDetailsModel!.caseDetails![0].expectDeliveryTime!
        .substring(0, 10),
    controller.caseDetailsModel!.caseDetails![0].repeate,
    controller.caseDetailsModel!.caseDetails![0].needTrial,
  ];

  final orderdetailsicons = [
    Icon(Icons.abc),
    Icon(Icons.abc),
    Icon(Icons.abc),
  ];

  // late List<Comment> comments = controller.commentsModel!.comments
  //     .where((element) => element.caseId == id)
  //     .toList();

  @override
  void initState() {
    super.initState();
    controller.getCaseDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) => BuildCondition(
        condition: controller.caseDetailsModel != null,
        fallback: (context) => Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        )),
        builder: (context) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Text(
              'Case #'.tr +
                  controller.caseDetailsModel!.caseDetails![0].id.toString(),
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
                    controller.caseDetailsModel!.caseDetails![0].status! == 1
                        ? 1
                        : controller.caseDetailsModel!.caseDetails![0]
                                    .confirmDelivery ==
                                1
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
                          description: controller
                              .caseDetailsModel!.caseDetails![0].notes!),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Comments:'.tr,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          //height: 300,
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) =>
                                  commentBuilder(context, index),
                              itemCount: controller.caseListModel!.data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Container(
                                        height: 1,
                                        color: Colors.grey,
                                      )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commentBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          // Text('${comments[index].comment}'),
          // Text('${comments[index].createdAt.toString().substring(0, 10)}'),
        ],
      ),
    );
  }
}
