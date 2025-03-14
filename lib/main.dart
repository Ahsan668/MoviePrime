import 'package:flutter/material.dart';
import 'package:movie_app/screens/SplashScreen/splash_screen.dart';
import 'package:movie_app/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(), // Replace with your home screen
      },
    );
  }
}