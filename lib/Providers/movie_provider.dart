import 'package:Film_Finder/core/service/movie_service.dart';
import 'package:Film_Finder/core/service/tmbd_api_service.dart';

import 'package:Film_Finder/model/movie_model.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';

final tmbApiServiceProvider = Provider((ref) => TmbdApiService());
final movieServiceProvider =
    Provider((ref) => MovieService(ref.read(tmbApiServiceProvider)));

final popularMovieProvider = FutureProvider<List<Movie>>((ref) {
  final service = ref.read(movieServiceProvider);
  return service.getPopularMovies();
});

final trendingMovieProvider = FutureProvider<List<Movie>>((ref) {
  final service = ref.read(movieServiceProvider);
  return service.getTrendingMovies();
});

final topRatedMovieProvider = FutureProvider<List<Movie>>((ref) async {
  final movieService = ref.read(movieServiceProvider);
  return movieService.getTopRatedMovies();
});

final nowPlayingMovieProvider = FutureProvider<List<Movie>>((ref) async {
  final movieService = ref.read(movieServiceProvider);
  return movieService.getNowPlayingMovies();
});


