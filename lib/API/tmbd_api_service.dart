import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Film_Finder/model/movie_model.dart';

class TmbdApiService {
  final String _apiKey = 'ce379e7139aae723477a8e47ffb4e1dd';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchPopularMovies() async {
    try {
      final url = Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=en-US&page=1');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List results = data['results'];

        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        // This logs the actual API error response
        throw Exception(
          'TMDB API failed: ${response.statusCode} ${response.reasonPhrase}\n${response.body}',
        );
      }
    } catch (e, stackTrace) {
      // This logs the exact Dart-side error and stack
      print('Error fetching movies: $e');
      print('StackTrace: $stackTrace');
      rethrow; // rethrow so UI layer can handle it too
    }
  }
}