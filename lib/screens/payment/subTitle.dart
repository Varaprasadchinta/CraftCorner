import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String subTitleText;

  const SubTitle({super.key, required this.subTitleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 10),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18.0,
          color: Color(0xFF808080),
        ),
      ),
    );
  }
}