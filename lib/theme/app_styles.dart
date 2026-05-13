import 'package:flutter/material.dart';

@immutable
class AppStyles extends ThemeExtension<AppStyles> {
  // Typography
  final TextStyle hero;
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle bodyLarge;
  final TextStyle body;
  final TextStyle bodySmall;
  final TextStyle button;
  final TextStyle caption;
  final TextStyle overline;
  final TextStyle navItem;
  final TextStyle skillLabel;
  final TextStyle code;

  const AppStyles({
    required this.hero,
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headline,
    required this.title,
    required this.subtitle,
    required this.bodyLarge,
    required this.body,
    required this.bodySmall,
    required this.button,
    required this.caption,
    required this.overline,
    required this.navItem,
    required this.skillLabel,
    required this.code,
  });

  @override
  AppStyles copyWith({
    TextStyle? hero,
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headline,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? bodyLarge,
    TextStyle? body,
    TextStyle? bodySmall,
    TextStyle? button,
    TextStyle? caption,
    TextStyle? overline,
    TextStyle? navItem,
    TextStyle? skillLabel,
    TextStyle? code,
  }) {
    return AppStyles(
      hero: hero ?? this.hero,
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headline: headline ?? this.headline,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      body: body ?? this.body,
      bodySmall: bodySmall ?? this.bodySmall,
      button: button ?? this.button,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
      navItem: navItem ?? this.navItem,
      skillLabel: skillLabel ?? this.skillLabel,
      code: code ?? this.code,
    );
  }

  @override
  AppStyles lerp(ThemeExtension<AppStyles>? other, double t) {
    if (other is! AppStyles) return this;
    return AppStyles(
      hero: TextStyle.lerp(hero, other.hero, t)!,
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      headline: TextStyle.lerp(headline, other.headline, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      overline: TextStyle.lerp(overline, other.overline, t)!,
      navItem: TextStyle.lerp(navItem, other.navItem, t)!,
      skillLabel: TextStyle.lerp(skillLabel, other.skillLabel, t)!,
      code: TextStyle.lerp(code, other.code, t)!,
    );
  }

  // Light Theme Styles
  static const light = AppStyles(
    hero: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A2E),
      height: 1.1,
      letterSpacing: -1.5,
    ),
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A2E),
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A2E),
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A2E),
    ),
    headline: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A2E),
    ),
    title: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A2E),
    ),
    subtitle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF666666),
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Color(0xFF333333),
      height: 1.6,
    ),
    body: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFF333333),
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFF666666),
    ),
    button: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      letterSpacing: 0.5,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xFF999999),
    ),
    overline: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: Color(0xFF666666),
      letterSpacing: 1.5,
    ),
    navItem: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xFF666666),
    ),
    skillLabel: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF1A1A2E),
    ),
    code: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFFE91E63),
      fontFamily: 'monospace',
    ),
  );

  // Dark Theme Styles (Your Portfolio Theme)
  static const dark = AppStyles(
    hero: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
      color: Color(0xFFCCD6F6),
      height: 1.1,
      letterSpacing: -1.5,
    ),
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Color(0xFFCCD6F6),
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFFCCD6F6),
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFFCCD6F6),
    ),
    headline: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFFCCD6F6),
    ),
    title: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFFCCD6F6),
    ),
    subtitle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF64FFDA),
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Color(0xFF8892B0),
      height: 1.6,
    ),
    body: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFF8892B0),
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFF8892B0),
    ),
    button: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF0A192F),
      letterSpacing: 0.5,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xFF8892B0),
    ),
    overline: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: Color(0xFF64FFDA),
      letterSpacing: 1.5,
    ),
    navItem: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFF8892B0),
    ),
    skillLabel: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFFCCD6F6),
    ),
    code: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFF64FFDA),
      fontFamily: 'monospace',
    ),
  );
}

// Extension for easy access
extension AppStylesExtension on ThemeData {
  AppStyles get appStyles => extension<AppStyles>()!;
}
