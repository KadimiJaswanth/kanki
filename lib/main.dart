import 'package:flutter/material.dart';
import 'package:kanki/screens/home_screen.dart';
import 'package:kanki/screens/HealthScreen.dart';
import 'package:kanki/screens/ProfileScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Data',
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFFF1F3F6),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black), // Updated
          headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.blueAccent),
          titleLarge: TextStyle(color: Colors.blueGrey),
          labelLarge: TextStyle(color: Colors.white),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFF212121),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white), // Updated
          headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          titleLarge: TextStyle(color: Colors.white70),
          labelLarge: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleThemeMode,
      ),
    );
  }

  void _toggleThemeMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }
}
