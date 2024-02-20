import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.brandColor,
    required this.danger,
  });

  final Color? brandColor;
  final Color? danger;

  @override
  MyColors copyWith({Color? brandColor, Color? danger}) {
    return MyColors(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
}

createThemeData(Color seedColor, Brightness brightness) {
  final themeData = ThemeData(
      colorSchemeSeed: seedColor,
      brightness: brightness,
      fontFamily: GoogleFonts.mPlusRounded1c().fontFamily);
  return themeData.copyWith(
    extensions: <ThemeExtension<dynamic>>{
      const MyColors(
        brandColor: Color(0xFF1E88E5),
        danger: Color(0xFFE53935),
      ),
    },
  );
}
