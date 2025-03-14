import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/consts/constants.dart';
import 'package:movie_app/models/movie_models.dart';
import 'package:movie_app/screens/MovieDetailScreen.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<List<Movie>> snapshot;

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState != ConnectionState.done) {
      return const SizedBox(
        height: 300,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (snapshot.hasError) {
      return SizedBox(
        height: 300,
        child: Center(child: Text('Error: ${snapshot.error}')),
      );
    }

    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const SizedBox(
        height: 300,
        child: Center(child: Text('No trending movies found')),
      );
    }

    final movies = snapshot.data!;

    return CarouselSlider.builder(
      itemCount: movies.length,
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        viewportFraction: 0.55,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        enlargeCenterPage: true,
        pageSnapping: true,
      ),
      itemBuilder: (context, index, realIndex) {
        final movie = movies[index];
        final posterUrl = movie.posterPath != null
            ? '${Constants.imagePath}${movie.posterPath}'
            : Constants.placeholderImagePath;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(movie: movie),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                posterUrl,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.broken_image, color: Colors.white),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}