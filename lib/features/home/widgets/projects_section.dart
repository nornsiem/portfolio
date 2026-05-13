import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfofio_web/config/app_config.dart';
import 'package:my_portfofio_web/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'E-Commerce App',
      'description':
          'Full-featured e-commerce application with Flutter and Firebase',
      'image': 'ecommerce',
      'technologies': ['Flutter', 'Dart', 'Firebase', 'Stripe'],
      'github': 'https://github.com/yourusername/ecommerce-app',
      'live': 'https://play.google.com/store/apps/details?id=yourapp',
    },
    {
      'title': 'Task Management System',
      'description': 'Enterprise task management with Java Spring Boot backend',
      'image': 'taskmanager',
      'technologies': ['Java', 'Spring Boot', 'React.js', 'PostgreSQL'],
      'github': 'https://github.com/yourusername/task-manager',
      'live': 'https://your-task-app.com',
    },
    {
      'title': 'Portfolio Website',
      'description': 'Responsive portfolio built with Flutter Web',
      'image': 'portfolio',
      'technologies': ['Flutter Web', 'Dart', 'Responsive Design'],
      'github': 'https://github.com/yourusername/portfolio',
      'live': 'https://yourportfolio.com',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      constraints: BoxConstraints(maxWidth: 1200),
      child: Column(
        children: [
          _buildSectionTitle('Featured Projects'),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: AppConfig.projects.map((project) {
              return _buildProjectCard(project);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(ProjectModel project) {
    return Container(
      width: 380,
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF64FFDA).withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image Placeholder
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(project.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFCCD6F6),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  project.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF8892B0),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 5,
                  children: List.generate(
                    project.technologies.length,
                    (i) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF64FFDA).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        project.technologies[i],
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: const Color(0xFF64FFDA),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    _buildProjectLink(
                      FontAwesomeIcons.github,
                      'GitHub',
                      project.gitlab,
                    ),
                    const SizedBox(width: 20),
                    _buildProjectLink(
                      FontAwesomeIcons.externalLinkAlt,
                      'Live Demo',
                      project.liveDemo,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectLink(IconData icon, String label, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          }
        },
        child: Row(
          children: [
            FaIcon(icon, color: const Color(0xFF64FFDA), size: 16),
            const SizedBox(width: 5),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF64FFDA),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
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
