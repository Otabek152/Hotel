import 'package:flutter/material.dart';
import 'package:hotel_task/ui/components/hotel_rating.dart';
import 'package:hotel_task/ui/components/linked_text.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class HotelRatingInformation extends StatelessWidget {
  const HotelRatingInformation({super.key , required this.rating,required this.ratingtext , required this.hotelAddress , required this.hotelName});
  final int rating;
  final String ratingtext , hotelName , hotelAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: HotelColors.backGround,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelRating(rating: rating , ratingtext: ratingtext),
          const SizedBox(
            height: 8,
          ),
          Text(
            hotelName,
            style: HotelStyle.header,
          ),
          const SizedBox(
            height: 8,
          ),
           LinkedText(
              linkedText: hotelAddress)
        ],
      ),
    );
  }
}
