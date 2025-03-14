import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/colors.dart';


class SeeAllButton extends StatelessWidget {
  final VoidCallback onTap;

  const SeeAllButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Smaller padding
        decoration: BoxDecoration(
          color: AppColors.secondary, // Use secondary color (#FBB03B)
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "See All",
              style: GoogleFonts.aBeeZee(
                fontSize: 14, // Smaller font size
                fontWeight: FontWeight.bold,
                color: AppColors.onSecondary, // Black text
              ),
            ),
            const SizedBox(width: 4), // Add spacing between text and icon
            const Icon(
              Icons.arrow_forward_ios,
              size: 14, // Smaller icon size
              color: AppColors.onSecondary, // Black icon
            ),
          ],
        ),
      ),
    );
  }
}