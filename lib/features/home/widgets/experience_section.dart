// work_experience_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfofio_web/models/work_experience_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const double _mobileBreakpoint = 768;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        return Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionTitle(isMobile: isMobile),
              const SizedBox(height: 50),
              ...experienceList.asMap().entries.map((entry) {
                final index = entry.key;
                final exp = entry.value;
                final isLast = index == experienceList.length - 1;
                return _WorkExperienceTimelineItem(
                  exp: exp,
                  isLast: isLast,
                  isMobile: isMobile,
                );
              }),
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
          'Work Experience',
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

// ── Timeline Item ─────────────────────────────────────────
class _WorkExperienceTimelineItem extends StatefulWidget {
  final WorkExperienceModel exp;
  final bool isLast;
  final bool isMobile;

  const _WorkExperienceTimelineItem({
    required this.exp,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<_WorkExperienceTimelineItem> createState() =>
      _WorkExperienceTimelineItemState();
}

class _WorkExperienceTimelineItemState
    extends State<_WorkExperienceTimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // ✅ Plain Row — no IntrinsicHeight
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Timeline dot + line ──
        SizedBox(
          width: widget.isMobile ? 28 : 40,
          child: Column(
            children: [
              Container(
                width: widget.isMobile ? 12 : 14,
                height: widget.isMobile ? 12 : 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.exp.isCurrent
                      ? const Color(0xFF64FFDA)
                      : const Color(0xFF48BFE3),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFF64FFDA,
                      ).withOpacity(widget.exp.isCurrent ? 0.5 : 0.2),
                      blurRadius: widget.exp.isCurrent ? 12 : 8,
                      spreadRadius: widget.exp.isCurrent ? 3 : 2,
                    ),
                  ],
                ),
              ),
              // ✅ Fixed height connector instead of Expanded
              if (!widget.isLast)
                Container(
                  width: 2,
                  height: 600,
                  color: const Color(0xFF233554),
                ),
            ],
          ),
        ),

        SizedBox(width: widget.isMobile ? 16 : 24),

        // ── Card ──
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: widget.isMobile ? 28 : 40),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(widget.isMobile ? 20 : 28),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? const Color(0xFF112240)
                      : const Color(0xFF0A192F),
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
                    widget.isMobile
                        ? _buildBadgesMobile()
                        : _buildBadgesDesktop(),

                    const SizedBox(height: 16),

                    // ── Role title ──
                    Text(
                      widget.exp.role,
                      style: GoogleFonts.poppins(
                        fontSize: widget.isMobile ? 18 : 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFCCD6F6),
                      ),
                    ),
                    const SizedBox(height: 6),

                    widget.isMobile
                        ? _buildCompanyLocationMobile()
                        : _buildCompanyLocationDesktop(),

                    const SizedBox(height: 16),

                    // ── Responsibilities ──
                    ...widget.exp.responsibilities.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 7),
                              child: Icon(
                                Icons.arrow_right_rounded,
                                size: 18,
                                color: Color(0xFF64FFDA),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                item,
                                softWrap: true,
                                overflow: TextOverflow.visible, // ✅ never clip
                                style: GoogleFonts.poppins(
                                  fontSize: widget.isMobile ? 13 : 14,
                                  color: const Color(0xFF8892B0),
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── Tech tags ──
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.exp.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF64FFDA).withOpacity(0.08),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFF64FFDA).withOpacity(0.25),
                            ),
                          ),
                          child: Text(
                            tag,
                            style: GoogleFonts.poppins(
                              fontSize: widget.isMobile ? 11 : 12,
                              color: const Color(0xFF64FFDA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Desktop: period left, type + current badge right ─────
  Widget _buildBadgesDesktop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _periodBadge(),
        Row(
          children: [
            _typeBadge(),
            if (widget.exp.isCurrent) ...[
              const SizedBox(width: 8),
              _currentBadge(),
            ],
          ],
        ),
      ],
    );
  }

  // ── Mobile: period on top, type + current on second row ──
  Widget _buildBadgesMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _periodBadge(),
        const SizedBox(height: 8),
        Row(
          children: [
            _typeBadge(),
            if (widget.exp.isCurrent) ...[
              const SizedBox(width: 8),
              _currentBadge(),
            ],
          ],
        ),
      ],
    );
  }

  Widget _periodBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF64FFDA).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF64FFDA).withOpacity(0.3)),
      ),
      child: Text(
        widget.exp.period,
        style: GoogleFonts.poppins(
          fontSize: widget.isMobile ? 12 : 13,
          color: const Color(0xFF64FFDA),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _typeBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF233554),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        widget.exp.employmentType,
        style: GoogleFonts.poppins(
          fontSize: widget.isMobile ? 11 : 12,
          color: const Color(0xFF8892B0),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _currentBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF64FFDA).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF64FFDA).withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF64FFDA),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            'Current',
            style: GoogleFonts.poppins(
              fontSize: widget.isMobile ? 11 : 12,
              color: const Color(0xFF64FFDA),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ── Desktop: company and location in one row ──────────────
  Widget _buildCompanyLocationDesktop() {
    return Row(
      children: [
        Text(
          widget.exp.company,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: const Color(0xFF64FFDA),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
        const Icon(
          Icons.location_on_outlined,
          size: 14,
          color: Color(0xFF8892B0),
        ),
        const SizedBox(width: 4),
        Text(
          widget.exp.location,
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: const Color(0xFF8892B0),
          ),
        ),
      ],
    );
  }

  // ── Mobile: company and location stacked ─────────────────
  Widget _buildCompanyLocationMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.exp.company,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF64FFDA),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 13,
              color: Color(0xFF8892B0),
            ),
            const SizedBox(width: 4),
            Text(
              widget.exp.location,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xFF8892B0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const List<WorkExperienceModel> experienceList = [
  WorkExperienceModel(
    role: 'Software Developer',
    company: 'Dragonfly Fintech',
    location: 'Phnom Penh, Cambodia',
    period: 'April 2022 – Present',
    employmentType: 'Full-time',
    isCurrent: true,
    responsibilities: [
      'Designed, developed, and implemented software applications for websites based on analyzed requirements and industry technical standards.',
      'Troubleshot and debugged applications to ensure optimal performance and user experience.',
      'Collaborated across all stages of the systems development lifecycle from requirement gathering to production releases.',
      'Developed and implemented efficient, high-quality mobile applications using the Flutter framework.',
      'Built responsive web applications using Flutter, WordPress, React.js, and Vue.js, ensuring consistent design and smooth performance.',
      'Wrote clean, maintainable, and reusable code following best practices and industry standards.',
      'Collaborated with UI/UX designers to create visually appealing and user-friendly interfaces.',
      'Worked with backend developers and API teams to integrate RESTful APIs and services into mobile applications.',
      'Stayed updated with the latest trends and advancements in mobile development and Dart programming.',
    ],
    tags: ['Flutter', 'Dart', 'React.js', 'Vue.js', 'WordPress', 'REST APIs'],
  ),
  WorkExperienceModel(
    role: 'Flutter Developer – Internship',
    company: 'OneSala',
    location: 'Phnom Penh, Cambodia',
    period: 'Sept 2021 – April 2022',
    employmentType: 'Internship',
    isCurrent: false,
    responsibilities: [
      'Developed responsive UI components and screens for mobile applications using Flutter.',
      'Used GitLab for version control and contributed to team repositories via pull requests.',
    ],
    tags: ['Flutter', 'Dart', 'GitLab', 'UI/UX'],
  ),
];
