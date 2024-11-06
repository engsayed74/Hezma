import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {this.hinttext, this.onchanged, this.obscuretext = false});

  String? hinttext;
  bool? obscuretext;
  Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onchanged,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.red),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          )),
    );
  }
}
