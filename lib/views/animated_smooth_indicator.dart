import 'package:flutter/material.dart';
import 'package:hezma_app/views/fruits_section.dart';
import 'package:hezma_app/views/login_page1.dart';
import 'package:hezma_app/views/vegtables_section.dart';
import 'package:hezma_app/views/water_section.dart';
import 'package:hezma_app/views/fruits_section.dart';
import 'package:hezma_app/widgets/custom_bottom_navigation_bar.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pagecontroller = PageController();
  final int targetPage = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pagecontroller,
            children: [
              VegtablesSection(),
              FruitsSection(),
              WaterSection(),
            ],
          ),
          Container(
            alignment: const Alignment(-0.9, 0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: pagecontroller,
                        count: targetPage,
                        effect: const ExpandingDotsEffect(
                            dotWidth: 10.0,
                            dotHeight: 5.0,
                            activeDotColor: Colors.red,
                            dotColor: Colors.white),
                      ),
                      const Spacer(),
                      AnimatedBuilder(
                        animation: pagecontroller,
                        builder: (context, child) {
                          double progress = (pagecontroller.hasClients &&
                                  pagecontroller.page != null)
                              ? (pagecontroller.page! + 1) / targetPage
                              : 0.0;
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(16),
                            ),
                            onPressed: () {
                              if (pagecontroller.page!.toInt() ==
                                  targetPage - 1) {
                                // Navigate to next page when reaching the end
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage1(),
                                    ));
                              } else {
                                // Move to the next page
                                pagecontroller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: CircularProgressIndicator(
                                    value: progress,
                                    strokeWidth: 4.0,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      Colors.green,
                                    ),
                                    backgroundColor: Colors.green[300],
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Transform.rotate(
                                      angle: 0.0,
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CustomBottomNavigationBar(),
                              ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 30, left: 8),
                          child: Text(
                            'تخطى',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'STVBold'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
