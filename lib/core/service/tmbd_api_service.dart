import 'dart:convert';
import 'package:Film_Finder/model/actors_model.dart';
import 'package:http/http.dart' as http;
import 'package:Film_Finder/model/movie_model.dart';

class TmbdApiService {
  final String _apiKey = 'ce379e7139aae723477a8e47ffb4e1dd';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/movie/popular?api_key=$_apiKey&language=en-US&page=1'),
    );
    return parsedMovies(response);
  }

  Future<List<Movie>> fetchTrendingMovies() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/movie/trending?api_key=$_apiKey&language=en-US&page=1?api_key=$_apiKey&language=en-US&page=1'),
    );
    return parsedMovies(response);
  }

  Future<List<Movie>> fetchTopRatedMovies() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/movie/top_rated?api_key=$_apiKey&language=en-US&page=1'),
    );
    return parsedMovies(response);
  }

  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/movie/now_playing?api_key=$_apiKey&language=en-US&page=1'),
    );
    return parsedMovies(response);
  }



  // Fetch actors for a specific movie
Future<List<ActorModel>> fetchActorsForMovie(int movieId) async {
  final response = await http.get(
    Uri.parse(
      '$_baseUrl/movie/$movieId/credits?api_key=$_apiKey&language=en-US',
    ),
  );

  if (response.statusCode == 200) {
    final List cast = json.decode(response.body)['cast'];
    return cast
        .map<ActorModel>((json) => ActorModel.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load actors for movie $movieId');
  }
}







  List<Movie> parsedMovies(http.Response response) {
    if (response.statusCode == 200) {
      final List result = json.decode(response.body)['results'];
      return result.map<Movie>((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}


