import 'package:flutter/material.dart';
import 'package:zeo/common/color_extention.dart';

class RectangleTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  const RectangleTextfield({super.key, required this.hintText, this.controller, this.keyboardType, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.placeholder,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        autocorrect: false,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType ,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                color: TColor.textfield,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
