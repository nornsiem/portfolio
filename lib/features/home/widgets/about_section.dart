import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfofio_web/common/constants/global_constants.dart';
import 'package:my_portfofio_web/config/app_config.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const double _mobileBreakpoint = 768;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        return Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        );
      },
    );
  }

  // ── Desktop: image on the right ──────────────────────────
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildTextContent()),
        const SizedBox(width: 50),
        Expanded(flex: 2, child: _buildProfileImage(height: 350)),
      ],
    );
  }

  // ── Mobile: image on top, text below ─────────────────────
  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('About Me'),
        const SizedBox(height: 24),
        _buildProfileImage(height: 260),
        const SizedBox(height: 28),
        _buildTextContent(showTitle: false),
      ],
    );
  }

  Widget _buildTextContent({bool showTitle = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) ...[
          _buildSectionTitle('About Me'),
          const SizedBox(height: 30),
        ],
        Text(
          'Hello! I\'m Siem, a passionate developer with 4 years of experience in Flutter and Dart. '
          'I specialize in creating beautiful, performant mobile and web applications that solve real-world problems.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF8892B0),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'My journey in tech started with UX/UI design, which gave me a deep appreciation for user-centered development. '
          'This led me to full-stack development with Java Spring Boot and React.js, and eventually to my true passion - Flutter.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF8892B0),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Here are a few technologies I\'ve been working with recently:',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFFCCD6F6),
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 40,
          runSpacing: 10,
          children: [
            _buildTechItem('Flutter & Dart'),
            _buildTechItem('UX/UI Design'),
            _buildTechItem('Java Spring Boot'),
            _buildTechItem('React.js'),
            _buildTechItem('Firebase'),
            _buildTechItem('REST APIs'),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage({required double height}) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: AppConstants.gredients,
        image: const DecorationImage(
          image: AssetImage('assets/images/profile-image-01.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTechItem(String tech) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.play_arrow, color: Color(0xFF64FFDA), size: 12),
        const SizedBox(width: 8),
        Text(
          tech,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF8892B0),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFCCD6F6),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF64FFDA), Color(0xFF48BFE3)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
