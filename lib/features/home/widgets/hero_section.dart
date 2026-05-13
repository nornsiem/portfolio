import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfofio_web/common/constants/global_constants.dart';
import 'package:my_portfofio_web/config/app_config.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  static const double _mobileBreakpoint = 768;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        return Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ).copyWith(top: AppConstants.appBarHeight + 32, bottom: 32),
          child: isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        );
      },
    );
  }

  // ── Desktop: text left, socials right ────────────────────
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: _buildTextContent(context, isMobile: false)),
        Expanded(flex: 1, child: _buildSocialColumn()),
      ],
    );
  }

  // ── Mobile: text centered, socials in a row below ─────────
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextContent(context, isMobile: true),
        const SizedBox(height: 40),
        _buildSocialRow(),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, {required bool isMobile}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I'm",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 15 : 18,
            color: const Color(0xFF64FFDA),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${AppConfig.profile.name},\na ${AppConfig.profile.title}',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 38 : 72,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFCCD6F6),
            height: 1.1,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: isMobile ? double.infinity : 500,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer | UX/UI Designer | Full-Stack Developer',
                textStyle: GoogleFonts.poppins(
                  fontSize: isMobile ? 13 : 16,
                  color: const Color(0xFF8892B0),
                ),
                speed: const Duration(milliseconds: 50),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        const SizedBox(height: 40),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async {
              final Uri emailUri = Uri(
                scheme: 'mailto',
                path: AppConfig.contact.email,
              );
              if (await canLaunchUrl(emailUri)) {
                await launchUrl(emailUri);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 30,
                vertical: isMobile ? 12 : 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF64FFDA), width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Get In Touch',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFF64FFDA),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Desktop: vertical column on the right ────────────────
  Widget _buildSocialColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildSocialIcon(FontAwesomeIcons.github, AppConfig.contact.github),
        const SizedBox(height: 20),
        _buildSocialIcon(FontAwesomeIcons.linkedin, AppConfig.contact.linkedin),
        const SizedBox(height: 20),
        _buildSocialIcon(
          FontAwesomeIcons.twitter,
          'https://twitter.com/yourusername',
        ),
        const SizedBox(height: 20),
        _buildSocialIcon(FontAwesomeIcons.telegram, 'https://t.me/siem_n'),
      ],
    );
  }

  // ── Mobile: horizontal row below the text ────────────────
  Widget _buildSocialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSocialIcon(
          FontAwesomeIcons.github,
          'https://github.com/yourusername',
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          FontAwesomeIcons.linkedin,
          'https://linkedin.com/in/yourusername',
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          FontAwesomeIcons.twitter,
          'https://twitter.com/yourusername',
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(FontAwesomeIcons.telegram, 'https://t.me/siem_n'),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF64FFDA).withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FaIcon(icon, color: const Color(0xFF8892B0), size: 20),
        ),
      ),
    );
  }
}
