import 'package:craft_corner/theme/widget_themes/elevated_button_theme.dart';
import 'package:craft_corner/theme/widget_themes/outlined_button_theme.dart';
import 'package:craft_corner/theme/widget_themes/text_field_theme.dart';
import 'package:craft_corner/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class CAppTheme {

  CAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme : CTextTheme.lightTextTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme

  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: CTextTheme.darkTextTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme,

  );
}