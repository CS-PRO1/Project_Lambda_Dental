import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Cases/CasesController.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class SearchCaseScreen extends StatefulWidget {
  SearchCaseScreen({super.key});
  @override
  State<SearchCaseScreen> createState() => _SearchCaseState();
}

class _SearchCaseState extends State<SearchCaseScreen> {
  CasesController controller = Get.put(CasesController());
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: MyAppBar(
          title: 'Search for Cases',
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                onFieldSubmitted: (value) {
                  controller.searchCase(value);
                },
                controller: searchcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: 'Enter Patient Name...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: cyan300, width: 4))),
              ),
              BuildCondition(
                condition: controller.caseSearchModel != null,
                fallback: (context) => Container(),
                builder: (context) => Expanded(
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          catItemBuilder(context, index),
                      itemCount: 1,
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                            height: 1,
                            color: Colors.grey,
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  catItemBuilder(context, index) {
    return InkWell(
      onTap: () => Get.toNamed('/orderdetails', arguments: {
        'id': controller.caseListModel!.data.where((element) =>
            element.patient_name == controller.caseSearchModel!.patient_name).first.id
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  controller.caseSearchModel!.patient_name,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('Status'.tr +
                  ': ' +
                  (controller.caseSearchModel!.status == 0
                      ? 'Unconfirmed'
                      : controller.caseSearchModel!.confirm_delivery ==
                              1
                          ? 'Delivered'
                          : 'Confirmed')),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
