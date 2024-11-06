import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:hezma_app/widgets/custom_stepper.dart';

class FollowingPage extends StatefulWidget {
  FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
            padding: EdgeInsets.only(
              top: 32,
              right: 24,
            ),
            child: Center(
                child: Text(
              'تتبع',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'STV BOLD'),
            ))),
        //backgroundColor:Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 24,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Image.asset('asset/images/following.png'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 243, 239, 239),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '(356546)',
                            style: TextStyle(
                                color: Color(0xffa2cd68),
                                fontFamily: 'STV BOLD'),
                          ),
                          Text(
                            'تتبع توصيل طلبك رقم',
                            style: TextStyle(fontFamily: 'STV BOLD'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Text('تاريخ الطلب',
                                      style: TextStyle(
                                          color: Color(0xffa2cd68),
                                          fontFamily: 'STV BOLD')),
                                  Text(
                                    '20/07/2024',
                                    style: TextStyle(fontFamily: 'STV BOLD'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset('asset/images/container.png')
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Text('عدد الاصناف',
                                      style: TextStyle(
                                          color: Color(0xffa2cd68),
                                          fontFamily: 'STV BOLD')),
                                  Text(
                                    '3 اصناف',
                                    style: TextStyle(fontFamily: 'STV BOLD'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset('asset/images/container.png')
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Text('حالة الطلب',
                                      style: TextStyle(
                                          color: Color(0xffa2cd68),
                                          fontFamily: 'STV BOLD')),
                                  Text(
                                    'قيد التنفيذ',
                                    style: TextStyle(fontFamily: 'STV BOLD'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset('asset/images/container.png')
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Text(
                            'الوقت المتوقع للتوصيل :  30/7/2024  م بين الوقت 4:30 م الي 5:00 م',
                            style: TextStyle(fontFamily: 'STV BOLD'),
                            textAlign: TextAlign.right,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const CustomStepper(),
                      Divider(),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'تواصل مع الدعم',
                                  style: TextStyle(
                                      fontFamily: 'STV Bold',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          const Column(
                            children: [
                              Text('محمود',
                                  style: TextStyle(
                                      fontFamily: 'STV Bold',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20)),
                              Text('دليفري'),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Image.asset('asset/images/delivery.png')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
