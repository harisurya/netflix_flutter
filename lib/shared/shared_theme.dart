part of 'shared.dart';

double defaultMargin = 10.0;

Color blackColor = Colors.black;
Color whiteColor = Colors.white;
Color greyColor = Colors.grey;

TextStyle blackTextFont = GoogleFonts.dmSans()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);

TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: greyColor, fontWeight: FontWeight.w500);

// TextStyle whiteNumberFont =
//     GoogleFonts.openSans().copyWith(color: Colors.white);
// TextStyle yellowNumberFont =
//     GoogleFonts.openSans().copyWith(color: accentColor2);

TextStyle blackNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.black);
