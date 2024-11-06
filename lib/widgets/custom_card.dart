import 'package:flutter/material.dart';
import 'package:hezma_app/widgets/pannable_rating_bar.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});
  final String imageUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffF0F0F0), width: 4),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.favorite_outlined,
                      color: Colors.green,
                    )),
                Center(
                    child: Image.network(
                  '$imageUrl',
                  width: 100,
                  height: 100,
                ))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xffF0F0F0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$name',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        RatingBar(),
                        Row(
                          children: [
                            Text('رس/كجم',
                                style: TextStyle(
                                  fontFamily: 'STV Bold',
                                  fontSize: 12,
                                )),
                            Text(' $price',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'STV Bold',
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
