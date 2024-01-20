import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';

class HotelRating extends StatelessWidget {
  const HotelRating({super.key , required this.rating , required this.ratingtext});
  final int rating;
  final String ratingtext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: HotelColors.backgroundStarColor.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('assets/icons/star.svg'),
          Text(
            '${rating} ${ratingtext}',
            style: TextStyle(color: HotelColors.starColor),
          )
        ],
      ),
    );
  }
}
