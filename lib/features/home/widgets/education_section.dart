// education_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfofio_web/config/app_config.dart';
import 'package:my_portfofio_web/models/education_model.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  static const double _mobileBreakpoint = 768;

  @override
  Widget build(BuildContext context) {
    final educationList = AppConfig.educations;

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
              ...educationList.asMap().entries.map((entry) {
                final index = entry.key;
                final edu = entry.value;
                final isLast = index == educationList.length - 1;
                return _EducationTimelineItem(
                  edu: edu,
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
          'Education',
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
class _EducationTimelineItem extends StatefulWidget {
  final EducationModel edu;
  final bool isLast;
  final bool isMobile;

  const _EducationTimelineItem({
    required this.edu,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<_EducationTimelineItem> createState() => _EducationTimelineItemState();
}

class _EducationTimelineItemState extends State<_EducationTimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
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
                    color: const Color(0xFF64FFDA),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF64FFDA).withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(width: 2, color: const Color(0xFF233554)),
                  ),
              ],
            ),
          ),

          SizedBox(width: widget.isMobile ? 16 : 24),

          // ── Card ──
          // Replace this in _EducationTimelineItemState.build():

          // ── Card ──
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.isMobile ? 16 : 40),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  // ✅ No fixed height — let content drive the size
                  padding: EdgeInsets.all(widget.isMobile ? 16 : 28),
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
                    mainAxisSize: MainAxisSize.min, // ✅ shrink-wrap the column
                    children: [
                      widget.isMobile
                          ? _buildHeaderMobile()
                          : _buildHeaderDesktop(),
                      const SizedBox(height: 8),
                      Text(
                        widget.edu.institution,
                        style: GoogleFonts.poppins(
                          fontSize: widget.isMobile ? 18 : 22,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFCCD6F6),
                        ),
                      ),
                      // const SizedBox(height: 6),
                      // Text(
                      //   '${widget.edu.degree} · ${widget.edu.fieldOfStudy}',
                      //   style: GoogleFonts.poppins(
                      //     fontSize: 12,
                      //     color: const Color(0xFF64FFDA),
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      Text(
                        widget.edu.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: widget.isMobile ? 13 : 14,
                          color: const Color(0xFF8892B0),
                          height: 1.6,
                        ),
                        // ✅ No maxLines — let it wrap freely
                        softWrap: true,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: Color(0xFF64FFDA),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Grade: ',
                            style: GoogleFonts.poppins(
                              fontSize: widget.isMobile ? 12 : 13,
                              color: const Color(0xFF8892B0),
                            ),
                          ),
                          Text(
                            widget.edu.grade,
                            style: GoogleFonts.poppins(
                              fontSize: widget.isMobile ? 12 : 13,
                              color: const Color(0xFFCCD6F6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Desktop: year badge left, location right in one Row ──
  Widget _buildHeaderDesktop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_yearBadge(), _locationRow(fontSize: 13)],
    );
  }

  // ── Mobile: year badge on top, location below ────────────
  Widget _buildHeaderMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _yearBadge(),
        const SizedBox(height: 8),
        _locationRow(fontSize: 12),
      ],
    );
  }

  Widget _yearBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF64FFDA).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF64FFDA).withOpacity(0.3)),
      ),
      child: Text(
        '${widget.edu.startYear} – ${widget.edu.endYear}',
        style: GoogleFonts.poppins(
          fontSize: widget.isMobile ? 12 : 13,
          color: const Color(0xFF64FFDA),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _locationRow({required double fontSize}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 14,
          color: Color(0xFF8892B0),
        ),
        const SizedBox(width: 4),
        Text(
          widget.edu.location,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            color: const Color(0xFF8892B0),
          ),
        ),
      ],
    );
  }
}
