import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomWaterCard extends StatelessWidget {
  const CustomWaterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffF0F0F0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 124,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'حبة مياه 200 ملي',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RatingBar(
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        onRatingChanged: (value) => debugPrint('$value'),
                        initialRating: 4,
                        alignment: Alignment.center,
                        filledColor: Colors.green,
                        size: 16,
                        maxRating: 5,
                      ),
                    ],
                  ),
                  // RatingBar(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'غير متوفر',
                    style: TextStyle(
                        color: Color(0xffFF0F00),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 124,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff8DC245), width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'asset/images/bottle.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
