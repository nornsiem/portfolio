// models/work_experience_model.dart

class WorkExperienceModel {
  final String role;
  final String company;
  final String location;
  final String period;
  final String employmentType;
  final bool isCurrent;
  final List<String> responsibilities;
  final List<String> tags;

  const WorkExperienceModel({
    required this.role,
    required this.company,
    required this.location,
    required this.period,
    required this.employmentType,
    required this.isCurrent,
    required this.responsibilities,
    required this.tags,
  });
}