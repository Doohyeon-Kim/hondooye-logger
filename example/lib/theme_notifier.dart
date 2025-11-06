import 'package:flutter/material.dart';
import 'package:hondooye_design_system/hondooye_design_system.dart';

class ThemeNotifier extends InheritedWidget {
  ThemeNotifier({super.key, required super.child});

  final ValueNotifier<ThemeData> theme = ValueNotifier(HdyLightTheme.themeData);

  void setLightMode() {
    theme.value = HdyLightTheme.themeData;
  }

  void setDarkMode() {
    theme.value = HdyDarkTheme.themeData;
  }

  static ThemeNotifier? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeNotifier>();

  void updateTheme(ThemeData theme) => this.theme.value = theme;

  @override
  bool updateShouldNotify(ThemeNotifier oldWidget) => oldWidget.theme != theme;
}
