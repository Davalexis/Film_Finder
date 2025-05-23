import 'package:Film_Finder/API/tmbd_api_service.dart';
import 'package:Film_Finder/model/movie_model.dart';
import 'package:Film_Finder/repository/movie_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final tmbApiServiceProvider = Provider((ref) => TmbdApiService());
final movieRepositoryProvider =
    Provider((ref) => MovieRepository(ref.read(tmbApiServiceProvider)));

final popularMovieProvider = FutureProvider<List<Movie>>((ref) async {
  final repo = ref.read(movieRepositoryProvider);
return repo.getPopularMovies();
});
