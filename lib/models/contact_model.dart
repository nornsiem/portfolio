class ContactModel {
  final String email;
  final String phone;
  final String website;
  final String github;
  final String linkedin;

  const ContactModel({
    required this.email,
    required this.phone,
    required this.website,
    required this.github,
    required this.linkedin,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
      github: json['github'] ?? '',
      linkedin: json['linkedin'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'website': website,
      'github': github,
      'linkedin': linkedin,
    };
  }

  ContactModel copyWith({
    String? email,
    String? phone,
    String? website,
    String? github,
    String? linkedin,
  }) {
    return ContactModel(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      github: github ?? this.github,
      linkedin: linkedin ?? this.linkedin,
    );
  }
}