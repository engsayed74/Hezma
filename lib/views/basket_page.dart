import 'package:flutter/material.dart';
import 'package:hezma_app/views/map_page.dart';
import 'package:hezma_app/views/payment_method.dart';
import 'package:hezma_app/widgets/Cart_for_paying.dart';
import 'package:hezma_app/widgets/custom_basket_cart.dart';
import 'package:hezma_app/widgets/custom_bottomnavigation_forbasket.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          title: const Padding(
              padding: EdgeInsets.only(
                top: 32,
                right: 24,
              ),
              child: Center(
                  child: Text(
                'السلة',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                margin: const EdgeInsets.only(top: 32),
                //padding: EdgeInsets.all(16),
                height: MediaQuery.sizeOf(context).height * .5,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return const CustomBasketCart();
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'حدد عنوان التوصيل',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'STV Bold'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: const Color(0xfff0f0f0)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MApPage(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('asset/images/map.png'),
                    const Text(
                      'تحديد ع الخريطة',
                      style: TextStyle(fontFamily: 'STV Bold'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'وقت التوصيل المفضل',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'STV Bold'),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 56, right: 56, top: 12, bottom: 12),
                      foregroundColor: const Color(0xff8dc245),
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Color(0xff8dc245),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'مساءا',
                      style: TextStyle(
                          fontFamily: 'STV Bold',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 56, right: 56, top: 12, bottom: 12),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'صباحا',
                      style: TextStyle(
                          fontFamily: 'STV Bold',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'تفاصيل الدفع',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'STV Bold'),
              ),
              const CartForPAying(),
              const SizedBox(
                height: 64,
              ),
            ]),
          ),
        ),
        bottomNavigationBar: CusstomBottomNavigationBarForBasket(
          text: 'الدفع',
          onButtonPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentMethod(),
                ));
          },
        ));
  }
}
