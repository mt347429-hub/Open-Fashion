import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/colors.dart';
import '../core/custom_text.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.image, required this.name, required this.price, required this.descp, required this.onChanged, required this.qty});

  final String image;
  final String name;
  final int price;
  final String descp;
  final Function(int) onChanged;

  /// important
  final int qty;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {

  late int number;
  @override
  void initState() {
    number=1;
    number=widget.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.image, width: 120),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(
              text: widget.name.toUpperCase(),
              spacing: 5,
              color: AppColors.primary,
            ),
            Gap(10),
            SizedBox(
              width: size.width * 0.6,
              child: CustomText(
                text: widget.descp,
                spacing: 5,
                color: AppColors.primary,
              ),
            ),
            Gap(30),
            Row(
              children: [
                buildGestureDetector(() {
                  setState(() {
                    if (number > 1) {
                      setState(() {
                        number--;
                        widget.onChanged(number);
                      });
                    }
                  });
                }, "assets/svgs/min.svg"),
                Gap(12),
                CustomText(
                  text: "$number",
                  spacing: 4,
                  color: AppColors.primary,
                  weight: FontWeight.bold,
                ),
                Gap(12),
                buildGestureDetector(() {
                  setState(() {
                    number++;
                    widget.onChanged(number);
                  });
                }, "assets/svgs/plus.svg"),
              ],
            ),
            Gap(15),
            CustomText(text: "\$ ${widget.price}", color: Colors.red.shade200, size: 25),
          ],
        ),
      ],
    );
  }
}

GestureDetector buildGestureDetector(onTap, svg) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: SvgPicture.asset(svg, color: Colors.black),
    ),
  );
}


