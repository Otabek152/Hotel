import 'package:flutter/material.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class Peculiarities extends StatelessWidget {
  const Peculiarities({super.key , required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(left: 10 ,right: 10 , top: 5,bottom: 5),
      color: HotelColors.textBackground,
      child: Text(text , style: HotelStyle.text.copyWith(color: HotelColors.grey),),
    );
  }
}