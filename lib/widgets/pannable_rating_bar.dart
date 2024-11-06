import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

class RatingBar extends StatefulWidget {
  RatingBar({super.key});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double rating = 0.5;

  @override
  Widget build(BuildContext context) {
    return PannableRatingBar(
      textDirection: TextDirection.rtl,
      rate: rating,
      items: List.generate(
          5,
          (index) => const RatingWidget(
                selectedColor: Colors.green,
                unSelectedColor: Colors.grey,
                child: Icon(
                  Icons.star,
                  size: 18,
                ),
              )),
      onChanged: (value) {
        // the rating value is updated on tap or drag.
        setState(() {
          rating = value;
        });
      },
    );
  }
}
