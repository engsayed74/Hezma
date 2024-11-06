import 'package:flutter/material.dart';
import 'package:hezma_app/views/login_page1.dart';

class WaterSection extends StatefulWidget {
  const WaterSection({super.key});

  @override
  State<WaterSection> createState() => _WaterSectionState();
}

class _WaterSectionState extends State<WaterSection> {
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200)),
                    child: Image.asset(
                      'asset/images/water bottle.png',
                      alignment: Alignment.center,
                    ),
                  ),
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
                      'قسم المياه',
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
                            Image.asset('asset/images/indicator3.png'),
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
                                    builder: (context) => LoginPage1(),
                                  ));
                            },
                            child: Image.asset('asset/images/arrow3.png')),
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
