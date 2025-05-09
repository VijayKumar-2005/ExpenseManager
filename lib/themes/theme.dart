import 'package:flutter/material.dart';
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF4CAF50),
  scaffoldBackgroundColor: Color(0xFFF5F5F5),
  cardColor: Color(0xFFFFFFFF),
  dividerColor: Color(0xFFE0E0E0),
  hoverColor: Color(0xFFF44336),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
    foregroundColor: Color(0xFF212121),
    elevation: 1,
    iconTheme: IconThemeData(color: Color(0xFF212121)),
    titleTextStyle: TextStyle(
      color: Color(0xFF212121),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF4CAF50),
    unselectedItemColor: Color(0xFF757575),
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF212121)),
    bodyMedium: TextStyle(color: Color(0xFF757575)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF4CAF50),
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.light(
    primary: Color(0xFF4CAF50),
    secondary: Color(0xFFFF9800),
    error: Color(0xFFF44336),
    surface: Color(0xFFFFFFFF),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Color(0xFF212121),
    onError: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF81C784),
  scaffoldBackgroundColor: Color(0xFF121212),
  cardColor: Color(0xFF1E1E1E),
  dividerColor: Color(0xFF2E2E2E),
  hoverColor: Color(0xFFE57373),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    elevation: 1,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF81C784),
    unselectedItemColor: Color(0xFFBDBDBD),
    backgroundColor: Color(0xFF1E1E1E),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Color(0xFFBDBDBD)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF81C784),
    foregroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF81C784),
    secondary: Color(0xFFFFB74D),
    error: Color(0xFFE57373),
    surface: Color(0xFF1E1E1E),
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onError: Colors.black,
  ),
);
