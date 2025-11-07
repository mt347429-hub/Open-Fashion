import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:master_ui3/widgets/customer_appbar.dart';
import 'package:master_ui3/widgets/header.dart';

import '../widgets/custom_button.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isShow = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomerAppbar(isblackk: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: "Payment Method"),
                Gap(13),

                ///visa
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  obscureCardNumber: true,
                  isHolderNameVisible: true,
                ),

                ///form
                CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                  formKey: _key,
                ),
                Gap(80),
                Button(isSvgg: false, title: "Add Card", onTap: () {

                  if(_key.currentState!.validate()){
                    final date={
                      "number":cardNumber,
                      "name":cardHolderName,
                      "date":expiryDate,
                      "cvv":cvvCode
                    };
                    Navigator.pop(context,date);
                  }

                }),
                Gap(70),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel date) {
    setState(() {
      cardNumber = date.cardNumber;
      expiryDate = date.expiryDate;
      cardHolderName = date.cardHolderName;
      cvvCode = date.cvvCode;
      isShow = date.isCvvFocused;
    });
  }
}
