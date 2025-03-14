import 'package:flutter/material.dart';
import '../../colors/colors.dart';// Import your color scheme

class AdvancedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(60); // Standard app bar height

  const AdvancedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 4, // Add shadow to the app bar
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
      title: Text(
        "MoviePrime",
        style: TextStyle(
          color: Colors.white, // Constant white color
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}