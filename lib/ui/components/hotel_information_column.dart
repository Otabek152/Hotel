import 'package:flutter/material.dart';
import 'package:hotel_task/ui/components/hotel_information.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';

class HotelInformationColumn extends StatelessWidget {
  const HotelInformationColumn({super.key , required this.arrivel , required this.departure , required this.name , required this.numbernights , required this.room , required this.tourdatestart , required this.tourdatestop , required this.nutrition});
  final String departure,arrivel,tourdatestart,tourdatestop,room,name , nutrition;
  final int numbernights; 
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 300,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: HotelColors.backGround,
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HotelInformation(
                name: 'Вылет из',
                info: departure,
              ),
              HotelInformation(
                name: 'Страна, город',
                info: arrivel,
              ),
              HotelInformation(
                name: 'Даты',
                info: '${tourdatestart} - ${tourdatestop}',
              ),
              HotelInformation(
                name: 'Кол-во ночей',
                info: '${numbernights} ночей',
              ),
              HotelInformation(
                name: 'Отель',
                info: name,
              ),
              HotelInformation(
                name: 'Номер',
                info: room,
              ),
              HotelInformation(
                name: 'Питание',
                info: nutrition,
              ),
            ],
          ),
        );
  }
}