import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/custom_text.dart';
import '../model/cover_model.dart';

class CoverItem extends StatelessWidget {
  const CoverItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CoverModel.covers.length,
        itemBuilder: (context, index) {
          final item = CoverModel.covers[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(item.image, height: 350, fit: BoxFit.cover),
                Gap(10),
                CustomText(text: item.name.toUpperCase()),
              ],
            ),
          );
        },
      ),
    );
  }
}
