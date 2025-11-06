import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.top,
    required this.right,
    required this.left,
    required this.assetPath,
  });

  final double top;
  final double right;
  final double left;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      child: SvgPicture.asset(assetPath),
    );
  }
}
