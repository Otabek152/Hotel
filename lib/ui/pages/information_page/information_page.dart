import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_task/ui/pages/information_page/information_page_body.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HotelColors.textfieldColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);} , icon: SvgPicture.asset('assets/icons/arrowback.svg'),),
        title: Text('Steigenberger Makadi' , style: HotelStyle.header.copyWith(fontSize: 18),),
        centerTitle: true,
        backgroundColor: HotelColors.backGround,
      ),
      body: const InformationPageBody(),
    );
  }
}