import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_task/domain/bloc/bloc/hotel_bloc.dart';
import 'package:hotel_task/ui/components/custom_carousel.dart';
import 'package:hotel_task/ui/components/hotel_rating.dart';
import 'package:hotel_task/ui/components/information_button.dart';
import 'package:hotel_task/ui/components/linked_text.dart';
import 'package:hotel_task/ui/components/peculiarities.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelIsLoaded) {
          final information = state.information;
          return ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: HotelColors.backGround,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCarousel(urlImages: information.imageUrls!),
                      const SizedBox(
                        height: 16,
                      ),
                       HotelRating(rating: information.rating! , ratingtext: information.ratingName!,),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        information.name!,
                        style: HotelStyle.header,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                       LinkedText(
                        linkedText:
                            information.adress!,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            'от ${information.minimalPrice}',
                            style: HotelStyle.header.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 30),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            information.priceForIt!.toLowerCase(),
                            style: HotelStyle.text
                                .copyWith(color: HotelColors.grey),
                          ),
                        ],
                      )
                    ]),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: HotelColors.backGround,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Об отеле',
                      style: HotelStyle.header,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: information.aboutTheHotel!.peculiarities!
                            .map((e) {
                          return Peculiarities(text: e);
                        }).toList()),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      information.aboutTheHotel!.description!,
                      style: HotelStyle.text,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: HotelColors.textBackground,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          )),
                      child: const Column(
                        children: [
                          InformationButton(
                              svg: 'assets/icons/emoji-happy.svg',
                              header: 'Удобства',
                              text: 'Самое необходимое'),
                          InformationButton(
                              svg: 'assets/icons/tick-square.svg',
                              header: 'Что включено',
                              text: 'Самое необходимое'),
                          InformationButton(
                              svg: 'assets/icons/close-square.svg',
                              header: 'Что не включено',
                              text: 'Самое необходимое'),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
