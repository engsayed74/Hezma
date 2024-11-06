import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.image,
    this.onButtonPressed,
  });
  final String text;
  final String image;
  final void Function()? onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onButtonPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16, top: 14),
              child: Text(
                '$text',
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'STV BOLD',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Image.asset('$image')
          ],
        ));
  }
}
