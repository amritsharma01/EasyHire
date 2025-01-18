import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppTextStyles {
  /// AppText style for large body text
  static final TextStyle bodyLarge =
      GoogleFonts.roboto(fontWeight: FontWeight.w700).px20;

  //AppText style for body text
  static final TextStyle bodyMedium =
      GoogleFonts.roboto(fontWeight: FontWeight.w600).px16;

//AppText style for extrasmall body
  static final TextStyle bodySmall =
      GoogleFonts.openSans(fontWeight: FontWeight.w600).px14;
}
