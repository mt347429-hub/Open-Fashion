import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:master_ui3/core/colors.dart';

class CustomerAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomerAppbar({super.key, required this.isblackk});

  final bool isblackk;

  @override
  Widget build(BuildContext context) {
    bool isBlack=isblackk;
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
          backgroundColor: isBlack? AppColors.primary:Colors.white,
          scrolledUnderElevation: 0.0,
          leading: SvgPicture.asset("assets/svgs/Menu (2).svg",color: isBlack?Colors.white:AppColors.primary,),
          leadingWidth: 25,
          title:SvgPicture.asset("assets/logo/logo-bg.svg",color: isBlack?Colors.white:AppColors.primary,),
          centerTitle: true,
          actions: [
            SvgPicture.asset("assets/svgs/Search.svg",color: isBlack?Colors.white:AppColors.primary,),
            Gap(20),
            SvgPicture.asset("assets/svgs/shopping bag.svg",color: isBlack?Colors.white:AppColors.primary,),
          ],
        ),
      );


  }





  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
