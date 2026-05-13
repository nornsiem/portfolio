class ContactModel {
  final String email;
  final String phone;
  final String website;
  final String github;
  final String linkedin;
  final String telegram;

  const ContactModel({
    required this.email,
    required this.phone,
    required this.website,
    required this.github,
    required this.linkedin,
    required this.telegram,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
      github: json['github'] ?? '',
      linkedin: json['linkedin'] ?? '',
      telegram: json['telegram'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'website': website,
      'github': github,
      'linkedin': linkedin,
      'telegram': telegram,
    };
  }

  ContactModel copyWith({
    String? email,
    String? phone,
    String? website,
    String? github,
    String? linkedin,
    String? telegram,
  }) {
    return ContactModel(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      github: github ?? this.github,
      linkedin: linkedin ?? this.linkedin,
      telegram: telegram ?? this.telegram,
    );
  }
}
