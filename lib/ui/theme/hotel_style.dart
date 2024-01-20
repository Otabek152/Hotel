import 'package:flutter/material.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';


abstract class HotelStyle{
  static TextStyle header = TextStyle(color: HotelColors.textColor , fontSize: 22 , );
  static TextStyle text = TextStyle(color: HotelColors.textColor , fontSize: 16 , fontWeight: FontWeight.w400);
}