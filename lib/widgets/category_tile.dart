import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/colors.dart';

class CategoryTitle extends StatelessWidget {
  final String title;

  const CategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Smaller padding
      decoration: BoxDecoration(
        color: AppColors.primary, // Use primary color (#168E6A)
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: const Offset(-2, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(
        title,
        style: GoogleFonts.aBeeZee(
          fontSize: 18, // Smaller font size
          fontWeight: FontWeight.bold,
          color: AppColors.onPrimary, // White text
        ),
      ),
    );
  }
}