import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/View/basics/LoginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  List titles = [
    'Welcome to LambdaDent!',
    'Organize Your Cases',
    'Keep track of your Bills and Credit'
  ];

  List texts = [
    'Transforming Dental Workflows with Tech-Driven Excellence.',
    'Easily find any case and track its progress',
    'Keep your finances in check'
  ];

  List images = [
    'assets/logo_v2.png',
    'assets/images/welcome/dental-pattern.png',
    'assets/images/welcome/finance-pattern.png',
  ];

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    bool isLast = false;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
          AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Card(
            elevation: 10,
            child: TextButton(
              onPressed: () {
                CacheHelper.setBool('on_board', true);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              },
              child: Text(
                'SKIP',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ]),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: pageController,
              onPageChanged: (value) {
                value == titles.length - 1 ? isLast = true : isLast = false;
              },
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Image.asset(
                      images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(titles[0],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    texts[0],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ]),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    child: Image.asset(
                      images[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(titles[1],
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    texts[1],
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )
                ]),
                Column(children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    child: Image.asset(
                      images[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(titles[2],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(texts[2], style: TextStyle(fontSize: 20))
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isLast) {
              CacheHelper.setBool('on_board', true);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
            } else {
              pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Icon(Icons.arrow_forward_ios)),
    );
  }
}
