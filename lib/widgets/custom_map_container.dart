import 'package:flutter/material.dart';

class CustomMapContainer extends StatelessWidget {
  const CustomMapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Color(0xffe9e9e9), width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('asset/images/map.png'),
          const SizedBox(
            height: 8,
          ),
          Text('جدة ,السعودية',
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontFamily: 'STV Bold'))
        ],
      ),
    );
  }
}
