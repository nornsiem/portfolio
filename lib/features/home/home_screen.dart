import 'package:flutter/material.dart';
import 'package:my_portfofio_web/features/home/widgets/education_section.dart';
import 'package:my_portfofio_web/features/home/widgets/reference_section.dart';
import '../../common/utils/footer.dart';
import 'widgets/about_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/nav_bar.dart';
import 'widgets/projects_section.dart';
import 'widgets/skill_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Breakpoint to distinguish mobile vs desktop
  static const double _mobileBreakpoint = 768;

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleNavTap(String section) {
    switch (section) {
      case 'Home':
        _scrollToSection(_homeKey);
        break;
      case 'About':
        _scrollToSection(_aboutKey);
        break;
      case 'Skills':
        _scrollToSection(_skillsKey);
        break;
      case 'Experience':
        _scrollToSection(_experienceKey);
        break;
      case 'Projects':
        _scrollToSection(_projectsKey);
        break;
      case 'Contact':
        _scrollToSection(_contactKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0A192F),
          // Only attach endDrawer on mobile
          endDrawer: isMobile ? _buildDrawer(context) : null,
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  spacing: 32,
                  children: [
                    HeroSection(key: _homeKey),
                    AboutSection(key: _aboutKey),
                    SkillsSection(key: _skillsKey),
                    ExperienceSection(key: _experienceKey),
                    EducationSection(),
                    ProjectsSection(key: _projectsKey),
                    ReferencesSection(),
                    // ContactSection(key: _contactKey),
                    const Footer(),
                  ],
                ),
              ),
              NavBar(
                isMobile: isMobile,
                scrollController: _scrollController,
                onTap: _handleNavTap,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawer(BuildContext context) {
    const drawerBg = Color(0xFF0D2137);
    const accentColor = Color(0xFF64FFDA);
    const textColor = Colors.white;

    final List<Map<String, dynamic>> menuItems = [
      {'label': 'Home', 'icon': Icons.home_outlined},
      {'label': 'About', 'icon': Icons.person_outline},
      {'label': 'Skills', 'icon': Icons.code_outlined},
      {'label': 'Experience', 'icon': Icons.work_outline},
      {'label': 'Projects', 'icon': Icons.folder_open_outlined},
      {'label': 'Contact', 'icon': Icons.mail_outline},
    ];

    return Drawer(
      backgroundColor: drawerBg,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(width: 40, height: 2, color: accentColor),
                ],
              ),
            ),

            const Divider(color: Colors.white12, height: 1),
            const SizedBox(height: 8),

            // Menu Items
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 4,
                    ),
                    leading: Icon(
                      item['icon'] as IconData,
                      color: accentColor,
                      size: 22,
                    ),
                    title: Text(
                      item['label'] as String,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop(); // close drawer
                      _handleNavTap(item['label'] as String);
                    },
                    hoverColor: Colors.white10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),

            // Footer
            const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                '© 2025 My Portfolio',
                style: TextStyle(color: Colors.white38, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}