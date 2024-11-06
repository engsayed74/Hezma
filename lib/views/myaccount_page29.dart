import 'package:flutter/material.dart';
import 'package:hezma_app/views/account_editing.dart';
import 'package:hezma_app/views/addresses_page.dart';
import 'package:hezma_app/views/my_orders_page.dart';
import 'package:hezma_app/views/payment_page34.dart';
import 'package:hezma_app/views/private_policy.dart';
import 'package:hezma_app/views/technical_support_page.dart';
import 'package:hezma_app/views/terms_conditions.dart';
import 'package:hezma_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:hezma_app/widgets/custom_textbutton.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

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
              'حسابي',
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'asset/images/لوجو-حزمه 4.png',
                  height: 200,
                ),
              ),
              /* TextButton.icon(onPressed: () {
                
              }, icon: Icon(), label: Text('تعديل الحساب'))*/
              CustomTextButton(
                text: 'تعديل الحساب',
                image: 'asset/images/user.png',
                onButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountEditing(),
                      ));
                },
              ),
              const Divider(
                thickness: .5,
              ),
              CustomTextButton(
                text: 'طلباتي',
                image: 'asset/images/book_x5F_text.png',
                onButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyOrdersPage(),
                      ));
                },
              ),
              const Divider(
                thickness: .5,
              ),
              CustomTextButton(
                onButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddressesPage(),
                      ));
                },
                text: 'العناوين',
                image: 'asset/images/address.png',
              ),
              const Divider(
                thickness: .5,
              ),
              CustomTextButton(
                onButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage34(),
                      ));
                },
                text: 'الدفع',
                image:
                    'asset/images/7787510_bank_card_money_finance_business_icon 1.png',
              ),
              const Divider(
                thickness: .5,
              ),
              CustomTextButton(
                onButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TechnicalSupport(),
                      ));
                },
                text: 'الدعم الفني',
                image: 'asset/images/2639877_online_support_icon 1.png',
              ),
              const Divider(
                thickness: .5,
              ),
              CustomTextButton(
                onButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivatePolicy(),
                      ));
                },
                text: 'سياسة الخصوصية',
                image: 'asset/images/Vector.png',
              ),
              const Divider(
                thickness: .5,
              ),
              CustomTextButton(
                onButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsAndConditions(),
                      ));
                },
                text: 'الشروط والحكام',
                image: 'asset/images/Vector (1).png',
              ),
              const Divider(
                thickness: .5,
              ),
              CustomTextButton(
                text: 'تسجيل خروج',
                image: 'asset/images/Group (1).png',
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
