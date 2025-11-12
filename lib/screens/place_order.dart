import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:master_ui3/core/colors.dart';
import 'package:master_ui3/core/custom_text.dart';
import 'package:master_ui3/screens/add_address.dart';
import 'package:master_ui3/screens/add_card.dart';
import 'package:master_ui3/widgets/customer_appbar.dart';
import 'package:master_ui3/widgets/header.dart';

import '../widgets/cart_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_diaolge.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.desp,
    required this.qty,
    required this.total,
  });
  final String image;
  final String name;
  final int price;
  final String desp;
  final int qty;
  final int total;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {

  late int selectedQty;
  dynamic _savedCard;
  dynamic _savedAddress;
  @override
  void initState() {
    selectedQty = widget.qty;
    super.initState();
  }


  /// edit address
  void _editAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddAddress(date: _savedAddress)),
    );

    setState(() {
      _savedAddress = newAddress;
    });
  }

  ///address
  void _openAddress() async {
    final addressDate = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddAddress()),
    );
    if (addressDate != null) {
      setState(() {
        _savedAddress = addressDate;
      });
    }
  }

  ///card
  void _openCard() async {
    final cardDate = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddCard();
        },
      ),
    );
    if (cardDate != null) {
      setState(() {
        _savedCard = cardDate;
      });
    }
  }

  /// edit card
  void _editCard() async{
   final newCard= await Navigator.push(context, MaterialPageRoute(builder: (context) => AddCard(date: _savedCard,),));
   setState(() {
     _savedCard= newCard;
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppbar(isblackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: "Checkout"),
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : CustomText(
                      text: "Shipping Address".toUpperCase(),
                      color: Colors.black38,
                      size: 20,
                    ),
              Gap(15),

              ///Address flow
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _savedAddress != null
                      ? GestureDetector(
                          onTap: _editAddress,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text:
                                        "${_savedAddress['first']} ${_savedAddress['last']}"
                                            .toUpperCase()
                                            .toUpperCase(),
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  Gap(10),
                                  CustomText(
                                    text: _savedAddress["address"]
                                        .toUpperCase(),
                                    color: Colors.black54,
                                    size: 14,
                                  ),
                                  Gap(10),
                                  CustomText(
                                    text: _savedAddress["city"].toUpperCase(),
                                    color: Colors.black54,
                                    size: 14,
                                  ),
                                  Gap(10),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: _savedAddress["state"].toUpperCase(),
                                        color: Colors.black54,
                                        size: 14,
                                      ),
                                      Gap(10),
                                      CustomText(text: "${_savedAddress["Zip"]}"
                                          .toUpperCase(),
                                        color: Colors.black54,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                  Gap(10),
                                  CustomText(
                                    text: "${_savedAddress["phone"]}"
                                        .toUpperCase(),
                                    color: Colors.black54,
                                    size: 14,
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                            ],
                          ),
                        )
                      : SizedBox.shrink(),
                  Gap(10),
                  _savedAddress == null
                      ? GestureDetector(
                          onTap: _openAddress,
                          child: buildContainer(
                            "Add shipping Address",
                            Icons.add,
                            false,
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              Gap(40),

              ///Shipping method
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : CustomText(
                      text: "Shipping Method".toUpperCase(),
                      color: Colors.black38,
                      size: 14,
                    ),
              Gap(10),
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : buildContainer(
                      "Pickup at Store",
                      Icons.keyboard_arrow_down,
                      true,
                    ),

              /// payment Method
              Gap(40),
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : CustomText(
                      text: "Payment Method".toUpperCase(),
                      color: Colors.black38,
                      size: 14,
                    ),
              Gap(10),
              _savedCard != null
                  ? Column(
                      children: [
                        Divider(color: Colors.grey.shade300),
                        Gap(20),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/Mastercard.svg",
                              width: 40,
                            ),
                            Gap(10),
                            CustomText(
                              text: "Master Card ending with",
                              color: Colors.black,
                            ),
                            Gap(10),
                            CustomText(
                              text:
                                  "••••${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
                              color: Colors.black,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: _editCard,
                                child: Icon(Icons.keyboard_arrow_right)),
                          ],
                        ),
                        Divider(color: Colors.grey.shade300),
                        Gap(20),
                      ],
                    )
                  : GestureDetector(
                      onTap: _openCard,
                      child: buildContainer(
                        "Select Payment Method",
                        Icons.keyboard_arrow_down,
                        false,
                      ),
                    ),
              _savedCard != null && _savedAddress != null
                  ? CartWidget(
                      image: widget.image,
                      name: widget.name,
                      descp: widget.desp,
                      price: widget.price,
                      qty: widget.qty,
                      onChanged: (qty) => setState(() => selectedQty = qty),
                    )
                  : SizedBox.shrink(),

              Gap(80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Total", color: AppColors.primary),
                  CustomText(
                    text: "\$ ${widget.total*selectedQty}",
                    color: Colors.red.shade200,
                    size: 25,
                  ),
                ],
              ),
              Gap(20),
              _savedCard != null && _savedAddress != null ?Button(isSvgg: true, title: "Place Order", onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(
                        child: CustomDailog(),
                      );
                    }
                );


              }):SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(text, icon, isFree) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: text, color: AppColors.primary),
          Spacer(),
          isFree
              ? CustomText(text: "Free", color: AppColors.primary)
              : SizedBox.shrink(),
          Gap(10),
          Icon(icon),
        ],
      ),
    );
  }
}
