class ProjectModel {
  final String title;
  final String image;
  final String description;
  final List<String> technologies;
  final String gitlab;
  final String liveDemo;

  ProjectModel({
    required this.title,
    required this.image,
    required this.description,
    required this.technologies,
    required this.gitlab,
    required this.liveDemo,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      technologies: List<String>.from(json['technologies'] ?? []),
      gitlab: json['gitlab'] ?? '',
      liveDemo: json['live_demo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'technologies': technologies,
      'gitlab': gitlab,
      'live_demo': liveDemo,
    };
  }
}
