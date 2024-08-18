import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Cases/CasesController.dart';
import 'package:project_lambda_dental/View/case/SearchCaseScreen.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

class CaseListScreen extends GetView {
  CaseListScreen({super.key});
  @override
  CasesController controller = Get.put(CasesController());

  @override
  Widget build(BuildContext context) {
    controller.getAllCases();
    return GetBuilder(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: MyAppBar(
          title: 'Cases',
          leading: AppBarPopupMenu(),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(SearchCaseScreen());
                },
                icon: Icon(Icons.search_rounded))
          ],
        ),
        body: BuildCondition(
          condition: controller.caseListModel != null,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      BuildCondition(
                        condition: controller.caseListModel!.data.isNotEmpty,
                        fallback: (context) =>
                            Center(child: Text('No Cases added yet')),
                        builder: (context) => ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                catItemBuilder(context, index),
                            itemCount: controller.caseListModel!.data.length,
                            separatorBuilder:
                                (BuildContext context, int index) => Container(
                                      height: 1,
                                      color: Colors.grey,
                                    )),
                      ),
                      Positioned(
                        bottom: 60,
                        right: 20.0, // or whatever
                        child: MyFloatButton(
                          onTap: () {
                            Get.toNamed('/addorder');
                          },
                        ),
                      )
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

  catItemBuilder(context, index) {
    return InkWell(
      onTap: () => Get.offAndToNamed('/orderdetails', arguments: {'id': controller.caseListModel!.data[index].id}),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  controller.caseListModel!.data[index].patient_name!,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Column(
                children: [
                  Text('${controller.caseListModel!.data[index].created_at}'
                      .substring(0, 10)),
                  Text('Status'.tr +
                      ': ' +
                      (controller.caseListModel!.data[index].status == 0
                          ? 'Unconfirmed'
                          : 'Confirmed')),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
