// skills_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const double _mobileBreakpoint = 768;

  static final List<Map<String, dynamic>> skills = [
    {
      'category': 'Mobile Development',
      'skills': [
        {'name': 'Flutter', 'icon': FontAwesomeIcons.flutter, 'level': 95},
        {'name': 'Dart', 'icon': FontAwesomeIcons.code, 'level': 90},
        {
          'name': 'Android Java/Kotlin',
          'icon': FontAwesomeIcons.android,
          'level': 70,
        },
      ],
    },
    {
      'category': 'Web Development',
      'skills': [
        {'name': 'React.js', 'icon': FontAwesomeIcons.react, 'level': 85},
        {'name': 'HTML/CSS', 'icon': FontAwesomeIcons.html5, 'level': 80},
        {'name': 'Node.js', 'icon': FontAwesomeIcons.nodeJs, 'level': 82},
      ],
    },
    {
      'category': 'Backend Development',
      'skills': [
        {
          'name': 'Java Spring Boot',
          'icon': FontAwesomeIcons.java,
          'level': 88,
        },
        {'name': 'REST APIs', 'icon': FontAwesomeIcons.server, 'level': 85},
        {'name': 'PostgreSQL', 'icon': FontAwesomeIcons.database, 'level': 83},
      ],
    },
    {
      'category': 'Design',
      'skills': [
        {'name': 'UX/UI Design', 'icon': FontAwesomeIcons.figma, 'level': 85},
        {
          'name': 'Prototyping',
          'icon': FontAwesomeIcons.paintbrush,
          'level': 85,
        },
        {'name': 'Adobe XD', 'icon': FontAwesomeIcons.penToSquare, 'level': 78},
      ],
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: _gridDelegate(context),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return _SkillCard(
                    category: skills[index],
                    isMobile: isMobile,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _gridDelegate(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 16 / 9,
      );
    } else {
      return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 16 / 9,
      );
    }
  }

  Widget _buildSectionTitle({required bool isMobile}) {
    return Column(
      children: [
        Text(
          'Skills & Expertise',
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
      ],
    );
  }
}

// ── Skill Card ────────────────────────────────────────────
class _SkillCard extends StatefulWidget {
  final Map<String, dynamic> category;
  final bool isMobile;

  const _SkillCard({required this.category, required this.isMobile});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  IconData get _categoryIcon {
    switch (widget.category['category'] as String) {
      case 'Mobile Development':
        return FontAwesomeIcons.mobile;
      case 'Web Development':
        return FontAwesomeIcons.globe;
      case 'Backend Development':
        return FontAwesomeIcons.server;
      default:
        return FontAwesomeIcons.penNib;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(widget.isMobile ? 20 : 24),
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
          children: [
            // ── Category header ──
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF64FFDA).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF64FFDA).withOpacity(0.3),
                    ),
                  ),
                  child: FaIcon(
                    _categoryIcon,
                    color: const Color(0xFF64FFDA),
                    size: widget.isMobile ? 14 : 16,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.category['category'] as String,
                    style: GoogleFonts.poppins(
                      fontSize: widget.isMobile ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFCCD6F6),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.isMobile ? 16 : 20),

            // ── Skill items ──
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (widget.category['skills'] as List).length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: widget.isMobile ? 12 : 16),
                itemBuilder: (context, index) {
                  final skill =
                      (widget.category['skills'] as List)[index]
                          as Map<String, dynamic>;
                  return _buildSkillItem(skill);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillItem(Map<String, dynamic> skill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FaIcon(
                  skill['icon'] as IconData,
                  color: const Color(0xFF64FFDA),
                  size: widget.isMobile ? 12 : 14,
                ),
                const SizedBox(width: 8),
                Text(
                  skill['name'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: widget.isMobile ? 13 : 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFCCD6F6),
                  ),
                ),
              ],
            ),
            // Level badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF64FFDA).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF64FFDA).withOpacity(0.3),
                ),
              ),
              child: Text(
                '${skill['level']}%',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF64FFDA),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // ── Progress bar ──
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: (skill['level'] as int) / 100),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOut,
          builder: (context, value, _) {
            return Stack(
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF233554),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: value,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF64FFDA), Color(0xFF48BFE3)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF64FFDA).withOpacity(0.4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
