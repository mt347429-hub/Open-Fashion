import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:master_ui3/screens/check_out.dart';

import '../core/custom_text.dart';
import '../model/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: ProductModel.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.50,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        final item = ProductModel.products[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CheckOut(
                  image: item.image,
                  name: item.name,
                  price: item.price,
                  descp: item.description);
            },));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item.image),
              Gap(10),
              CustomText(text: item.name),
              CustomText(
                text: item.description,
                color: Colors.grey,
              ),
              Gap(9),
              CustomText(
                text: "\$ ${item.price.toString()}",
                color: Colors.red.shade200,
              ),
            ],
          ),
        );
      },
    );
  }
}
