import 'package:flutter/material.dart';
import 'package:zeo/common/color_extention.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? prefixIconImage; // Image asset path for prefix icon

  const RoundTextfield({super.key, required this.hintText, this.prefixIconImage,this.controller, this.keyboardType, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.textfield,
        borderRadius: BorderRadius.circular(25),
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
                color: TColor.placeholder,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          suffixIcon: prefixIconImage != null
              ? Image.asset(prefixIconImage!) // Add image as prefix icon
              : null,

      ),
      ),
    );
  }
}
