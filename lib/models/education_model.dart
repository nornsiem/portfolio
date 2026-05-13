// education_model.dart
class EducationModel {
  final String institution;
  final String degree;
  final String fieldOfStudy;
  final int startYear;
  final int endYear;
  final String grade;
  final String description;
  final String location;

  EducationModel({
    required this.institution,
    required this.degree,
    required this.fieldOfStudy,
    required this.startYear,
    required this.endYear,
    required this.grade,
    required this.description,
    required this.location,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      institution: json['institution'],
      degree: json['degree'],
      fieldOfStudy: json['field_of_study'],
      startYear: json['start_year'],
      endYear: json['end_year'],
      grade: json['grade'],
      description: json['description'],
      location: json['location'],
    );
  }
}