import 'package:flutter/cupertino.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class TotalCost extends StatelessWidget {
  const TotalCost({super.key ,  required this.name ,required this.cost , required this.style});
  final String name;
  final int cost;
  final style;
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: HotelStyle.text.copyWith(color: HotelColors.grey),
              ),
              Text(
                '${cost} ₽',
                style: style,
              )
            ],
          );
  }
}