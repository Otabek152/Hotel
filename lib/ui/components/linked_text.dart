import 'package:flutter/material.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class LinkedText extends StatelessWidget {
  const LinkedText({super.key , required this.linkedText});
  final String linkedText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(
          linkedText,
          style: HotelStyle.text.copyWith(color: HotelColors.blueColor),
        ),
        onTap: () {});
  }
}
