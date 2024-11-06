import 'package:flutter/material.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({super.key, required this.image, required this.title});
 final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle
      ),
      child: Column(
        children: [
          Image.network(image,fit: BoxFit.contain,),
          SizedBox(height: 8,),
          Text(title),
        ],
      ),
    );
  }
}