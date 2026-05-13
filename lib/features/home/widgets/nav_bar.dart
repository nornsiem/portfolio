import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfofio_web/common/constants/global_constants.dart';
import 'package:my_portfofio_web/config/app_config.dart';

class NavBar extends StatefulWidget {
  final Function(String) onTap;
  final ScrollController scrollController;
  final bool isMobile; // 👈 new

  const NavBar({
    super.key,
    required this.onTap,
    required this.scrollController,
    required this.isMobile, // 👈 new
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String _selectedItem = 'Home';
  bool _isScrolled = false;

  final List<String> _menuItems = [
    'Home',
    'About',
    'Skills',
    'Experience',
    'Projects',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      final shouldShow = widget.scrollController.offset > 20;
      if (shouldShow != _isScrolled) {
        setState(() => _isScrolled = shouldShow);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: AppConstants.appBarHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints(maxWidth: 1200),
        decoration: BoxDecoration(
          color: _isScrolled
              ? const Color(0xFF0A192F).withOpacity(0.95)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isScrolled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ── Logo ──────────────────────────────────────────
            Row(
              spacing: 8,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => widget.onTap('Home'),
                    child: Container(
                      padding: const EdgeInsets.all(2.5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFEB0000),
                            Color(0xFF95008A),
                            Color(0xFF3300FC),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/profile-image.jpg",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  AppConfig.profile.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),

            // ── Desktop nav links + Resume ────────────────────
            if (!widget.isMobile) ...[
              Row(
                children: _menuItems.map((item) {
                  final isSelected = _selectedItem == item;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _selectedItem = item);
                          widget.onTap(item);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isSelected
                                ? const Color(0xFF64FFDA).withOpacity(0.1)
                                : Colors.transparent,
                          ),
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: isSelected
                                  ? const Color(0xFF64FFDA)
                                  : const Color(0xFF8892B0),
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // Resume button
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    // Add resume download/url launch logic
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF64FFDA),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Resume',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xFF64FFDA),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],

            // ── Mobile hamburger ──────────────────────────────
            if (widget.isMobile)
              Builder(
                builder: (innerContext) => IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Color(0xFF64FFDA),
                    size: 28,
                  ),
                  onPressed: () => Scaffold.of(innerContext).openEndDrawer(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
