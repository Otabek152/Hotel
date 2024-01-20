import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_task/ui/pages/home_page/home_page.dart';
import 'package:hotel_task/ui/pages/payment_page/payment_page_body.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
                backgroundColor: HotelColors.blueColor,
                child: Text(
                  'Супер!',
                  style:
                      HotelStyle.text.copyWith(color: HotelColors.backGround),
                ),
              )),
        )
      ],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/arrowback.svg'),
        ),
        title: Text(
          'Заказ оплачен',
          style: HotelStyle.header.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: const PaymentPageBody(),
    );
  }
}
