import 'package:Film_Finder/core/service/tmbd_api_service.dart';
import 'package:Film_Finder/model/movie_model.dart';

class MovieService {
  final TmbdApiService apiService;

  MovieService(this.apiService);
  Future<List<Movie>> getPopularMovies() {
    return apiService.fetchPopularMovies();
  }

  Future<List<Movie>> getTopRatedMovies() {
    return apiService.fetchTrendingMovies();
  }

  Future<List<Movie>> getTrendingMovies() {
    return apiService.fetchTopRatedMovies();
  }
  Future<List<Movie>> getNowPlayingMovies() {
    return apiService.fetchNowPlayingMovies();
  }
}
