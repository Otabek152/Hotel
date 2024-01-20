import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class InformationButton extends StatelessWidget {
  const InformationButton(
      {super.key, required this.svg, required this.header, required this.text});

  final String svg;
  final String header;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset(
            svg,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: HotelColors.grey.withOpacity(0.2), width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        header,
                        style: HotelStyle.header.copyWith(fontSize: 16),
                      ),
                      Text(
                        text,
                        style: HotelStyle.text.copyWith(
                            fontSize: 14,
                            color: HotelColors.grey,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SvgPicture.asset('assets/icons/forward.svg')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
