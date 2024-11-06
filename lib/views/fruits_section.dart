import 'package:flutter/material.dart';
import 'package:hezma_app/views/water_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FruitsSection extends StatefulWidget {
  FruitsSection({super.key});

  @override
  State<FruitsSection> createState() => _FruitsSectionState();
}

class _FruitsSectionState extends State<FruitsSection> {
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
                  'asset/images/fruits.png',
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
                      'قسم الفواكه',
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
                        fontFamily: 'STV BOLD',
                        color: Colors.white,
                        fontSize: 12,
                      ),
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
                            // Image.asset('asset/images/indicator2.png'),
                            SmoothPageIndicator(
                                effect: const WormEffect(
                                    dotColor: Colors.white,
                                    dotWidth: 8,
                                    dotHeight: 8),
                                controller: controller, // PageController
                                count: 5,
                                //effect: WormEffect(), // your preferred effect
                                onDotClicked: (index) {}),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'تخطي',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_down_outlined))
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WaterSection(),
                                ),
                              );
                            },
                            child: Image.asset('asset/images/arrow2.png')),
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
