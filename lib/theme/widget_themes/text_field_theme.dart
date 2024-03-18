import 'package:craft_corner/constants/colors.dart';
import 'package:flutter/material.dart';

class CTextFormFieldTheme{
  CTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: cSecondaryColor,
        floatingLabelStyle: TextStyle(color: cSecondaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2,color: cSecondaryColor),
        )
      );

  static InputDecorationTheme darkInputDecorationTheme =
  const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: cPrimaryColor,
      floatingLabelStyle: TextStyle(color: cPrimaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2,color: cPrimaryColor),
      )
  );
}