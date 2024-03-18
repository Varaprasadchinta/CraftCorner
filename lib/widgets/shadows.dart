import 'package:flutter/material.dart';

class CShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: Colors.grey.shade900.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
      color: Colors.grey.shade900.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}