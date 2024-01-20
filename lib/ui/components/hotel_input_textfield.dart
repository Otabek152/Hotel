import 'package:flutter/material.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class HotelInputTextField extends StatelessWidget {
  HotelInputTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller});

  final String labelText;
  final String hintText;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: HotelColors.textColor,
      validator: (txt) =>
          txt!.isEmpty ? '' : null,
      
      decoration: InputDecoration(
        
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HotelColors.error.withOpacity(0.2)),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        filled: true,
        fillColor: HotelColors.textfieldColor,
        labelText: labelText,
        labelStyle: HotelStyle.text
            .copyWith(color: HotelColors.fieldTextColor, fontSize: 17),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
