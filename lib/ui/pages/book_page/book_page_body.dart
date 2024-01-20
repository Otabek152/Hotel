import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_task/domain/bloc/bloc/hotel_bloc.dart';
import 'package:hotel_task/ui/components/hotel_information_column.dart';
import 'package:hotel_task/ui/components/hotel_rating_information.dart';
import 'package:hotel_task/ui/components/information_byer.dart';
import 'package:hotel_task/ui/components/total_cost.dart';
import 'package:hotel_task/ui/components/tourists_column.dart';
import 'package:hotel_task/ui/pages/payment_page/payment_page.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class BookPageBody extends StatefulWidget {
  const BookPageBody({super.key});

  @override
  State<BookPageBody> createState() => _BookPageBodyState();
}

class _BookPageBodyState extends State<BookPageBody> {
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();

  int _counter = 2;
  @override
  void dispose() {
    _counter = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelIsLoaded) {
          final book = state.book;

          return Scaffold(
            persistentFooterButtons: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FloatingActionButton(
                      onPressed: () {
                        final form = formKey.currentState!;
                        final form1 = formKey1.currentState!;
                        form1.validate();
                        if (form.validate() && form1.validate()) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const PaymentPage(),
                              ));
                        }
                      },
                      backgroundColor: HotelColors.blueColor,
                      child: Text(
                        'Оплатить ${book.tourPrice! + book.fuelCharge! + book.serviceCharge!}',
                        style: HotelStyle.text
                            .copyWith(color: HotelColors.backGround),
                      ),
                    )),
              )
            ],
            body: BlocBuilder<HotelBloc, HotelState>(
              builder: (context, state) {
                if (state is HotelIsLoaded) {
                  final book = state.book;

                  return ListView(
                    children: [
                      HotelRatingInformation(
                        rating: book.horating!,
                        ratingtext: book.ratingName!,
                        hotelAddress: book.hotelAdress!,
                        hotelName: book.hotelName!,
                      ),
                      HotelInformationColumn(
                          arrivel: book.arrivalCountry!,
                          departure: book.departure!,
                          name: book.hotelName!,
                          numbernights: book.numberOfNights!,
                          nutrition: book.nutrition!,
                          room: book.room!,
                          tourdatestart: book.tourDateStart!,
                          tourdatestop: book.tourDateStop!),
                      Form(key: formKey, child: const InformationByer()),
                      const SizedBox(
                        height: 8,
                      ),
                      Form(
                          key: formKey1,
                          child: TouristsColumn(counter: _counter)),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: HotelColors.backGround,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Добавить туриста',
                              style: HotelStyle.header,
                            ),
                            SizedBox(
                              width: 32,
                              height: 32,
                              child: FloatingActionButton(
                                elevation: 0,
                                backgroundColor: HotelColors.blueColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                onPressed: () {
                                  setState(() {
                                    _counter += 1;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: HotelColors.backGround,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: HotelColors.backGround,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TotalCost(
                                name: 'Тур',
                                cost: book.tourPrice!,
                                style: HotelStyle.text),
                            const SizedBox(
                              height: 16,
                            ),
                            TotalCost(
                                name: 'Топливный сбор',
                                cost: book.fuelCharge!,
                                style: HotelStyle.text),
                            const SizedBox(
                              height: 16,
                            ),
                            TotalCost(
                                name: 'Сервисный сбор',
                                cost: book.serviceCharge!,
                                style: HotelStyle.text),
                            const SizedBox(
                              height: 16,
                            ),
                            TotalCost(
                                name: 'К оплате',
                                cost: book.tourPrice! +
                                    book.fuelCharge! +
                                    book.serviceCharge!,
                                style: HotelStyle.text.copyWith(
                                    color: HotelColors.blueColor,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
