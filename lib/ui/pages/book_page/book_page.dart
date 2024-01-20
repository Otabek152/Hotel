import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_task/ui/pages/book_page/book_page_body.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HotelColors.textfieldColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/arrowback.svg'),
        ),
        title: Text(
          'Бронирование',
          style: HotelStyle.header.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: HotelColors.backGround,
      ),
      body: const BookPageBody(),
      
    );
  }
}
