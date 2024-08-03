import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Cases/CasesController.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

class CaseListScreen extends GetView {
  const CaseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var cubit = AppCubit().get(context);
    //cubit.getCategory();
    // return BlocConsumer<AppCubit, AppStates>(
    //   listener: (context, state) {},
    //   builder: (context, state) => Scaffold(
        return GetBuilder(
      init: CasesController(),
      builder: (controller) =>  Scaffold(
      appBar: MyAppBar(
        title: 'Cases',
        leading: AppBarPopupMenu(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    catItemBuilder(context, index),
                itemCount: 40,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                      height: 1,
                      color: Colors.grey,
                    )),
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: cyan200,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Get.toNamed('/addorder');
      //   },
      // ),
        ));
  }

  catItemBuilder(context, index) {
    return InkWell(
      onTap: () => Get.toNamed('/orderdetails'),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Patient Name'.tr,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Column(
                children: [
                  Text('2024/12/9'.tr),
                  Text('Status: Ready'.tr),
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
