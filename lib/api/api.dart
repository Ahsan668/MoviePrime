import 'dart:convert';
import 'package:movie_app/consts/constants.dart';
import 'package:movie_app/models/movie_models.dart';
import 'package:http/http.dart' as http;
class Api{
  static const _trendingUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
  static const _topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  static const _upcomingUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
  if (response.statusCode == 200){
    final decodeData = json.decode(response.body)['results'] as List;

    return decodeData.map((movie) => Movie.fromJson(movie)).toList();
  } else {
    throw Exception('Something Happened');
  }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }
}