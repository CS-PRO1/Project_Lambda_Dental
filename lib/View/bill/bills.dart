import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bills extends GetView {
  const Bills({super.key});

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
        title: Text('Bills'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                catItemBuilder(context, index),
            itemCount: 40,
            separatorBuilder: (BuildContext context, int index) => Container(
                  height: 1,
                  color: Colors.grey,
                )),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.cyan[200],
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Get.toNamed('/bills');
      //   },
      // ),
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
                'Bill 1',
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              children: [
                Text('date from : 18/4/2024'),
                Text('date to :20/4/2024'),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
