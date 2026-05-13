// references_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferencesSection extends StatelessWidget {
  const ReferencesSection({super.key});

  static const double _mobileBreakpoint = 768;

  final List<Map<String, dynamic>> references = const [
    {
      'name': 'Sath Rathdara',
      'title': 'Senior Software Engineering',
      'company': 'Dragonfly Fintech Plc.',
      'avatar': 'SM',
      'relationship': 'Developer',
      'quote':
          'Norn is one of the most talented Flutter developers I have had the pleasure of working with. His ability to deliver clean, scalable mobile solutions under tight deadlines is truly remarkable. He brought exceptional creativity and technical depth to every project.',
      'email': 'sath.rathdara@gamil.com',
      'linkedin': 'https://linkedin.com/in/sopheak-meas',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        return Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _buildSectionTitle(isMobile: isMobile),
              const SizedBox(height: 50),

              // ── Cards: row on desktop, column on mobile ──
              isMobile
                  ? Column(
                      children: references.asMap().entries.map((entry) {
                        final isLast = entry.key == references.length - 1;
                        return Padding(
                          padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
                          child: _ReferenceCard(
                            reference: entry.value,
                            isMobile: true,
                          ),
                        );
                      }).toList(),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: references.asMap().entries.map((entry) {
                        final index = entry.key;
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 0 : 15,
                              right: index == references.length - 1 ? 0 : 15,
                            ),
                            child: _ReferenceCard(
                              reference: entry.value,
                              isMobile: false,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

              const SizedBox(height: 50),
              _buildContactNote(isMobile: isMobile),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle({required bool isMobile}) {
    return Column(
      children: [
        Text(
          'References',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 26 : 32,
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
        const SizedBox(height: 16),
        Text(
          'People I\'ve had the privilege of working with',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 13 : 15,
            color: const Color(0xFF8892B0),
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildContactNote({required bool isMobile}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 28,
        vertical: isMobile ? 16 : 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF233554), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.circleInfo,
            color: const Color(0xFF64FFDA),
            size: isMobile ? 13 : 15,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              'Full contact details available upon request during the hiring process.',
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF8892B0),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Reference Card ────────────────────────────────────────
class _ReferenceCard extends StatefulWidget {
  final Map<String, dynamic> reference;
  final bool isMobile;

  const _ReferenceCard({required this.reference, required this.isMobile});

  @override
  State<_ReferenceCard> createState() => _ReferenceCardState();
}

class _ReferenceCardState extends State<_ReferenceCard> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ref = widget.reference;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(widget.isMobile ? 20 : 28),
        decoration: BoxDecoration(
          color: _isHovered ? const Color(0xFF112240) : const Color(0xFF0A192F),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF64FFDA)
                : const Color(0xFF233554),
            width: 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF64FFDA).withOpacity(0.08),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // ✅ shrink-wrap content
          children: [
            // ── Quote icon ──
            Icon(
              Icons.format_quote_rounded,
              color: const Color(0xFF64FFDA).withOpacity(0.5),
              size: widget.isMobile ? 26 : 32,
            ),
            const SizedBox(height: 12),

            // ── Quote text ──
            Text(
              ref['quote'] as String,
              softWrap: true,
              overflow: TextOverflow.visible, // ✅ never clip
              style: GoogleFonts.poppins(
                fontSize: widget.isMobile ? 13 : 14,
                height: 1.75,
                color: const Color(0xFF8892B0),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),

            // ── Divider ──
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF233554).withOpacity(0.0),
                    const Color(0xFF233554),
                    const Color(0xFF233554).withOpacity(0.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ── Avatar + name/title ──
            Row(
              children: [
                Container(
                  width: widget.isMobile ? 42 : 48,
                  height: widget.isMobile ? 42 : 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF64FFDA).withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF64FFDA).withOpacity(0.4),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      ref['avatar'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: widget.isMobile ? 12 : 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF64FFDA),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ref['name'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: widget.isMobile ? 14 : 15,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFCCD6F6),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        ref['title'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: widget.isMobile ? 11 : 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF64FFDA),
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        ref['company'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: widget.isMobile ? 11 : 12,
                          color: const Color(0xFF8892B0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Relationship badge + action buttons ──
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF64FFDA).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF64FFDA).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.person_outline_rounded,
                        size: 12,
                        color: Color(0xFF64FFDA),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        ref['relationship'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF64FFDA),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                _ContactButton(
                  icon: FontAwesomeIcons.linkedin,
                  tooltip: 'LinkedIn',
                  onTap: () => _launchUrl(ref['linkedin'] as String),
                ),
                const SizedBox(width: 8),
                _ContactButton(
                  icon: FontAwesomeIcons.envelope,
                  tooltip: 'Email',
                  onTap: () => _launchUrl('mailto:${ref['email']}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Contact Icon Button ───────────────────────────────────
class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: _hovered
                  ? const Color(0xFF64FFDA).withOpacity(0.15)
                  : const Color(0xFF233554),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hovered
                    ? const Color(0xFF64FFDA).withOpacity(0.6)
                    : const Color(0xFF233554),
              ),
            ),
            child: Center(
              child: FaIcon(
                widget.icon,
                size: 14,
                color: _hovered
                    ? const Color(0xFF64FFDA)
                    : const Color(0xFF8892B0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
