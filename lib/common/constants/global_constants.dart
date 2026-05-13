// lib/config/app_constants.dart

class AppConstants {
  AppConstants._(); // prevent instantiation

  // ── Layout ─────────────────────────────────────────────
  static const double appBarHeight       = 72.0;
  static const double maxContentWidth    = 1200.0;
  static const double mobileBreakpoint   = 768.0;
  static const double tabletBreakpoint   = 1024.0;

  // ── Spacing ────────────────────────────────────────────
  static const double paddingMobile      = 24.0;
  static const double paddingDesktop     = 48.0;
  static const double sectionSpacing     = 32.0;
  static const double cardPaddingMobile  = 20.0;
  static const double cardPaddingDesktop = 28.0;

  // ── Timeline ───────────────────────────────────────────
  static const double timelineDotSize       = 14.0;
  static const double timelineDotSizeMobile = 12.0;
  static const double timelineWidth         = 40.0;
  static const double timelineWidthMobile   = 28.0;
  static const double timelineConnectorH    = 600.0;

  // ── Font sizes ─────────────────────────────────────────
  static const double fontSectionTitle        = 32.0;
  static const double fontSectionTitleMobile  = 26.0;
  static const double fontCardTitle           = 22.0;
  static const double fontCardTitleMobile     = 18.0;
  static const double fontBody                = 14.0;
  static const double fontBodyMobile          = 13.0;
  static const double fontSmall               = 12.0;
  static const double fontXSmall             = 11.0;

  // ── Border radius ──────────────────────────────────────
  static const double radiusCard    = 12.0;
  static const double radiusBadge   = 20.0;
  static const double radiusButton  = 8.0;

  // ── Colors ─────────────────────────────────────────────
  static const int colorBackground     = 0xFF0A192F;
  static const int colorSurface        = 0xFF112240;
  static const int colorBorder         = 0xFF233554;
  static const int colorAccent         = 0xFF64FFDA;
  static const int colorAccentSecond   = 0xFF48BFE3;
  static const int colorTextPrimary    = 0xFFCCD6F6;
  static const int colorTextSecondary  = 0xFF8892B0;

  // ── Animation ──────────────────────────────────────────
  static const Duration animFast    = Duration(milliseconds: 200);
  static const Duration animNormal  = Duration(milliseconds: 250);
  static const Duration animSlow    = Duration(milliseconds: 1000);
}