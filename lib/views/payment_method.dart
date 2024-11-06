import 'package:flutter/material.dart';
import 'package:hezma_app/views/basket_page.dart';
import 'package:hezma_app/widgets/bank_transfer.dart';
import 'package:hezma_app/widgets/custom_bottomnavigation_forbasket.dart';
import 'package:hezma_app/widgets/electronic_payment.dart';
import 'package:hezma_app/widgets/payment_container.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _currentPage = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

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
              'طريقة الدفع',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PaymentContainer(
                      index: 0,
                      text: 'يواية التقسيط',
                      image: 'asset/images/pay3.png',
                      isSelected: _currentPage == 0,
                      onTap: () => _onButtonPressed(0),
                    ),
                    PaymentContainer(
                      index: 1,
                      text: 'تحويل بنكي',
                      image: 'asset/images/pay2.png',
                      isSelected: _currentPage == 1,
                      onTap: () => _onButtonPressed(1),
                    ),
                    PaymentContainer(
                      index: 2,
                      text: 'دفع الكتروني',
                      image: 'asset/images/pay4.png',
                      isSelected: _currentPage == 2,
                      onTap: () => _onButtonPressed(2),
                    ),
                    PaymentContainer(
                      index: 3,
                      text: 'دفع عند الاستلام',
                      image: 'asset/images/pay1.png',
                      isSelected: _currentPage == 3,
                      onTap: () => _onButtonPressed(3),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('asset/images/Rectangle 70.png'),
                        const SizedBox(
                          height: 16,
                        ),
                        Image.asset('asset/images/Rectangle 71.png'),
                      ],
                    ),
                    const BankTransfering(),
                    const ElectronicPayment(),
                    Image.asset('asset/images/receivemoney.png'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CusstomBottomNavigationBarForBasket(
        text: _currentPage == 1 ? 'ارسال' : 'ادفع',
        onButtonPressed: () {
          _currentPage == 2
              ? showDialog(
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BasketPage(),
                            )),
                        child: Image.asset(
                          'asset/images/paymentdone.png',
                        )),
                  ),
                )
              : null;
        },
      ),
    );
  }
}
