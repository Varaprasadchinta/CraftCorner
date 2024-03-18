// import 'package:craft_corner/src/constants/sizes.dart';
import 'package:craft_corner/constants/sizes.dart';
import 'package:flutter/material.dart';

class CCircularIcon extends StatelessWidget {
  const CCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width,height,size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : Colors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed,icon: Icon(icon, color: color, size: size,)),
    );
  }
}