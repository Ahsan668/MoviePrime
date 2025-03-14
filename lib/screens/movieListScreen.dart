import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_models.dart';
import 'package:movie_app/widgets/movie_card.dart';

import '../colors/colors.dart'; // We'll create this next

class MovieListScreen extends StatelessWidget {
  final String categoryTitle;
  final List<Movie> movies;

  const MovieListScreen({
    super.key,
    required this.categoryTitle,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieCard(movie: movie); // We'll create this next
        },
      ),
    );
  }
}