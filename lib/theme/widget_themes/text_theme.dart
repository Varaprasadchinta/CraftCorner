import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 class CTextTheme{
   static TextTheme lightTextTheme = TextTheme(
     displayMedium: GoogleFonts.montserrat(
       color: Colors.black87,
     ),
     displayLarge: GoogleFonts.montserrat(
       color: Colors.black87,
     ),
     displaySmall: GoogleFonts.montserrat(
       color: Colors.black87,
     ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 24,
     ),
     titleLarge: GoogleFonts.poppins(
       color: Colors.black54,
       fontSize: 24,
     ),
     titleMedium: GoogleFonts.poppins(
       color: Colors.black54,
       fontSize: 24,
     ),
   );
   static TextTheme darkTextTheme = TextTheme(
       displayMedium: GoogleFonts.montserrat(
         color: Colors.white70,
       ),
       displayLarge: GoogleFonts.montserrat(
         color: Colors.white70,
       ),
       displaySmall: GoogleFonts.montserrat(
         color: Colors.white70,
       ),
       titleSmall: GoogleFonts.poppins(
         color: Colors.white60,
         fontSize: 24,
       ),
       titleLarge: GoogleFonts.poppins(
         color: Colors.white60,
         fontSize: 24,
       ),
       titleMedium: GoogleFonts.poppins(
         color: Colors.white60,
         fontSize: 24,
       ),
   );
 }