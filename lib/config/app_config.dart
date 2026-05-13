import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_portfofio_web/models/contact_model.dart';
import 'package:my_portfofio_web/models/education_model.dart';
import 'package:my_portfofio_web/models/profile_model.dart';
import 'package:my_portfofio_web/models/project_model.dart';

class AppConfig {
  AppConfig._();

  static late ProfileModel profile;
  static late ContactModel contact;
  static late List<ProjectModel> projects;
  static late List<EducationModel> educations;

  static Future<void> init() async {
    final String jsonString = await rootBundle.loadString(
      'assets/config/app_config.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    profile = ProfileModel.fromJson(jsonMap['profile']);
    contact = ContactModel.fromJson(jsonMap['contact']);
    projects = (jsonMap['projects'] as List)
        .map((e) => ProjectModel.fromJson(e))
        .toList();
    educations = (jsonMap['education'] as List)
        .map((e) => EducationModel.fromJson(e))
        .toList();
  }
}
