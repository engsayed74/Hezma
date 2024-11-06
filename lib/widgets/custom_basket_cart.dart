import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomBasketCart extends StatefulWidget {
  const CustomBasketCart({super.key});

  @override
  State<CustomBasketCart> createState() => _CustomBasketCartState();
}

class _CustomBasketCartState extends State<CustomBasketCart> {
  int increment = 1;

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
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                    iconSize: 32,
                    onPressed: () {
                      increment--;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.green,
                    )),
                Text(
                  '$increment',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                IconButton(
                    iconSize: 32,
                    onPressed: () {
                      increment++;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.green,
                    )),
              ],
            ),
          ),
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
  }
}
