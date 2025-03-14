import 'package:flutter/material.dart';
import '../models/movie_models.dart';
import '../colors/colors.dart'; // Import your color scheme
import '../consts/constants.dart'; // Import your constants

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath != null
        ? '${Constants.imagePath}${movie.posterPath}'
        : null; // No placeholder

    return Card(
      color: AppColors.surface, // Dark gray background
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      elevation: 4, // Add shadow
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: posterUrl != null
                  ? Image.network(
                posterUrl,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildFallbackPoster(); // Fallback UI
                },
              )
                  : _buildFallbackPoster(), // Fallback UI if posterUrl is null
            ),
            const SizedBox(width: 16),

            // Movie Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Title
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Rating and Release Date
                  Row(
                    children: [
                      // Rating Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.secondary, // Orange background
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.black, // Black icon
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Black text
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Release Date
                      Text(
                        'Release Date: ${movie.releaseDate}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.neutral, // Gray text
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Movie Overview
                  Text(
                    movie.overview,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white, // White text
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fallback UI for missing poster
  Widget _buildFallbackPoster() {
    return Container(
      width: 100,
      height: 150,
      color: AppColors.background, // Dark background color
      child: const Icon(
        Icons.movie, // Movie icon
        color: Colors.white,
        size: 40,
      ),
    );
  }
}