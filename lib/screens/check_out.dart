import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:master_ui3/core/colors.dart';
import 'package:master_ui3/core/custom_text.dart';
import 'package:master_ui3/screens/place_order.dart';
import 'package:master_ui3/widgets/custom_button.dart';
import 'package:master_ui3/widgets/customer_appbar.dart';

import '../widgets/cart_widget.dart';
import '../widgets/header.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.descp,
  });

  final String image;
  final String name;
  final int price;
  final String descp;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int sQuantity=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppbar(isblackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Header(title: 'Checkout'),
            CartWidget(
              image: widget.image,
              name: widget.name,
              price: widget.price,
              descp: widget.descp,
              onChanged: (v){
                setState(() {
                  sQuantity=v;
                });
              }, qty: sQuantity ,
            ),
            promo(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Est. Total", color: AppColors.primary),
                CustomText(
                  text: "\$ ${widget.price*sQuantity}",
                  color: Colors.red.shade200,
                  size: 25,
                ),
              ],
            ),
            Gap(20),
            Button(isSvgg: true, title: "Checkout", onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrder(
                  image: widget.image,
                  name: widget.name,
                  price: widget.price,
                  desp: widget.descp,
                  qty: sQuantity,
                  total: widget.price * sQuantity),));
            }),

            Gap(70),
          ],
        ),
      ),
    );
  }
}




Widget promo() {
  return Column(
    children: [
      Gap(20),
      Divider(),
      Gap(20),
      Row(
        children: [
          SvgPicture.asset("assets/svgs/promo.svg", width: 28),
          Gap(20),
          CustomText(text: "ADD Promo Code", color: AppColors.primary),
        ],
      ),
      Gap(20),
      Divider(),
      Gap(20),
      Row(
        children: [
          SvgPicture.asset("assets/svgs/delivery.svg", width: 25),
          Gap(20),
          CustomText(text: "Delivery", color: AppColors.primary),
          Spacer(),
          CustomText(text: "FREE", color: AppColors.primary),
          Gap(5),
        ],
      ),
      Gap(10),
      Divider(),
    ],
  );
}
