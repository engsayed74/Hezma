import 'package:flutter/material.dart';
import 'package:hezma_app/views/payment_method.dart';

class CusstomBottomNavigationBarForBasket extends StatelessWidget {
  const CusstomBottomNavigationBarForBasket({
    super.key,
    required this.text,
    required this.onButtonPressed,
  });
  final String text;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      child: SizedBox(
        height: 80,
        child: BottomAppBar(
          child: Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: const EdgeInsets.only(
                    //  left: 160, right: 160, top: 10, bottom: 10),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: onButtonPressed,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      '$text',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'STV Bold'),
                    ),
                  )),
              const Column(
                children: [
                  Text(
                    'مجموع السعر',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'STV Bold'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text('ر.س',
                          style:
                              TextStyle(fontSize: 12, fontFamily: 'STV Bold')),
                      Text('69.00',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontFamily: 'STV Bold',
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
