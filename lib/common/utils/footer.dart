import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfofio_web/config/app_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  static const String _sourceCodeUrl = 'https://github.com/nornsiem/portfolio';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Divider(color: Color(0xFF233554)),
          const SizedBox(height: 20),

          // ── Social icons ──────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterIcon(FontAwesomeIcons.github, AppConfig.contact.github),
              const SizedBox(width: 20),
              _buildFooterIcon(FontAwesomeIcons.linkedin, AppConfig.contact.linkedin),
              const SizedBox(width: 20),
              _buildFooterIcon(FontAwesomeIcons.telegram, AppConfig.contact.telegram),
              const SizedBox(width: 20),
              _buildFooterIcon(FontAwesomeIcons.envelope, AppConfig.contact.email),
            ],
          ),
          const SizedBox(height: 20),

          // ── Built by ──────────────────────────────────
          Text(
            'Designed & Built by ${AppConfig.profile.name}',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF8892B0),
            ),
          ),
          const SizedBox(height: 12),

          // ── Source code link ──────────────────────────
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                final uri = Uri.parse(_sourceCodeUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF64FFDA).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF64FFDA).withOpacity(0.25),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.github,
                      size: 13,
                      color: const Color(0xFF64FFDA).withOpacity(0.8),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'View Source Code',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF64FFDA).withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── Copyright ─────────────────────────────────
          Text(
            '© ${DateTime.now().year} All Rights Reserved',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF8892B0),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildFooterIcon(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF64FFDA).withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: FaIcon(icon, color: const Color(0xFF8892B0), size: 18),
        ),
      ),
    );
  }
}