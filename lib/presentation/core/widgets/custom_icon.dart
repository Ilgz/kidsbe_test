import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.iconName,  this.color,this.size=22}) : super(key: key);
  final String iconName;
  final Color? color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: size,
      width: size,
      child: SvgPicture.asset(
        "assets/images/$iconName.svg",
        fit: BoxFit.contain,
        height: double.infinity,
        width: double.infinity,
        color: color,
      ),
    );
  }
}
