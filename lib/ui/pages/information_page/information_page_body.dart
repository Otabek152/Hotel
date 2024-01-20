import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_task/domain/bloc/bloc/hotel_bloc.dart';
import 'package:hotel_task/ui/components/custom_carousel.dart';
import 'package:hotel_task/ui/components/peculiarities.dart';
import 'package:hotel_task/ui/pages/book_page/book_page.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class InformationPageBody extends StatelessWidget {
  const InformationPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelIsLoaded) {
          final number = state.number;
          return ListView.builder(
            itemCount: number.rooms!.length,
            itemBuilder: (context, index) {
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
                    CustomCarousel(urlImages: number.rooms![index].imageUrls!),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      number.rooms![index].name!,
                      style: HotelStyle.header,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: number.rooms![index].peculiarities!.map((e) => Peculiarities(text: e)).toList(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 210,
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: HotelColors.blueColor.withOpacity(0.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Подробнее о номере',
                              style: HotelStyle.text.copyWith(
                                  color: HotelColors.blueColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SvgPicture.asset(
                              'assets/icons/forward.svg',
                              color: HotelColors.blueColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${number.rooms![index].price!} ₽',
                          style: HotelStyle.header.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 30),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${number.rooms![index].pricePer!.toLowerCase()} ',
                          style:
                              HotelStyle.text.copyWith(color: HotelColors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FloatingActionButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          backgroundColor: HotelColors.blueColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const BookPage(),
                                ));
                          },
                          child: Text(
                            'Выбрать номер',
                            style: HotelStyle.text
                                .copyWith(color: HotelColors.backGround),
                          ),
                        ))
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
