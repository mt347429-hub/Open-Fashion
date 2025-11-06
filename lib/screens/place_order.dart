import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:master_ui3/core/colors.dart';
import 'package:master_ui3/core/custom_text.dart';
import 'package:master_ui3/screens/add_address.dart';
import 'package:master_ui3/widgets/customer_appbar.dart';
import 'package:master_ui3/widgets/header.dart';

import '../widgets/custom_button.dart';

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

dynamic _savedAddress;

class _PlaceOrderState extends State<PlaceOrder> {
  void _editAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddAddress(date: _savedAddress)),
    );

    setState(() {
      _savedAddress = newAddress;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppbar(isblackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(title: "Checkout"),
            CustomText(
              text: "Shipping Address".toUpperCase(),
              color: Colors.black38,
              size: 20,
            ),
            Gap(15),

            ///Address flow
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
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
                                        "${_savedAddress["first"] + _savedAddress["last"]}"
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
            ),
            Gap(40),

            ///Shipping method
            CustomText(
              text: "Shipping Method".toUpperCase(),
              color: Colors.black38,
              size: 14,
            ),
            Gap(10),
            buildContainer("Pickup at Store", Icons.keyboard_arrow_down, true),

            /// payment Method
            Gap(40),
            CustomText(
              text: "Payment Method".toUpperCase(),
              color: Colors.black38,
              size: 14,
            ),
            Gap(10),
            buildContainer(
              "Select Payment Method",
              Icons.keyboard_arrow_down,
              false,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total", color: AppColors.primary),
                CustomText(
                  text: "\$ ${widget.total}",
                  color: Colors.red.shade200,
                  size: 25,
                ),
              ],
            ),
            Gap(20),
            Button(isSvgg: true, title: "Place Order", onTap: () {}),

            Gap(70),
          ],
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
