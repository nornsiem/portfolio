import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfofio_web/theme/app_styles.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
      extensions: <ThemeExtension<dynamic>>[AppStyles.light],
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
      extensions: <ThemeExtension<dynamic>>[AppStyles.dark],
    );
  }
}
