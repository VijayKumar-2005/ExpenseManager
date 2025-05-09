import 'package:expensetracker/screens/GettingStarted_screens/onboarding_screen.dart';
import 'package:expensetracker/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sample expense tracker",
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
