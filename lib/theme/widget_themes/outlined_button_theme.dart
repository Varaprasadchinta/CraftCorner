import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class COutlinedButtonTheme{
  COutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: cSecondaryColor,
        side: BorderSide(color: cSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: cButtonHeight)
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: cWhiteColor,
        side: BorderSide(color: cWhiteColor),
        padding: EdgeInsets.symmetric(vertical: cButtonHeight)
    ),
  );
}