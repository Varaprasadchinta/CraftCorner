import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class CElevatedButtonTheme{
  CElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(),
        foregroundColor: cWhiteColor,
        backgroundColor: cSecondaryColor,
        side: BorderSide(color: cSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: cButtonHeight)
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(),
        foregroundColor: cSecondaryColor,
        backgroundColor: cWhiteColor,
        side: BorderSide(color: cSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: cButtonHeight)
    ),
  );
}