import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Animation duration
    );

    // Fade animation for the text
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn, // Smooth fade-in effect
      ),
    );

    // Start the animation after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _controller.forward();
    });

    // Navigate to the next screen after 4 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black, // Black
              Colors.green[900]!, // Dark green
              Colors.yellow[700]!, // Yellow
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              "MoviePrime",
              style: TextStyle(
                fontSize: 40, // Large font size
                fontWeight: FontWeight.bold, // Bold text
                color: Colors.white, // White text color
                letterSpacing: 4.0, // Increased letter spacing
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.yellow, // Yellow shadow for a glowing effect
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}