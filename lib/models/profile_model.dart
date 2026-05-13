class ProfileModel {
  final String name;
  final String title;
  final String location;
  final int experienceYears;
  final String bio;

  const ProfileModel({
    required this.name,
    required this.title,
    required this.location,
    required this.experienceYears,
    required this.bio,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      experienceYears: json['experience_years'] ?? 0,
      bio: json['bio'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'location': location,
      'experience_years': experienceYears,
      'bio': bio,
    };
  }

  ProfileModel copyWith({
    String? name,
    String? title,
    String? location,
    int? experienceYears,
    String? bio,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      title: title ?? this.title,
      location: location ?? this.location,
      experienceYears: experienceYears ?? this.experienceYears,
      bio: bio ?? this.bio,
    );
  }
}