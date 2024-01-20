import 'package:flutter/material.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class HotelInformation extends StatelessWidget {
  const HotelInformation({super.key , required this.name , required this.info});
  final String name;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name,style: HotelStyle.text.copyWith(color: HotelColors.grey),)),
        Expanded(child: Text(info,style: HotelStyle.text,))
      ],
    );
  }
}