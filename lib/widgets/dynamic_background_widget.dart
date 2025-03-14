import 'package:flutter/material.dart';
import '../colors/colors.dart'; // Import your color scheme

class DynamicBackground extends StatefulWidget {
  final Widget child; // The child widget to display on top of the background

  const DynamicBackground({super.key, required this.child});

  @override
  State<DynamicBackground> createState() => _DynamicBackgroundState();
}

class _DynamicBackgroundState extends State<DynamicBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controls the animation
  late Animation<Color?> _animation; // Handles the color transition

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 10), // Animation duration
      vsync: this, // Ticker provider
    )..repeat(reverse: true); // Loop the animation forward and backward

    // Define the color animation
    _animation = ColorTween(
      begin: AppColors.primary, // Start color (#168E6A)
      end: AppColors.secondary, // End color (#FBB03B)
    ).animate(_controller); // Link the animation to the controller
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation, // Listen to the animation
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _animation.value!, // Animated color
                AppColors.background, // Background color (#292D32)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: child, // Display the child widget
        );
      },
      child: widget.child, // The child widget passed to DynamicBackground
    );
  }
}