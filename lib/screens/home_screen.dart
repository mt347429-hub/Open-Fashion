import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:master_ui3/core/colors.dart';
import 'package:master_ui3/core/custom_text.dart';
import 'package:master_ui3/widgets/text_widget.dart';
import '../widgets/about_widget.dart';
import '../widgets/cover_item.dart';
import '../widgets/customer_appbar.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomerAppbar(isblackk: true),
      body: Stack(
        children: [
          ///texts
          const TextWidget(
            top: 10,
            right: 0,
            left: 0,
            assetPath: "assets/texts/10.svg",
          ),
          const TextWidget(
            top: 40,
            right: 0,
            left: 0,
            assetPath: "assets/texts/October.svg",
          ),
          const TextWidget(
            top: 85,
            right: 0,
            left: 0,
            assetPath: "assets/texts/Collection.svg",
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Gap(130),
                  Image.asset("assets/cover/cover1.png"),
                  Gap(20),
                  ///Gridview
                  ProductItem(),
                  Gap(10),
                  CustomText(text: "You may also like".toUpperCase(), size: 26),
                  Gap(10),
                  Image.asset("assets/svgs/line.png", width: 190),
                  Gap(10),
                  ///covers
                  CoverItem(),
                  ///About
                  AboutWidget(),
                  Gap(15),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.grey.shade700,
                    child: CustomText(
                      text: "Copyright© OpenUI All Rights Reserved",
                    ),
                  ),
                  Gap(100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
