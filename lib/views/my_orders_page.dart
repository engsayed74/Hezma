import 'package:flutter/material.dart';
import 'package:hezma_app/views/following_page.dart';
import 'package:hezma_app/widgets/myorders_cart.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

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
                'طلباتي',
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 32),
                  //padding: EdgeInsets.all(16),
                  height: MediaQuery.sizeOf(context).height * .5,
                  child: GridView.builder(
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20,
                      childAspectRatio: 3 / 1,
                    ),
                    itemBuilder: (context, index) {
                      return const MyOrdersCart();
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      backgroundColor: const Color(0xfff0f0f0)),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('ر.س',
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text('69.00',
                              style: TextStyle(
                                  fontFamily: 'STV BOLD',
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(
                        'مجموع السعر بعد الضريبة',
                        style: TextStyle(
                            fontFamily: 'STV Bold', color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            foregroundColor: const Color(0xff8dc245),
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Color(0xff8dc245),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'إلغاء الطلب',
                            style: TextStyle(
                                fontFamily: 'STV Bold',
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FollowingPage(),
                                ));
                          },
                          child: const Text(
                            'تتبع',
                            style: TextStyle(
                                fontFamily: 'STV Bold',
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
