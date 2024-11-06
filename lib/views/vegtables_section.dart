import 'package:flutter/material.dart';
import 'package:hezma_app/views/fruits_section.dart';
import 'package:hezma_app/views/vegtable_info.dart';
import 'package:hezma_app/views/vegtables_catalog.dart';
import 'package:hezma_app/views/water_section.dart';
import 'package:hezma_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VegtablesSection extends StatefulWidget {
  @override
  State<VegtablesSection> createState() => _VegtablesSectionState();
}

class _VegtablesSectionState extends State<VegtablesSection> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Colors.green,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .67,
                child: Image.asset(
                  'asset/images/Vegetable-Transparent-PNG 1.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200)),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'قسم الخضار',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'يعمل الخضار علي صحة الانسان وتخلصه من مرض السكري',
                      style: TextStyle(
                        fontFamily: 'STV BOLD',
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'وخاصةانواع السكري الثاني بالاضافة الي ان لها دور فعال في الحفاظ علي صحةالجسم',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'STV BOLD'),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    /*  Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            // Icon(Icons.drag_indicator_outlined,color: Colors.white,),
                            // Image.asset('asset/images/indicator.png'),
                            SmoothPageIndicator(
                              effect: const WormEffect(
                                dotColor: Colors.white, // لون النقطة الغير نشطة
                                activeDotColor: Colors
                                    .red, // لون النقطة النشطة عند تغيير الصفحة
                                dotWidth: 8,
                                dotHeight: 8,
                              ),
                              controller: controller, // PageController
                              count: 3,
                              onDotClicked: (index) {
                                controller.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CustomBottomNavigationBar())),
                              child: const Text(
                                'تخطي',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_down_outlined))
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FruitsSection(),
                                  ));
                            },
                            child: Image.asset('asset/images/arrow1.png')),
                      ],
                    )*/
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
