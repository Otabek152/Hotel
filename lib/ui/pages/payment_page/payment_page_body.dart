import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class PaymentPageBody extends StatelessWidget {
  const PaymentPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
     
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/congr.png'),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Ваш заказ принят в работу',
              style: HotelStyle.header,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Подтверждение заказа №${Random().nextInt(10000000)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
              style: HotelStyle.text.copyWith(color: HotelColors.grey),
            )
          ],
        ),
      ),
    );
  }
}
