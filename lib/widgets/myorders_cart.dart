import 'package:flutter/material.dart';

class MyOrdersCart extends StatelessWidget {
  const MyOrdersCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: MediaQuery.sizeOf(context).width,
      height: 124,
      decoration: const BoxDecoration(
        color: Color(0xffF0F0F0),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 16, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/images/address.png'),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'الرياض ,السعودية',
                    style: TextStyle(fontFamily: 'STV BOLD'),
                  ),
                ],
              )),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'برتقال',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  'فواكه',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              // RatingBar(),

              Row(
                children: [
                  Text('رس/كجم',
                      style: TextStyle(
                        fontSize: 12,
                      )),
                  Text('20.00',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          Container(
            height: 124,
            decoration: BoxDecoration(
                // border: Border.all(color: Color(0xff8DC245), width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              'asset/images/orangefruit.png',
              height: 90,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
    ;
  }
}
