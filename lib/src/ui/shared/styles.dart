import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

// TextStyle
TextStyle poppinsPrimaryRegularTextStyle = GoogleFonts.poppins(
  color: BaseColors.primary,
  fontWeight: FontWeight.w400,
);

TextStyle poppinsPrimarySemiBoldTextStyle = GoogleFonts.poppins(
  color: BaseColors.primary,
  fontWeight: FontWeight.w600,
);

TextStyle poppinsPrimaryBoldTextStyle = GoogleFonts.poppins(
  color: BaseColors.primary,
  fontWeight: FontWeight.w700,
);

TextStyle poppinsBlackRegularTextStyle = GoogleFonts.poppins(
  color: BaseColors.black,
  fontWeight: FontWeight.w400,
);

TextStyle poppinsBlackSemiBoldTextStyle = GoogleFonts.poppins(
  color: BaseColors.black,
  fontWeight: FontWeight.w600,
);

TextStyle poppinsBlackBoldTextStyle = GoogleFonts.poppins(
  color: BaseColors.black,
  fontWeight: FontWeight.w700,
);

// Ini tidak ada font Helvetica jadi saya ubah ke Inter

TextStyle interPrimaryRegularTextStyle = GoogleFonts.inter(
  color: BaseColors.primary,
  fontWeight: FontWeight.w400,
);

TextStyle interPrimarySemiBoldTextStyle = GoogleFonts.inter(
  color: BaseColors.primary,
  fontWeight: FontWeight.w600,
);

TextStyle interPrimaryBoldTextStyle = GoogleFonts.inter(
  color: BaseColors.primary,
  fontWeight: FontWeight.w700,
);

TextStyle interBlackRegularTextStyle = GoogleFonts.inter(
  color: BaseColors.black,
  fontWeight: FontWeight.w400,
);

TextStyle interBlackSemiBoldTextStyle = GoogleFonts.inter(
  color: BaseColors.black,
  fontWeight: FontWeight.w600,
);

TextStyle interBlackBoldTextStyle = GoogleFonts.inter(
  color: BaseColors.black,
  fontWeight: FontWeight.w700,
);

BoxShadow shadow = const BoxShadow(
  color: Colors.black12,
  blurRadius: 3,
  offset: Offset(3, 5),
);

BoxShadow textShadowWhite = const BoxShadow(
  color: Colors.white,
  blurRadius: 5,
  offset: Offset(0, 2),
);

SpinKitFadingCircle loadingSpin = SpinKitFadingCircle(
  color: BaseColors.primary,
  size: 46.0,
);
