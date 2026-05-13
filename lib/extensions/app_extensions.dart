import 'package:flutter/material.dart';
import '../theme/app_styles.dart';

extension AppExtension on BuildContext {
  // Theme access
  ThemeData get _theme => Theme.of(this);
  Size get _size => MediaQuery.of(this).size;

  // Custom theme extensions
  AppStyles get appStyles => _theme.extension<AppStyles>()!;

  // Screen size
  double get width => _size.width;
  double get height => _size.height;

  // ThemeBloc
  bool get isDarkMode => _theme.brightness == Brightness.dark;
}
