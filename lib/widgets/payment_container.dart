import 'package:flutter/material.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({
    super.key,
    required this.text,
    required this.image,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });
  final String text;
  final String image;
  final int index;
  final bool isSelected;
  final VoidCallback onTap; //final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 90,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          border: Border.all(
            color: Color(
              0xff8DC245,
            ),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$text',
              style: TextStyle(
                  fontFamily: 'STV BOLD',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isSelected ? Colors.white : Color(0xff8DC245)),
            ),
            Image.asset('$image',
                color: index == 0
                    ? null
                    : (isSelected ? Colors.white : Color(0xff8DC245))),
          ],
        ),
      ),
    );
  }
}
