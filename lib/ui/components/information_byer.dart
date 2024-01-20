import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:hotel_task/ui/theme/hotel_style.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InformationByer extends StatelessWidget {
  const InformationByer({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController number = TextEditingController();
    TextEditingController email = TextEditingController();
    var musk = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
    );
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
          Text(
            'Информация о покупателе',
            style: HotelStyle.header,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller:number,
            inputFormatters: [musk],
            validator: (num) => num!.length < 18 ? '' : null,
            cursorColor: HotelColors.textColor,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: HotelColors.error.withOpacity(0.2)),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              filled: true,
              fillColor: HotelColors.textfieldColor,
              labelText: 'Номер телефона',
              labelStyle: HotelStyle.text
                  .copyWith(color: HotelColors.fieldTextColor, fontSize: 17),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: email,
            validator: (eml) =>
                eml != null && !EmailValidator.validate(eml) ? '' : null,
            cursorColor: HotelColors.textColor,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (value) =>
                !EmailValidator.validate(value) ? '' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: HotelColors.error.withOpacity(0.2)),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              filled: true,
              fillColor: HotelColors.textfieldColor,
              labelText: 'Почта',
              labelStyle: HotelStyle.text
                  .copyWith(color: HotelColors.fieldTextColor, fontSize: 17),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
            style:
                HotelStyle.text.copyWith(color: HotelColors.grey, fontSize: 14),
          )
        ],
      ),
    );
  }
}
