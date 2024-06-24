import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xFFEF9F27);
Color secondaryColor = const Color(0xFF172B4D);
Color thirdColor = const Color(0xFF7A869A);
Color white = const Color(0xFFFFFFFF);
Color blackColor = Colors.black;
Color darkGrey = Colors.grey;
Color grey = const Color(0XFFEBECF0);
Color redColor = Colors.red;

// Fonts Used --------------------------------------------------------------------------
var arFont = GoogleFonts.inter(
    fontSize: largeTextSize, color: primaryColor, fontWeight: mainFontWeight);

var compFont = GoogleFonts.inter();

// Titles and MainButtons
const mainFontSize = 30.0;
const FontWeight mainFontWeight = FontWeight.bold;

// subTitles and subButtons
const subFontSize = 21.0;
const FontWeight subFontWeight = FontWeight.bold;

// Common writing text
const commonTextSize = 18.0;
const FontWeight commonTextWeight =
    FontWeight.w700; // or regular font (no weights used)

// Tiny text (sub texts)
const tinyTextSize = 15.0;
const FontWeight tinyTextWeight =
    FontWeight.w700; // or regular font (no weights used)

const extraTinyTextSize = 12.0;
const FontWeight extraTinyTextWeight =
    FontWeight.w500; // or regular font (no weights used)
// Special cases - extra large text
const largeTextSize = 27.0;

// Special cases - extra large text
const extraLargeTextSize = 30.0; // only used as regular font (no weights)

// Fonts New -------------------------------------------------------------------

const fTitleLarge = 28.0;
const fTitleMedium = 22.0;
const fTitleSmall = 18.0;

const fBodyLarge = 15.0;
const fBodyMedium = 12.0;
const fBodySmall = 10.0;

// Paddings Used -------------------------------------------------------------------------
const emptyScreenSecondaryPadding = 20.0;
const p51 = 51.0;
const p44 = 44.0;
const p32 = 32.0;
const p23 = 23.0;
const p16 = 16.0;
const p12 = 12.0;
const p7 = 7.0;

double constHorizontalPadding = 15.w;
double constVerticalPadding = 20.h;

// Button Sizes Used ---------------------------------------------------------------------
const mainButtonsSize = 60.0;
const commonButtonSize = 50.0;
const mediumButtonSize = 45.0;

// text form field ---------------------------------------------------------------

int maxLength = 25;

// animated container border color
const durationTime = 200;
// const addressListLength = 3;

const gridViewCrossAxisCount = 3;

int shopsNumber = 10;

const String imagePath = "assets/images";
const String iconsPath = "assets/icons";
