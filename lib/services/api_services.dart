// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_models.dart';

class ApiService {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your OMDB API key
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List<Movie>> fetchMovies(String searchQuery) async {
    final response = await http.get(Uri.parse('$baseUrl$apiKey&s=$searchQuery'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data['Search'] != null) {
        List<dynamic> moviesJson = data['Search'];
        return moviesJson.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('No movies found');
      }
    } else {
      throw Exception('Failed to load movies');
    }
  }
}