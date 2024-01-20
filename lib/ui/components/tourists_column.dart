import 'package:flutter/material.dart';
import 'package:hotel_task/ui/components/hotel_input_textfield.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';

class TouristsColumn extends StatefulWidget {
  const TouristsColumn({super.key, required this.counter });
  final int counter;
  @override
  State<TouristsColumn> createState() => _TouristsColumnState();
}

class _TouristsColumnState extends State<TouristsColumn> {
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController citizen = TextEditingController();
  TextEditingController citizennumber = TextEditingController();
  TextEditingController expire = TextEditingController();
  List tourists = [
    'Первый',
    'Второй',
    'Третий',
    'Четвертый',
    'Пятый',
    'Шестой',
    'Седьмой',
    'Восьмой',
    'Девятый',
    'Десятый'
  ];

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HotelColors.backGround,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: ExpansionTile(
              shape: const OutlineInputBorder(borderSide: BorderSide.none),
              tilePadding: const EdgeInsets.all(0),
              childrenPadding: const EdgeInsets.all(0),
              title: Text(
                '${widget.counter <= 10 ? tourists[index] : index + 1}  турист',
                style: HotelStyle.header,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: HotelInputTextField(
                      hintText: 'Имя', labelText: 'Имя', controller: name),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: HotelInputTextField(
                      hintText: 'Фамилия',
                      labelText: 'Фамилия',
                      controller: lastname),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: HotelInputTextField(
                      hintText: 'Дата рождения',
                      labelText: 'Дата рождения',
                      controller: date),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: HotelInputTextField(
                      hintText: 'Гражданство',
                      labelText: 'Гражданство',
                      controller: citizen),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: HotelInputTextField(
                      hintText: 'Номер загранпаспорта',
                      labelText: 'Номер загранпаспорта',
                      controller: citizennumber),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: HotelInputTextField(
                      hintText: 'Срок действия загранпаспорта',
                      labelText: 'Срок действия загранпаспорта',
                      controller: expire),
                ),
              ],
            ));
      },
      itemCount: widget.counter,
    );
  }
}
