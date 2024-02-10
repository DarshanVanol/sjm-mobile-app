part of 'theme.dart';

@immutable
class SmjColors extends ThemeExtension<SmjColors> {
  const SmjColors({
    required this.primary,
    required this.lightPurple,
    required this.lightOrange,
    required this.lightGrey,
    required this.white,
    required this.green,
    required this.wineRed,
    required this.blueWhite,
    required this.lightBlue,
    required this.background,
  });

  final Color primary;
  final Color lightPurple;
  final Color lightOrange;
  final Color lightBlue;
  final Color white;
  final Color green;
  final Color wineRed;
  final Color blueWhite;
  final Color lightGrey;
  final Color background;

  @override
  SmjColors copyWith() {
    // We don't use copyWith for the moment
    // Colors are not well defined enough to maintain this
    throw UnimplementedError();
  }

  @override
  ThemeExtension<SmjColors> lerp(
    ThemeExtension<SmjColors>? other,
    double t,
  ) {
    // We don't use colors lerp for the moment
    // Colors are not well defined enough to maintain this
    if (other == null) return this;
    return t < .5 ? this : other;
  }
}

SmjColors smjColorsExtension = const SmjColors(
  primary: Color(0xff111111),
  lightPurple: Color(0xffEDA7FF),
  lightOrange: Color(0xffF6BB54),
  white: Color(0xffFFFFFF),
  green: Color(0xff5CD669),
  wineRed: Color(0xffBF1E2E),
  blueWhite: Color(0xffCCE2FB),
  lightBlue: Color(0xff9D9BFF),
  background: Color(0xffF0F0F0),
  lightGrey: Color(0xff999999),
);

extension SmjColorsExtensions on ThemeData {
  SmjColors get smjBuddyColors => smjColorsExtension;
}
