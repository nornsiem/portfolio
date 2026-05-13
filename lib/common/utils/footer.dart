import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfofio_web/config/app_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Divider(color: Color(0xFF233554)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterIcon(FontAwesomeIcons.github, 'https://github.com/yourusername'),
              const SizedBox(width: 20),
              _buildFooterIcon(FontAwesomeIcons.linkedin, 'https://linkedin.com/in/yourusername'),
              const SizedBox(width: 20),
              _buildFooterIcon(FontAwesomeIcons.twitter, 'https://twitter.com/yourusername'),
              const SizedBox(width: 20),
              _buildFooterIcon(FontAwesomeIcons.envelope, 'mailto:your.email@example.com'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Designed & Built by ${AppConfig.profile.name}',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF8892B0),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '© ${DateTime.now().year} All Rights Reserved',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF8892B0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterIcon(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
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
          child: FaIcon(
            icon,
            color: const Color(0xFF8892B0),
            size: 18,
          ),
        ),
      ),
    );
  }
}