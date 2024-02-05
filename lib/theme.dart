import 'package:flutter/material.dart';

class AppTheme {
  final primaryColor = const Color(0xFF9747FF);
  final outline = Colors.black54;

  late final appTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(0, 55),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: outline, width: 0.8),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}
