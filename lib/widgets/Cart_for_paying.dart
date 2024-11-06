import 'package:flutter/material.dart';

class CartForPAying extends StatelessWidget {
  const CartForPAying({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffF0F0F0), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Color(0xffd9d9d9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 14, right: 24, left: 24),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'تطبيق',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'STV Bold',
                        color: Colors.white),
                  ),
                ),
                const Text(
                  'ادخل كوبون الخصم',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      fontFamily: 'STV Bold'),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('ر.س',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    Text('60.00',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(
                  'قيمة المنتجات',
                  style: TextStyle(
                      fontFamily: 'STV Bold',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('ر.س',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    Text('9.00',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(
                  '%15 ضريبة القيمة المضافة',
                  style: TextStyle(
                      fontFamily: 'STV Bold',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
            child: Row(
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
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(
                  'المجموع',
                  style: TextStyle(
                      fontFamily: 'STV Bold',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
