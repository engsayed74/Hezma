import 'package:flutter/material.dart';
import 'package:hezma_app/widgets/pannable_rating_bar.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.favorite_rounded,
                  color: Colors.green,
                )),
            Image.asset(
              'asset/images/pngegg (32) 1.png',
              alignment: Alignment.center,
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 250, 242, 242),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.green,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'برتقال',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        RatingBar(),
                        Text(
                          '20.00 رس/كجم',
                          style: TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
