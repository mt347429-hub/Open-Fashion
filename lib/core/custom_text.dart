import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.white,
    this.weight = FontWeight.normal,
    this.max=1,
    this.spacing=1,
    this.height=1,
  });

  final String text;
  final double size;
  final Color color;
  final int max;
  final double height;
  final double spacing;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: max,
      text,
      style: TextStyle(
        letterSpacing: spacing,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
        overflow: TextOverflow.ellipsis,
        fontFamily: "TenorSans",
      ),
    );
  }
}
