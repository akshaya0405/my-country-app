import 'package:flutter/material.dart';

abstract class ThemeState {}

class LightThemeState extends ThemeState {
  final ThemeData themeData = ThemeData.light();
}

class DarkThemeState extends ThemeState {
  final ThemeData themeData = ThemeData.dark();
}
