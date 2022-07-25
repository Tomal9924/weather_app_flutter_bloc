import 'package:flutter/material.dart';

class ColorPalette {
  static MaterialColor get swatch => const MaterialColor(
        0xFF52B788,
        <int, Color>{
          50: Color(0xFFF8F9FA),
          100: Color(0xFFD8F3DC),
          200: Color(0xFFB7E4C7),
          300: Color(0xFF95D5B2),
          400: Color(0xFF99FFCC),
          500: Color(0xFF99FF66),
          600: Color(0xFF99FF33),
          700: Color(0xFF2D6A4F),
          800: Color(0xFF99FF00),
          900: Color(0xFF000000),
        },
      );

  static Color get accent => swatch.shade500;

  static Color get background => swatch.shade50;

  static Color get secondaryBackground => swatch.shade100;

  static Color get divider => const Color(0xFFE9ECEF);

  static Color get hint => Color(0xFF495057);

  static Color get shadow => Color(0xFFDEE2E6);

  static Color get text => swatch.shade900;

  static Color get chip => swatch.shade100;

  static Color get errorChip => Color(0xffffced7);

  static Color get error => Color(0xFFd64045);

  static Color get warning => Color(0xFFe36414);
  static Color get dark => Color(0xFF191A19);

  static TagColorPalette get tag => TagColorPalette();
  static ShimmerColorPalette get shimmer => ShimmerColorPalette();
}

class TagColorPalette {
  Color get success => Color(0xFF06d6a0);
  Color get accepted => ColorPalette.swatch.shade500;
  Color get delay => Color(0xFFe9edc9);
  Color get prepared => ColorPalette.swatch.shade500;
  Color get completed => ColorPalette.swatch.shade500;
  Color get rejected => Color(0xFFFFD4DB);
  Color get canceled => Color(0xFFC9184A);
  Color get warning => Color(0xFFffd7ba);
  Color get primary => Color(0xFFE9ECEF);
  Color get secondary => Color(0xFFDEE2E6);
}

class ShimmerColorPalette {
  Color get base => Color(0xFF06d6a0);
  Color get highlight => ColorPalette.swatch.shade400;
}
