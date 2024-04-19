import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillDetails extends GetView {
  const BillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //var cubit = AppCubit().get(context);
    //cubit.getCategory();
    // return BlocConsumer<AppCubit, AppStates>(
    //   listener: (context, state) {},
    //   builder: (context, state) => Scaffold(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Bill'.tr + '001'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    catItemBuilder(context, index),
                itemCount: 8,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                      height: 1,
                      color: Colors.grey,
                    )),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Final Bill'.tr),
                  Text('16.000.000 '),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  catItemBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '2.000.000',
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              children: [
                Text('Material:'.tr + ' ' + 'Zircon'.tr),
                Text('Pieces:'.tr + ' ' + '5'),
              ],
            ),
            // Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
