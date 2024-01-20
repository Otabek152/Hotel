import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_task/ui/pages/home_page/home_page_body.dart';
import 'package:hotel_task/ui/pages/information_page/information_page.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text(
          'Отель',
          style: HotelStyle.header.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: HotelColors.textfieldColor,
      body: const HomePageBody(),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.only(left: 16 , right: 16),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FloatingActionButton(
                onPressed: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => const InformationPage(),));},
                backgroundColor: HotelColors.blueColor,
                child: Text(
                  'К выбору номера',
                  style: HotelStyle.text.copyWith(color: HotelColors.backGround),
                ),
              )),
        )
      ],
    );
  }
}
